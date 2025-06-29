#import "/typ/templates/blog.typ": *
#show: main.with(title: "Yao-Lee Model", desc: [Elegant Chinese work], date: "2025-06-29", tags: (blog-tags.physics,))
#import "@preview/physica:0.9.5": *
#import "@preview/theorion:0.3.3": *
#import cosmos.fancy: *
#show: show-theorion
#set-inherited-levels(1)
#set-zero-fill(true)
#set-leading-zero(true)
#set-theorion-numbering("1.1")
// 2. Other options:
#set-qed-symbol[#math.qed]
#set heading(numbering: "1.1")
#set text(lang: "en")

= Yao-Lee model
ref: https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.107.087205

Yao-Lee model is an exactly-solvable model that exhibits spin liquid in 2D. It is somewhat an extension to Kitaev honeycomb model.

It is defined on a *decorated-*honeycomb lattice

#figure(
  image("./decohoney.svg", height: 20%),
  caption: [the decorated-honeycomb lattice, where $i,j$ labels the triangle (regardless of the orientation, however nearest neighbor triangulars always has different orientation), $1,2,3$ labels the sites in triangles, and the type of inter-triangle bonds are labeled with $x,y,z$],
)

// #remark[
//   This is somewhat a micmic of AKLT model, hidden 3 spin $1/2$ freedom in each site, and I guess we would get a somewhat VBS order in the end
// ]

== Hamiltonian
#let Sb = $bold(S)$
#let Sbi = $Sb_i$
$
  cal(H) = J sum_i Sb_i^2 + sum_(lambda, expval(i j)) J_lambda [tau_i^lambda tau_j^lambda] [Sb_i dot Sb_j]
$
where we define $Sb_i = Sb_(i,1)+Sb_(i,2)+Sb_3$
#let Sbi1 = $Sb_(i,1)$
#let Sbi2 = $Sb_(i,2)$
#let Sbi3 = $Sb_(i,3)$
$
  tau_i^x &= 2 (Sbi1 dot Sbi2 +1/4) \
  tau_i^y &= 2/sqrt(3) (Sbi1 - Sbi2) dot Sbi3 \
  tau_i^z &= 4/sqrt(3) Sbi1 dot (Sbi2 times Sbi3)
$

=== Good quantum number:onsite total spin
We would prove that $[Sb_i^2, cal(H)]=0$
#lemma[
  $
    [Sbi^2,Sb_j] = 0
  $
]
#proof[
  First
  $
    [(S_i^lambda)^2, S_j^mu] &= delta_(i j) (S_i^lambda i epsilon^(lambda mu rho) S_i^rho + S_i^lambda S_i^mu S_i^lambda - S_i^mu (S_i^lambda)^2 )\
                             &= i delta_(i j) epsilon^(lambda mu rho) (S_i^lambda S_i^rho + S_i^rho S_i^lambda) \
                             &= i delta_(i j) epsilon^(lambda mu rho) delta_(lambda rho) \
                             &= 0
  $

  Next the crossing terms, lets ignore the site index for simplicity where $lambda != mu$ #footnote[why not begin with this formula...]
  $
    [S^lambda S^mu, S^rho] &= S^lambda S^mu S^rho - S^rho S^lambda S^mu \
                           & = i (epsilon^(mu rho nu) S^lambda S^nu + epsilon^(lambda rho nu)S^nu S^mu) \
  $

  Sum this with $lambda$ and $mu$
  $
    sum_(lambda, mu)[S^lambda S^mu, S^rho] = i S^nu (sum_mu epsilon^(mu rho nu) sum_lambda S^lambda
    + sum_lambda epsilon^(lambda rho nu) sum_mu S^mu) = 0 \
  $
]

#lemma[
  $
    [Sbi^2,tau_j^lambda] = 0
  $
]

#let Sx1 = $S^x_1$
#let Sx2 = $S^x_2$
#let Sx3 = $S^x_3$

#let Sy1 = $S^y_1$
#let Sy2 = $S^y_2$
#let Sy3 = $S^y_3$

#let Sz1 = $S^z_1$
#let Sz2 = $S^z_2$
#let Sz3 = $S^z_3$
#proof[
  $
    sum_(lambda,mu)[S^lambda S^mu, tau^x] &prop sum_(lambda, mu)[(S_1^lambda + S_2^lambda + S_3^lambda) (S_1^mu+S_2^mu +S_3^mu), sum_rho S_1^rho S_2^rho ] \
                                          &= sum_(lambda, mu, rho){ ([S_1^lambda S_2^mu, S_1^rho S_2^rho] + [S_2^lambda S_1^mu, S_1^rho S_2^rho]) + ([S_1^lambda, S_1^rho] S_2^rho S_3^mu + [S_1^mu,S_1^rho] S_3^lambda S_2^rho) + 1 <->2}
  $
  we know summing over one index of $epsilon$ gives 0, so the $1<->2$ and its original term vanishes
  $
    [S_1^lambda S_2^mu, S_1^rho S_2^rho] = i (epsilon^(mu rho nu) S_1^rho S_1^lambda S_2^nu + epsilon^(lambda rho nu) S_1^nu S_2^mu S_2^rho) \
  $
  epsilon terms vanishes... so $"LHS"=0$

  It goes similarly with $tau_i^y$

  The chirality term $tau_i^z$ would takes more effort, let's write the full expasion first.

  $S_1 dot (S_2 times S_3) &=
  (-Sx3 Sy2 + Sx2 Sy3) Sz1 + Sy1 (Sx3 Sz2 - Sx2 Sz3) +
  Sx1 (-Sy3 Sz2 + Sy2 Sz3)\
                          &= -Sz1 Sy2 Sx3 + Sz1 Sx2 Sy3 - Sy1 Sx2 Sz3 + Sy1 Sz2 Sx3 + Sx1 Sy2 Sz3 - Sx1 Sz2 Sy3\ $

  I'm tired and I think the summation of epsilon will lead us to the right way...
]

