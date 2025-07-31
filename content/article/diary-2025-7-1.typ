#import "/typ/templates/blog.typ": *
#show: main.with(title: "2025-07-01-日记", desc: [阅读], date: "2025-07-01", tags: (blog-tags.diary,))
= PHYSICAL REVIEW X 14, 021010 (2024)
Quantum Electrodynamics in 2 + 1 Dimensions as the Organizing Principle of a Triangular Lattice Antiferromagnet 

Alexander Wietek ,1,2, Sylvain Capponi ,3 and Andreas M. Läuchli4,5

残暴的ED计算啊，

The S = 1/2 Kagome Heisenberg Antiferromagnet Revisited

给出 The ground state energy of the 48-site cluster is E/N J = −0.438 703 897 156

比DMRG低了0.5%，DMRG nb啊

实话说这篇文章看上去没有很大的意义？毕竟能量和DMRG其实差的不多，反对 $ZZ_2$。

但这个effective XY model看上去有意思，可能是Clark他们做工作的motivation

== Field theoretical approach
1. $Q E D_3$ with $N_f->infinity$, flow to a CFT fixed point

存在费米子的时候，*屏蔽效应*会将库仑相互作用从 $k/q^2$ dress 成 $k/(N_f abs(q))$，小q长波的行为被减弱

在IR上，$beta$ 函数有一个不动点
$
  beta^* = 8/N_f
$

2. $N_f=0$ famous result from Polyakov, confined phase.

3. $N_f = 4$, simulation not yet agreed

#figure(
  image("./medium.png"),
  caption: [Monte Carlo Study of Lattice Compact Quantum Electrodynamics with Fermionic Matter: The Parent State of Quantum Phases,Phys. Rev. X 9, 021022 – Published 2 May, 2019],
)

