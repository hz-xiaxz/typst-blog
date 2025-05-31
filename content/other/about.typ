
#import "/typ/templates/mod.typ": sys-is-html-target

#let is-external = state("about:is-external", false)

#let self-desc = [
  我是夏轩哲，复旦物理系大三学生。感兴趣凝聚态理论，特别是实验相关的唯象学。我使用变分蒙特卡洛 (Variational Monte Carlo, VMC) 方法研究量子多体系统。

  我用 #link("https://julialang.org/")[julia] 语言编程。

  这个网站会当作日记使用，欢迎用任何方式跟我交朋友！

  #link("https://github.com/hz-xiaxz")[GitHub]
]

#if sys-is-html-target {
  {
    show raw: it => html.elem("style", it.text)
    ```css
    .self-desc {
      display: flex;
      flex-direction: row;
      gap: 4em;
      margin-block-start: -1em;
    }

    .self-desc .thumbnail-container {
      flex: 0 0 22em;
      border-radius: 0.5em;
      overflow: hidden;
    }

    .self-desc .thumbnail-container,
    .self-desc .thumbnail {
      width: 22em;
      height: 22em;
    }

    .thumbnail {
      --thumbnail-fg: var(--main-color);
      --thumbnail-bg: transparent;
    }

    .dark .thumbnail {
      --thumbnail-bg: var(--main-color);
      --thumbnail-fg: transparent;
    }

    @media (max-width: 800px) {
      .self-desc {
        flex-direction: column;
        align-items: center;
      }
      .self-desc .thumbnail-container,
      .self-desc .thumbnail {
        width: 100%;
        height: 100%;
      }
    }
    ```
  }

  let div = html.elem.with("div")
  let svg = html.elem.with("svg")

  let artwork = svg(
    attrs: (
      class: "thumbnail",
      xmlns: "http://www.w3.org/2000/svg",
      viewBox: "0 0 640 640",
    ),
    {
      let count-path() = {
        let data = str(read("/public/favicon.svg"))
        let fgs = regex("thumbnail-fg\d+")
        let bgs = regex("thumbnail-bg\d+")
        (data.matches(fgs).len(), data.matches(bgs).len())
      }

      let (fgs, bgs) = count-path()

      for i in range(bgs) {
        html.elem(
          "use",
          attrs: (
            "xlink:href": "/tylant/favicon.svg#thumbnail-bg" + str(i),
            style: "fill: var(--thumbnail-bg)",
          ),
        )
      }
      for i in range(fgs) {
        html.elem(
          "use",
          attrs: (
            "xlink:href": "/tylant/favicon.svg#thumbnail-fg" + str(i),
            style: "fill: var(--thumbnail-fg)",
          ),
        )
      }
    },
  )

  div(
    attrs: (
      class: "self-desc",
    ),
    {
      div(self-desc)
      context div(
        attrs: (
          class: "thumbnail-container link",
          title: "null",
          onclick: if is-external.get() {
            "location.href='https://www.myriad-dreamin.com/article/personal-info'"
          } else {
            "location.href='/article/personal-info'"
          },
        ),
        artwork,
      )
    },
  )
} else {
  self-desc
}
