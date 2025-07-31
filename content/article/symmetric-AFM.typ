#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Symmetric Antiferromagnetic Hamiltonians",
  desc: [AKLT, Majumdar-Ghosh, and models that amaze me...],
  date: "2025-06-09",
  tags: (blog-tags.physics,),
)
#show link:underline
#import "@preview/physica:0.9.5":*
#import "@preview/theorion:0.4.0":*
#set math.equation(numbering: "(1)")
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/cetz:0.3.4"

Studying $S U(2)$ symmetric AFM Hamiltonians have triumphed in past decades, most notably Heisenberg model, AKLT model,
and so on. This note would try to treat AKLT model from the symmetry perspective.

= AKLT
#let vS = $arrow(S)$
$
  H_("AKLT") = sum_i^N [vS_i dot.c vS_(i+1) + 1/3 (vS_i dot.c vS_(i+1))^2]
$

Let me have some quick questions first.
1. Since the $S U(2)$ symmetry is enforced by the dot product $vS_i dot.c vS_(i+1)$, can this be generalized to for example
  the $(vS_i dot.c vS_(i+1))^3$?
2. How is the $1/3$ coefficient found? (Answered by the Projection construction)
// 3. Why AKLT should be defined on a Spin-1 system? Because Haldane Conjecture?

#link("https://zhuanlan.zhihu.com/p/5783560734")[Ref:AKLT on zhihu]

= Majumdar-Ghosh Model
Adding a next-nearest neighbor interaction $J' = 1/2 J$ to the Heisenberg model, we have the Majumdar-Ghosh model.
$
  H_("MG") = J sum_i [vS_i dot.c vS_(i+1) +1/2 vS_i dot.c vS_(i+2)]
$

We can write it to
$
  H_("MG") &= J/2 sum_i [vS_i dot.c vS_(i+1) + vS_(i+1) dot.c vS_(i+2) + vS_i dot.c vS_(i+2)]\
           &= J/4 sum_i [(vS_i + vS_(i+1) + vS_(i+2))^2 - 9/4]
$

So the ground state should be the state with $S_("tot")=1/2$ including the $i, i+1, i+2$-th sites.

This is a Clebsch-Gordan decomposition of the $S U(2)$ representation.

Consider the angular momentum addition of a 2-spin system and another spin, the former has, $s = 0,1$ , giving rise to
the total $s = 1/2, 3/2$.

Oh now it can be found in the table with $j_1= 1$ and $j_2 = 1/2$, and $j_1=0$, $j_2=1/2$.

#let upa = $scripts(arrow.t)$
#let downa = $scripts(arrow.b)$
#let ox = $times.circle$
$
  j_1 =1, j_2  &=1/2 "case" ket(j m)\

  ket(3/2 3/2) &= ket(upa upa) ox ket(upa)\
  ket(3/2 1/2) &= 1/sqrt(3)(ket(upa upa) ox ket(downa) + ket(upa downa) ox ket(upa) + ket(downa upa) ox ket(upa))\
  ket(1/2 1/2) &= 1/sqrt(6)(2 ket(upa upa) ox ket(downa)- ket(upa downa) ox ket(upa) - ket(downa upa) ox ket(upa))\
$
Note there's also $j_1 = 0$ $j_2 = 1/2$ case
$
  j_1 = 0, j_2 &= 1/2 "case" ket(j m)\
  ket(1/2 1/2) &= 1/sqrt(2)(ket(upa downa) ox ket(upa) - ket(downa upa) ox ket(upa))\
$

#note-box[
  The triplet based eigen-state
  $ket(psi_("triplet"))=1/sqrt(6)(2 ket(upa upa) ox ket(downa)- ket(upa downa) ox ket(upa) - ket(downa upa) ox ket(upa))$ and
  singlet-based eigen-state $ket(psi_("singlet"))=1/sqrt(2)(ket(upa downa) ox ket(upa) - ket(downa upa) ox ket(upa))$ #emph[looks like] energetically
  degenerated. Is that the case?
]

No, given by its translation property the triplet state can't be satisfied by nearby double spin-1/2 system. a single
translation will give:
$
  T ket(psi_("triplet")) = 1/sqrt(6)(2 ket(downa upa) ox ket(upa)- ket(upa upa) ox ket(downa) - ket(upa downa) ox ket(upa)) != e^(i phi) ket(psi_("triplet"))\
$

So the ground state is
$
  ket(Phi^((1))_("MG")) = times.circle.big_(i=1)^N 1/sqrt(2) (ket(upa_(2i-1) downa_(2i)) - ket(downa_(2i-1) upa_(2i)) )
$

Applying spin inversion symmetry
$
  ket(Phi^((2))_("MG")) = times.circle.big_(i=1)^N 1/sqrt(2) (ket(upa_(2i) downa_(2i+1)) - ket(downa_(2i) upa_(2i+1 )) )
$

= AKLT Model
Consider two spin-1 addition, which has total spin $s = 0,1,2$. We can use Casimir operator to classify the irreducible
representations.

To project into the
#let SdS = $vS_i dot.c vS_(i+1)$
$
  P_0 &= 1/12 (vS^2 -2) (vS^2 -6)= 1/3 (SdS)^2 -1/3 \
  P_1 &= -1/8 vS^2 (vS^2 - 6) = -1/2 (SdS)^2 -1/2 SdS +1\
  P_2 &= 1/24 vS^2 (vS^2 - 2) = 1/6 (SdS)^2 + 1/2 SdS +1/3\
$

Look at the $P_2$ term which projects into the $s=2$ state, give a positive energy contribution, we would effectively
project this out.

Here's the clever point, we can divide the spin-1 to two spin-1/2, and let the nearest neighbor states form singlet.
Thus, the onsite pair total spin is restricted to $s=0,1$.

In the neighbor spin-1/2 pair, we have
#cetz.canvas({
  import cetz.draw: *
  // Your drawing code goes here
  line((0, 0), (1, 0))
})
$= 1/sqrt(2)(ket(upa^r_j downa^l_(j+1)) - ket(downa^r_j upa^l_(j+1)))$

onsite $P_j = ket(+)bra(upa^l_j upa^r_j) + ket(0)(bra(upa^l_j downa^r_j)+bra(downa^l_j upa^r_j))/sqrt(2) + ket(-)bra(downa^l_j downa^r_j)$

The AKLT wavefunction:
$
  ket(Phi_("AKLT")) = times.circle.big_(j=1)^N P_j times.circle.big_(i=1)^N 1/sqrt(2) (ket(upa^l_(i) downa^r_(i+1)) - ket(downa^r_(i) upa^l_(i+1)) )\
$

This is a #emph[VBS] state, however existing in spin-1 system, and exactly solvable.
