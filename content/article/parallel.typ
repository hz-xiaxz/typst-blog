#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Why multi-process is sometimes slower than single process",
  desc: [Cache is haunting you...],
  date: "2025-06-28",
  tags: (blog-tags.programming, blog-tags.physics),
)
= Unexpected low performance of large sparse matrix Lanczos
一个月前，在使用spin-ed这个包进行30格点海森堡模型的对角化的时候遇到过一个奇怪的困难，具体可以见这个 #link("https://github.com/twesterhout/spin-ed/issues/8")[issue]。

具体来说，一个稀疏矩阵的主要性能瓶颈是矩阵向量乘法的性能。然而在我的use case下面，90%以上的时间都花在了稠密矩阵运算上。和Gemini来回打了一圈仗之后，他认为这是在计算本征矢的时候出现了极其困难的求解问题。

在Gemini的指导下fine tune Primme这个库的多个参数，但都没有明显的提升，我意识到问题不出现在于这里，但也无法定位问题出在哪里。

这时候发现，在服务器A上稠密矩阵大量占用时间的时候，服务器B上稠密矩阵的计算时间却很少。这使我开始比较起来两者的CPU差别。

惊奇地发现，这个问题和服务器的numa绑定有关。A服务器的96核心事实上来自于4个物理CPU，每个CPU有24核心。由于我的稀疏矩阵过大，简单的并行会导致CPU之间的cache miss过多，导致性能下降。于是我在运行之前，先指定好使用的物理CPU，结果一下就回归了正常的稀疏矩阵运算比例。

这个故事告诉我们盲目地使用多进程并行化并不一定能带来性能提升，尤其是在处理大规模数据时。相反，合理地管理资源和理解底层硬件架构，才能真正发挥出计算的潜力。

= BLAS is haunting
在做蒙特卡洛的并行时，我会在自己的本地笔记本上跑一些简单的运算，但常常发现8核的并行速度甚至不如单核。

这个的原因是BLAS库本身就使用了多线程占用CPU，而我又在使用多线程的情况下调用BLAS库，导致了线程之间的竞争和资源浪费。
解决这个问题的办法是使用单线程的BLAS库，或者在调用BLAS库时设置线程数为1。

= Conclusion
即使你有一个高性能的笔记本或者服务器，也要聪明地使用！不要有钱任性（xx