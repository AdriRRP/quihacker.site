#!/usr/bin/env node

import { readdir, readFile, stat } from "node:fs/promises";
import path from "node:path";

const root = path.resolve(process.argv[2] ?? "public");
const origin = "https://quihacker.site";
const failures = [];
let checked = 0;

async function walk(directory) {
  const entries = await readdir(directory, { withFileTypes: true });
  const files = [];
  for (const entry of entries) {
    const target = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...await walk(target));
    if (entry.isFile()) files.push(target);
  }
  return files;
}

async function isFile(candidate) {
  try {
    return (await stat(candidate)).isFile();
  } catch {
    return false;
  }
}

function pageUrl(file) {
  const relative = path.relative(root, file).split(path.sep).join("/");
  if (relative === "index.html") return `${origin}/`;
  if (relative.endsWith("/index.html")) {
    return `${origin}/${relative.slice(0, -"index.html".length)}`;
  }
  return `${origin}/${relative}`;
}

function extractReferences(html) {
  const references = [];
  const tag = /<!--[\s\S]*?-->|<\/?(?:script|style)\b[^>]*>|<[^>]+>/gi;
  const attribute = /\b(?:href|src)\s*=\s*(?:"([^"]*)"|'([^']*)'|([^\s>]+))/gi;
  let rawTextElement = null;

  for (const match of html.matchAll(tag)) {
    const markup = match[0];
    if (rawTextElement) {
      const closesRawText = rawTextElement === "script"
        ? /^<\/script\b/i.test(markup)
        : /^<\/style\b/i.test(markup);
      if (closesRawText) rawTextElement = null;
      continue;
    }
    if (markup.startsWith("<!--")) continue;

    for (const attributeMatch of markup.matchAll(attribute)) {
      references.push(attributeMatch[1] ?? attributeMatch[2] ?? attributeMatch[3] ?? "");
    }

    const opensRawText = /^<(script|style)\b/i.exec(markup);
    if (opensRawText) rawTextElement = opensRawText[1].toLowerCase();
  }
  return references;
}

function hasFragment(html, fragment) {
  const escaped = fragment.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  return new RegExp(`\\b(?:id|name)=["']?${escaped}(?:["'\\s>])`, "i").test(html);
}

const htmlFiles = (await walk(root)).filter((file) => file.endsWith(".html"));
for (const file of htmlFiles) {
  const html = await readFile(file, "utf8");
  for (const raw of extractReferences(html)) {
    if (!raw || /^(?:mailto:|tel:|javascript:|data:|\/\/)/i.test(raw)) continue;

    let url;
    try {
      url = new URL(raw.replaceAll("&amp;", "&"), pageUrl(file));
    } catch {
      failures.push(`${path.relative(root, file)}\tinvalid URL\t${raw}`);
      continue;
    }
    if (url.origin !== origin) continue;

    const decodedPath = decodeURIComponent(url.pathname);
    const target = path.join(root, decodedPath.replace(/^\/+/, ""));
    const candidates = [target];
    if (decodedPath.endsWith("/")) candidates.push(path.join(target, "index.html"));
    if (!path.extname(target)) candidates.push(`${target}.html`, path.join(target, "index.html"));

    const resolved = await Promise.all(candidates.map(async (candidate) => await isFile(candidate) ? candidate : null));
    const targetFile = resolved.find(Boolean);
    checked += 1;
    if (!targetFile) {
      failures.push(`${path.relative(root, file)}\tmissing target\t${raw}`);
      continue;
    }

    if (url.hash && targetFile.endsWith(".html")) {
      const fragment = decodeURIComponent(url.hash.slice(1));
      const targetHtml = targetFile === file ? html : await readFile(targetFile, "utf8");
      if (!hasFragment(targetHtml, fragment)) {
        failures.push(`${path.relative(root, file)}\tmissing fragment\t${raw}`);
      }
    }
  }
}

if (failures.length) {
  console.error(failures.join("\n"));
  console.error(`Found ${failures.length} broken internal references.`);
  process.exit(1);
}

console.log(`Checked ${checked} internal references across ${htmlFiles.length} HTML files.`);
