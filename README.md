# Blog

ParaN3xus's template for static blogs, based on a previous version of [PoeMagie](https://github.com/Myriad-Dreamin/blog/), powered by [Astro](https://astro.build/), [DaisyUI 4](https://v4.daisyui.com/) and [typst](https://github.com/typst/typst).

## Features

- **Typst**: Write blog posts in [Typst](https://typst.app/).
- **Tags**: Categorize your blog posts with tags.
- **Link Preview**: Link Preview on Open Graph, Facebook, and Twitter.
- **Click Stats, Like Reaction, and Comment**: Powered by [Vercount](https://vercount.one/) and [giscus](https://giscus.app/).

Typst-specific features:

- Heading Permalinks and Table of Contents.
- Automatically generates yearly PDF archive.

## Commands

All commands are run from the root of the project, from a terminal:

| Command             | Action                                           |
| :------------------ | :----------------------------------------------- |
| `bun install`       | Installs dependencies                            |
| `bun run dev`       | Starts local dev server at `localhost:4321`      |
| `bun run build`     | Build your production site to `./dist/`          |
| `bun run preview`   | Preview your build locally, before deploying     |
| `bun run astro ...` | Run CLI commands like `astro add`, `astro check` |

## VSCode Setup

Open using the default setting:

```
code .vscode/blog.code-workspace
```

Or customize it:

```
cp .vscode/blog.code-workspace .vscode/blog.private.code-workspace
code .vscode/blog.private.code-workspace
```

Install suggseted extensions:

- `myriad-dreamin.tinymist`, for writing blog posts in typst.
- `astro-build.astro-vscode`, for developing astro components.

## Writing

Create a new blog post in [`content/article`:](https://github.com/ParaN3xus/blog-posts)

```typ
#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Title of the blog post",
  desc: [This is a test post.],
  date: "2025-04-25",
  tags: (
    blog-tags.misc,
  ),
)
```

The `blog-tags` index is defined in [`content/article/blog-tags.typ`](./typ/templates/mod.typ#L43) to ensure type safety. You can add your own tags by adding a new `blog-tags` index.

## Customization

- `.env`: Configuration read by files, Please check `defineConfig/env` in [astro.config.mjs](astro.config.mjs) for schema.
- [`src/consts.ts`](./src/consts.ts),[`src/components/BaseHead.astro`](./src/components/BaseHead.astro): global metadata, font resource declarations, and the head component.
- [`src/styles/*`](src/styles/): CSS styles.

## Todo

Improve experience:

- [ ] More friendly content submodule for forks

Improve website:

- [ ] [Last Modified Time](https://5-0-0-beta.docs.astro.build/en/recipes/modified-time/)
- [ ] Styling
  - [ ] Inline Raw
  - [ ] Blocky Raw
- [ ] Better [`theme-frame`](typ/templates/theme.typ)

## Credit

- This theme is based off of the lovely [PoeMagie](https://github.com/Myriad-Dreamin/blog/).
- The astro integration is supported by [astro-typst](https://github.com/overflowcat/astro-typst).
- The web styles are powered by [TailwindCSS](https://tailwindcss.com/) and [DaisyUI 4](https://v4.daisyui.com/).
- And, the lovely [typst](https://github.com/typst/typst).
