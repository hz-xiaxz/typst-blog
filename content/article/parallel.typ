#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "多核并行，反而更慢？",
  desc: [线程，缓存和BLAS的幽灵……],
  date: "2025-06-28",
  tags: (blog-tags.programming, blog-tags.physics),
)
= 一次意外的性能瓶颈：Lanczos对角化
一个月前，在使用spin-ed这个包进行30格点海森堡模型的对角化的时候遇到过一个奇怪的困难，具体可以见这个 #link("https://github.com/twesterhout/spin-ed/issues/8")[issue]。

具体来说，一个稀疏矩阵的主要性能瓶颈是矩阵向量乘法的性能。然而在我的use case下面，90%以上的时间都花在了稠密矩阵运算上。和Gemini来回打了一圈仗之后，他认为这是在计算本征矢的时候出现了收敛问题。

在Gemini的指导下fine tune Primme这个库的多个参数，但性能并未获得明显改善。这让我意识到，问题的根源可能在别处。

一个关键的转折点是，我发现在服务器A上该问题稳定复现，但在服务器B上，稠密矩阵的计算时间却在正常范围内。这促使我开始详细比较两台服务器的硬件配置，特别是CPU架构。

调查发现，问题与服务器的 NUMA (非统一内存访问) 架构密切相关。服务器A的96个核心实际上由4个独立的物理CPU组成，每个CPU拥有24个核心。我的程序在默认情况下，会尝试利用所有96个核心，导致这个巨大的稀疏矩阵被分散到不同的物理CPU节点上处理。由于数据需要在不同CPU的内存和缓存之间频繁传输，引发了大量的缓存未命中（Cache Miss），从而导致了严重的性能下降。

找到原因后，解决方案就变得很清晰了。在运行程序前，我使用 numactl 工具将进程绑定到单个物理CPU的24个核心上。执行后，计算时间的分布立刻回归到了稀疏矩阵运算为主的正常比例。

这个经历表明，盲目地将并行任务扩展到所有可用核心，并不总能带来性能提升。尤其在处理跨越多个NUMA节点的大规模数据时，必须考虑硬件架构，否则数据局部性问题会抵消并行带来的收益。

= 另一个常见陷阱：嵌套并行
类似的问题也曾出现在我的本地笔记本上。在进行蒙特卡洛方法的并行化测试时，我发现8核并行的速度甚至不如单核运行。
经过排查，原因是 嵌套并行。许多科学计算库（如BLAS、MKL）为了最大化性能，其内部默认就是多线程的。当我的上层并行代码（MPI）调用这些库时，就形成了“进程并行”与“线程并行”的嵌套。这导致了线程的过度创建，大量CPU周期被浪费在线程调度和资源竞争上，性能不升反降

解决方法很简单：在执行程序前，通过设置环境变量来禁用底层库的多线程。
```bash
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export BLAS_NUM_THREADS=1
```

在一些情况下，取决于线性代数矩阵的大小，适当地释放一些线程给BLAS也是有益的。

经过这样优化，我的程序真正获取了96核CPU的野兽性能优势。

= 总结 
这两次经历都说明了同一个道理：并行计算的性能优化，远不止增加核心数量那么简单。无论是服务器还是个人电脑，充分理解软件、算法库与底层硬件架构之间的交互关系，并据此制定合理的资源管理策略，才是发挥计算潜力的关键。