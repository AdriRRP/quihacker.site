#!/usr/bin/env node

import { readdir, readFile } from "node:fs/promises";
import path from "node:path";

const root = path.resolve(process.argv[2] ?? "content");
const failures = [];
const warnings = [];

async function walk(directory) {
  const entries = await readdir(directory, { withFileTypes: true });
  const files = [];
  for (const entry of entries) {
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...await walk(target));
    if (entry.isFile() && entry.name.endsWith(".md")) files.push(target);
  }
  return files;
}

const urls = new Set();
for (const file of await walk(root)) {
  const content = await readFile(file, "utf8");
  for (const match of content.matchAll(/https?:\/\/[^\s<>"']+/g)) {
    const normalized = match[0].replace(/[\])},.;:!?]+$/, "");
    if (!normalized.startsWith("https://quihacker.site")) urls.add(normalized);
  }
}

async function check(url) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 20_000);
  try {
    const response = await fetch(url, {
      redirect: "follow",
      signal: controller.signal,
      headers: { "user-agent": "quihacker-site-link-audit/1.0" },
    });
    await response.body?.cancel();
    if (response.status >= 200 && response.status < 400) return;
    if ([401, 403, 405, 429].includes(response.status)) {
      warnings.push(`${response.status}\t${url}`);
      return;
    }
    failures.push(`${response.status}\t${url}`);
  } catch (error) {
    failures.push(`network\t${url}\t${error.message}`);
  } finally {
    clearTimeout(timeout);
  }
}

const queue = [...urls];
const workers = Array.from({ length: Math.min(8, queue.length) }, async () => {
  while (queue.length) await check(queue.shift());
});
await Promise.all(workers);

warnings.sort().forEach((warning) => console.warn(`warning\t${warning}`));
if (failures.length) {
  console.error(failures.sort().join("\n"));
  console.error(`Found ${failures.length} broken external links.`);
  process.exit(1);
}

console.log(`Checked ${urls.size} external links (${warnings.length} access-controlled).`);
