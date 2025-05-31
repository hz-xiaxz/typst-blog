#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Personal Information",
  desc: [This is a test post.],
  date: "2025-04-25",
  tags: (
    blog-tags.misc,
  ),
  show-outline: false,
)

= About me

#include "/content/other/about.typ"

= 个人信息
TODO
