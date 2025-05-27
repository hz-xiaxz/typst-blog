import { copyFileSync, existsSync, mkdirSync, watch, readdirSync, type FSWatcher } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import type { AstroIntegration } from 'astro';

const __dirname = dirname(fileURLToPath(import.meta.url));

interface AssetConfig {
  src: string;
  dest: string;
}

function copyDirectory(src: string, dest: string): void {
  if (!existsSync(src)) return;

  mkdirSync(dest, { recursive: true });

  const entries = readdirSync(src, { withFileTypes: true });

  for (const entry of entries) {
    const srcPath = join(src, entry.name);
    const destPath = join(dest, entry.name);

    if (entry.isDirectory()) {
      copyDirectory(srcPath, destPath);
    } else {
      copyFileSync(srcPath, destPath);
    }
  }
}

function copyAssets(): void {
  const assets: AssetConfig[] = [
    { src: 'content/article/assets', dest: 'public/post_assets' },
  ];

  assets.forEach(({ src, dest }) => {
    if (existsSync(src)) {
      console.log(`Copying ${src} to ${dest}`);
      copyDirectory(src, dest);
    } else {
      console.log(`Source directory ${src} does not exist, skipping...`);
    }
  });
}

export default function copyAssetsIntegration(): AstroIntegration {
  let watcher: FSWatcher | null = null;
  let isCleanedUp = false;

  return {
    name: 'copy-assets',
    hooks: {
      'astro:config:setup': ({ command }) => {
        console.log(`Running copy-assets integration in ${command} mode`);
        copyAssets();

        if (command === 'dev') {
          const watchPath = 'content/article/assets';

          if (existsSync(watchPath)) {
            console.log(`Setting up file watcher for ${watchPath}`);
            watcher = watch(watchPath, { recursive: true }, (eventType, filename) => {
              if (filename) {
                console.log(`File ${filename} changed (${eventType}), copying assets...`);
                copyAssets();
              }
            });
          }
        }
      }
    }
  };
}