That tells us, the total spin of *each site* is a good quantum number.
#remark[
  Remember in AKLT, the total spin of each site is also conserved, thus we can project the local site into different spin sectors.
]

#remark[
  *Parton - the right way to solve frustration*

  Frustation is namely the case where two constraints can't be satisfied at the same time. If we divide the single site into seperate degrees of freedom, we can solve the frustration by satisfying each parton degree of freedom.
]

== Subspaces
With the conserved onsite total spin quantum number, we can divide the onsite Hilbert space into different subspaces.

#let ot = $times.circle$
#let oplus = $plus.circle$
$
  1/2 times.circle 1/2 ot 1/2 = 3/2 oplus 1/2 oplus 1/2
$

== $tau_i$ as Pauli matrices
$tau_i$ obeys $S U(2)$ algebra and Clifford algebra.

$
  [tau_i^lambda, tau_j^mu] &= 2i delta_(i j) epsilon^(lambda mu rho) tau_i^rho \
  {tau_i^lambda, tau_j^mu} &= 2 delta_(i j) delta^(lambda mu) \
$

I check this by CAS using `QuantumAlgebra.jl`

See `algebra.jl`

This implies $tau_i^lambda$ are indeed Pauli matrices within the $1/2 oplus 1/2$ subspace.

The four states can be labelled as $ket(sigma^z_i = plus.minus 1 tau^z = plus.minus 1)$ where $arrow(sigma) = 2 arrow(S)$, and $[tau_i^alpha,S_i^beta]=0$

#remark[
  What is the orbital meaning of $tau_i$?
]

In the remaining spin $3/2$ sector, $tau^z=tau^y = 0$, doesn't obey Pauli algebra.

== Perturbative Treatments
Let's assume $J>>J_lambda$ from now, then all sites should be in the $1/2 oplus 1/2$ subspace.

In this subspace,
$
  cal(H) = 1/4 sum_(lambda-"link", expval(i j)) J_lambda [tau_i^lambda tau_j^lambda] [Sb_i dot Sb_j] \
$
could be exactly solvable

== Majorana representation
#let cd = $c^dagger$

This is somewhat more difficult to understand, need to delve into Kitaev's famous paper a little bit...

=== Kitaev's Majorana representation
ref:https://arxiv.org/abs/cond-mat/0506438

Definition of Majorana Fermions could deviate in a minus sign, so we define here,
#definition[
  $
    c  &= 1/2 (gamma_1 + i gamma_2) \
    cd &= 1/2 (gamma_1 - i gamma_2) \
  $
]

We represent two Fermion modes in 4 Majorana modes, the 4 Majorana Fermions are called $b^x, b^y, b^z, c$

A simple observation is if we treat Majorana Fermions as independent degrees of freedom, the whole Hilbert space dimension is $2^4 = 16$, larger than the original 4 Fermion modes $c^dagger, c$. To deal with this, we need to impose a constraint on the Majorana modes.

#definition[
  Fermion Parity:
  $
    P = (-1)^N
  $
  where $N$ is the number of Fermions in the system, or equivalently, the number of $c^dagger c$ operators.

  Any Hamiltonian should commute with $P$, $[H,P] = 0$, since $H$ could never have odd number of Fermions.
]

The Majorana representation shall always satisfy the Fermion Parity.

Compute
$
  P = i gamma_1 gamma_2 = (c+cd)(c-cd) = cd c -cd c = 1- 2 cd c = (-1)^(cd c)
$
This is the Fermion Parity operator under Majorana representation.

#let bx = $b^x$
#let by = $b^y$
#let bz = $b^z$
The whole Parity operator is
$
  D = bx by bz c
$

This can be regarded as a *gauge transformation* for the group $ZZ_2$.

We follow the notation in Kitaev's paper, denote the extended Hilbert space as $tilde(cal(M))$, the physical Hilbert space is $cal(M)$. The $ZZ_2$ action is a cohomology class in $H^2(ZZ_2, cal(M))$.

#let Mt = $tilde(cal(M))$
The Pauli operators can then be written in $tilde(cal(M))$ space,
