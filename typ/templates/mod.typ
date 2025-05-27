
#import "@preview/fletcher:0.5.7"
#import "target.typ": sys-is-html-target
#import "theme.typ": theme-frame
#import "@preview/shiroa:0.2.3": templates.get-label-disambiguator, plain-text

#let code-image = if sys-is-html-target {
  it => {
    theme-frame(theme => {
      set text(fill: theme.main-color)
      html.frame(it)
    })
  }
} else {
  it => it
}

/// Alternative resolves all heading as static link
///
/// - `elem`(content): The heading element to resolve
#let static-heading-link(elem) = context {
  let loc = here()
  let id = {
    "label-"
    str(get-label-disambiguator(loc, plain-text(elem)))
  }
  html.elem(
    "a",
    attrs: (
      "id": id,
      "data-typst-label": id,
      "href": "#" + id,
    ),
    "#",
  )
}

#let blog-tags = (
  linux: "Linux",
  network: "Network",
  free-ride: "Free Ride",
  arch: "Arch Linux",
  hyprland: "Hyprland",
  wayland: "Wayland",
  math: "Mathematics",
  concrete-math: "Concrete Mathematics",
  thinking: "Thinking",
  cpp: "C++",
  unicode: "Unicode",
  florr-io: "florr.io",
  probablities: "Probabilities",
  crack: "Crack",
  mathematica: "Mathematica",
  typst: "Typst",
  summary: "Summary",
  python: "Python",
  ai: "AI",
  pytorch: "PyTorch",
  onnx: "ONNX",
  graph-theory: "Graph Theory",
  nodejs: "Node.js",
  proxy: "Proxy",
  telegram: "Telegram",
  cloudflare: "Cloudflare",
  rl: "Reinforcement Learning",
  ocr: "OCR",
)

#let archive-tags = (
  blog-post: "Blog Post",
)
