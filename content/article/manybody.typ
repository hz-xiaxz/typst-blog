#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Many Body",
  desc: [Many Body Physics Note],
  date: "2025-05-31",
  tags: (blog-tags.physics,),
)
#import "@preview/physica:0.9.5": *
#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge
#import "@preview/theorion:0.4.0": *
#let colred(x) = text(fill: red, $#x$)
#let zh(content) = text(font: "Noto Sans CJK SC", content)
#set math.equation(numbering: "(1)")
#set heading(numbering: "1.1")
#import cosmos.clouds: *
#show: show-theorion

// #let title = "Many Body Theory"
// #let author = "Xuanzhe Xia"
// #let professor = ""
// #let creator = "Xuanzhe Xia"
// #let time = datetime.today().display()
// #let abstract = [This is a study note of many body theory. Topics will be selected out of my own interest.#zh("主题部分参考（抄写）知乎大黄猫老师的讲义，用英文是因为不用切输入法打字比较快。未经本人允许请勿传播。")It's
//   better to understand than to record. ]

#let feynman(body) = math.cancel(angle: 15deg, body)

= Basic Concepts
== Second Quantization
#definition[
  We introduce a convenient notation to unite Fermionic and Bosonic operators.
  $ xi = cases(1 " for Boson", -1 " for Fermion") $
]

Thus the action of annihilation operators and creation operators could be
#let ad(body)= $a^dagger_(body)$
#let comm(a, b) = $[a,b]_(xi)$
#let numstates = $ket(n_1 n_2 ...n_N)$
$
  ad(i) numstates &= xi^(sum_(j<i) n_j) sqrt(n_i+1) ket(n_1 n_2 ... n_i+1 ... n_N) \
  a_(i) numstates &= xi^(sum_(j<i) n_j) sqrt(n_i) ket(n_1 n_2 ... n_i-1 ... n_N) \
$
== Single Particle Reduced Density Matrix
#let psid(body) = $psi^dagger_(body)$
Suppose $ket(Psi)$ is single particle state.
$
  S(x,x') &= mel(Psi, psid(x') psi_(x), Psi)\
          &= mel(Psi, psid(x'), 0)mel(0, psi_(x), Psi)\
          &= phi.alt^*(x')phi.alt(x)
$
For many particle state
$ket(Psi) = ad(1)ad(2)..ad(N)ket(0)$, $psi(x) = sum_i a_i phi.alt(x)$
Thus
$ S(x,x') = 1/N sum_i phi.alt_i^*(x') phi.alt_i (x) $
Thus we can write
$ phi.alt(x_1, x_2) = 1/sqrt(2) mel(0, psid(x_1)psi_(x_2), Psi) = braket(x_1 x_2, Psi) $
This is how we introduce first-quantized wave function from second-quantized operators.

== Equal-time Correlation Function
Consider free Fermion system
$
  C(r_1,r_2 ) = N rho(r_1, r_2)= mel("FS", psid(r_1)psi_(r_2), "FS")\
  = sum_(k,k') phi.alt^*(k) phi.alt(k') e^(i(k-k') dot (r_1-r_2))
$

== Useful Identity
#theorem[
  $
    [A B,C D] = A [B,C]D+A C[B,D] + [A,C]D B+C [A,D]B
  $ <2-2-comm>
  $ [A, B C] = B[A,C]+ [A,B]C $
]

#theorem[
  BCH Formula
  $
    e^X e^Y = e^Z
  $
  where
  $
    Z = X + Y + 1/2 [X,Y] + 1/12 [X,[X,Y]] - 1/12 [Y,[X,Y]] + ...
  $

  If
  $
    [X,[X,Y]] = [Y,[X,Y]] = 0
  $
  then
  $
    Z = X + Y +1/2 [X,Y]
  $
]

#theorem[
  Alternative from BCH Formula
  $
    e^A B e^(-A) = B + [A,B] + 1/2! [A, [A,B]]+...
  $
  then we have
  $
    [e^A,B] = ([A,B] + 1/2! [A,[A,B]]+...)e^A
  $ <x-ex-formula>
]

== Jordan-Wigner Transform
#problem[
  Suppose $psi(x)$ is a Fermionic operator. Construct
  $
    psi'(x) = e^(i pi sum_(y<x)psi^dagger (y) psi(y)) psi(x)
  $
  Prove that
  + For all $x!=y$, $[psi'(x),psi'(y)]=0$, $[psi'(x),psi'^dagger (y)]=0$, and $[psi'^dagger (x),psi'^dagger (y)]=0$, thus $psi'(x)$ is
    a Bosonic operator.
]
#proof[
  Suppose,$x<y$. Use the @2-2-comm,
  $
    [A B,C D] = A [B,C]D+A C[B,D] + [A,C]D B+C [A,D]B
  $
  We denote
  $
    P(x) &= e^(i pi sum_(j<x)psi^dagger (j) psi(j))\
    m(x) &= sum_(j<x)psi^dagger (j) psi(j)
  $
  Calculate $[psi'(x),psi'(y)]$ first, the first term is
  $
    A[B,C]D = P(x) [psi(x),P(y)] psi(y)
  $
  We have @x-ex-formula, thus
  $
    [psi(x),P(y)] = [psi(x),e^(i pi m(y))] = -[e^(i pi m(y)), psi(x)]
  $
  $
    [m(y),psi(x)]         &= -psi(x) \
    [m(y), [m(y),psi(x)]] &= psi(x)\
    ...
  $
  Thus
  $
    [e^(i pi m(y)), psi(x)] = (e^(-i pi)-1)psi(x) P(y) = -2psi(x) P(y)
  $
  The first term is
  $ A[B,C]D = 2P(x)psi(x)P(y)psi(y) = 2psi'(x) psi'(y) $
  The second term is
  $
    A C[B,D] = P(x) P(y) [psi(x),psi(y)] = 2 P(x)P(y) psi(x)psi(y)
  $
  The third term is
  $
    [A,C]D B = [P(x),P(y)] psi(y) psi(x)
  $
  Since $[n_i,n_j] = 0$, $m(x),m(y)$ naturally commutes, hence $[P(x),P(y)] =0$

  The last term is
  $ C[A,D]B = P(y)[P(x),psi(y)]psi(x) $
  $
    [m(x),psi(y)] = -delta_(i y)psi(i)
  $
  However, as $x<y$, $[m(x),psi(y)] = 0$ Hence the last term is zero.

  Thus
  $
    [psi'(x),psi'(y)] &= 2 (P(x)P(y)psi(x)psi(y) + P(x)psi(x)P(y)psi(y))\
                      &= 2 P(x) {P(y),psi(x)} psi(y)
  $
  We know that $[psi(x), P(y)]=2psi(x)P(y)$ which implies ${P(y),psi(x)} =0$

  Hence, $[psi'(x),psi'(y)] = 0$. By conjugation $[psi'^dagger (x), psi'^dagger (y)]$ is proved

  Now we come to $[psi'(x),psi'^dagger (y)]$. The first term is
  $
    A[B,C]D = P(x) [psi(x),P^dagger (y)] psi^dagger (y)
  $

  $
    [m^dagger (y),psi(x)]                 &= psi(x)\
    [m^dagger (y), [m^dagger (y),psi(x)]] &= psi(x)\
    ...
  $
  Thus
  $ [P^dagger (y), psi(x)] = (e^(-i pi) -1) psi(x) P^dagger (y ) = -2 psi(x) P^dagger (y) $
  The first term is
  $
    A[B,C]D = 2 P(x) psi(x) P^dagger (y) psi^dagger (y) = 2 psi'(x) psi'^dagger (y)
  $
  The remaining terms are similar to the proof of $[psi'(x),psi'(y)]=0$, thus completing the whole proof.
]

= Jellium Model
#problem[
  Jellium model is a 3-dimensional electron gas with a uniform background of positive charge.

  The Hamiltonian is given by
  $
    H               &= H_(text("el")) + H_(text("bg")) + H_(text("int")) \
    H_(text("el"))  &= sum_(i=1)^(N) P_(i) / (2 m) + e^2 / 2 sum_(i,j) (e^(-mu abs(arrow(r_i) - arrow(r_j)))) / (abs(arrow(r_i) - arrow(r_j))) \
    H_(text("bg"))  &= e^2 / 2 integral dd(arrow(x), 3) dd(arrow(x)', 3) (n(arrow(x))n(arrow(x)') e^(-mu abs(arrow(x) - arrow(x)'))) / (abs(arrow(x) - arrow(x)')) \
    H_(text("int")) &= -e^2 sum_(i=1)^(N) integral dd(arrow(x), 3) integral dd(arrow(x), 3) (n(arrow(x))e^(-mu abs(arrow(x) - arrow(r_i)))) / (abs(arrow(x) - arrow(r_i))) \
  $

  where we take the column interaction as the Yukawa form
  $ V(r) = e^(-mu r) / r quad mu>0 $
  in order to avoid the divergence of the interaction at the origin. When $mu = 0$, it becomes the Coulomb interaction.

]

Assuming that the positive charge density is uniform, and have the same total charge as the electrons, we have
$ n(arrow(x)) = N / V $
The Yukawa interaction of background positive charge can be integrated out, and we have
$
  H_(text("bg")) &= e^2 / 2 (N / V)^2 integral dd(arrow(x), 3) dd(arrow(x)', 3) ( e^(-mu abs(arrow(x) - arrow(x)'))) /
  (abs(arrow(x) - arrow(x)'))\
                 & = e^2 / 2 (N / V)^2 V integral 4 pi r^2 dd(r) ( e^(-mu r)) / r\
                 & = e^2 / 2 N^2 / V (4 pi) / mu^2
$
Similarly,
$ H_(text("int")) = -e^2 N^2 / V (4 pi) / mu^2 $
where
#remark[
  $ H_(text("int")) = -2 H_(text("bg")) $
]

The
$H_(text("el"))$ term is better written in the second quantization, since it contains the kinetic energy term. $
  H_(text("el")) = sum_(k sigma) k^2 / (2m) c^(dagger)_(k sigma) c_(k sigma) + 1 / 2 sum_(k,k',q,sigma,sigma')
  c^(dagger)_(k+q sigma) c^(dagger)_(k'-q sigma') c_(k' sigma') c_(k sigma)
$ <H_el>

The fourier transform of Yukawa potential is well-known as $ V(q) = (4 pi) / V e^2 / (q^2 + mu^2) $
The most annoying part is when
$q=0$, the potential diverges. However it is shown to be cancelled by the background energy and the interaction energy.
Since $
  H_(text("el-int"))(q=0) = (4pi) / (2 mu^2 V) sum_(k,k',sigma,sigma') c^(dagger)_(k sigma) c^(dagger)_(k' sigma') c_(k'
  sigma') c_(k sigma)
$
By the anti-commutation relation, we have
$
  H_(text("el-int"))(q=0) &= colred(-) (4pi e^2) / (2 mu^2 V) sum_(k,k',sigma,sigma') c^(dagger)_(k sigma) c^(dagger)_(k'
  sigma') c_(colred(k sigma)) c_(colred(k' sigma'))\
                          & = - (4pi e^2) / (2 mu^2 V) sum_(k,k',sigma,sigma') c^(dagger)_(k sigma) (delta_(k,k') delta_(sigma,sigma')- c_(k
  sigma) c^(dagger)_(k' sigma')) c_(k' sigma')\
                          & = - (4pi e^2) / (2 mu^2 V) (N-N^2)
$
#remark[
  In thermodynamics limit, only $N^2$ term survives, and it cancels the $H_(text("bg"))$ and $H_(text("int"))$ term. This
  is also why we introduce the background charge density.
]

Thus @H_el is reduced to

#corollary[
  $
    H_(text("el")) = sum_(k sigma) k^2 / (2m) c^(dagger)_(k sigma) c_(k sigma) + 1 / (2V) sum_(k,k',q!=0,sigma,sigma')
    (4 pi e^2) / (q^2) c^(dagger)_(k+q sigma) c^(dagger)_(k'-q sigma') c_(k' sigma') c_(k sigma)
  $ <electron_gas_hamiltonian>
]

We can see the physics by making momentum dimensionless. The typical length is the Bohr radius
$a_0 = 1/(m e^2) $ (Gaussian unit) . Define $4/3 pi r_0^3 = V/N$, $r_0$ as the average distance between electrons.
Typically, for metals, $r_s =
r_0/a_0$ is around 2-6.

Let $overline(V) = V r_0^(-3)$ and $overline(k) = k r_0$, then $
  H_(text("el")) =e^2 / (2a_0r_s^2) ( sum_(overline(k) sigma) overline(k)^2 / (2m) c^(dagger)_(overline(k) sigma)
  c_(overline(k) sigma) + r_s / (overline(V)) sum_(overline(k),overline(k)',overline(q)!=0,sigma,sigma') (4 pi ) /
  (overline(q)^2) c^(dagger)_(overline(k)+overline(q) sigma) c^(dagger)_(overline(k)'-overline(q) sigma') c_(overline(k)'
  sigma') c_(overline(k) sigma) )
$ $text("Ry")= e^2/(2a_0)$ is the Rydberg energy as the energy scale of system.
#remark[
  When $r_s>>1$, perturbation theory is unfeasible. We can think that the electron is well-separated. Maybe a Wigner
  crystal is formed.
]

== Perturbation Calculation: Fock energy <Perturbation_calculation_fock>

The non-interacting ground state is a Fermi sea $ket(F)$. $ E_g^0 = 3/5 N E_F $
By perturbation theory, the ground state energy is
$ E_g = E_g^0 + mel(F, H_(text("el-int")), F) $ $H_(text("el-int")) $ can be decomposed by Wick's theorem.
#theorem[
  Wick's theorem
  $ G(1',2',3',dots,n',1,2,3,dots,n) = sum_(P) (-1)^(P) G(P(1'),1) G(P(2'),2) dots G(P(n'),n) $
]

Then we have $
  mel(F, H_(text("el-int")), F) = 1 / 2 sum_(k,k',q!=0,sigma,sigma') (4 pi e^2) / (q^2)\ (l delta_(q,
  0)theta(k_F-abs(k))theta(k_F-abs(k')) - delta_(sigma,sigma') delta_(k+q,k') theta(k_F-abs(k+q)) theta(k_F-abs(k')) )
$
#definition[

  The first term is called the direct term or #emph("Hartree term"), and the second term is called the exchange term or #emph("Fock term").
]

In our context, Hartree term is cancelled. Only Fock term survives and contributes a negative energy shift.

This two terms can also be drawn in the Feynman diagrams.
#align(center)[
  #grid(columns: 2, gutter: 0.5em, align(center)[
    #stack(spacing: 0.5em, diagram(
      edge((0, 0), (0, 1), $V(q=0)$, "wave"),
      node((0, 1), radius: 0.1em),
      edge((0, 1), (0, 1), $k, sigma$, "-|>", bend: -176deg),
      node((0, 0), radius: 0.1em),
      edge((0, 0), (0, 0), $k', sigma'$, "-|>", bend: 176deg),
    ), [Hartree term])
  ], align(center)[
    #stack(spacing: 2em, diagram(
      edge((0, 0), (2.5, 0), $V(q)$, "wave"),
      edge((0, 0), (2.5, 0), $k', sigma$, "-|>", bend: +90deg),
      edge((0, 0), (2.5, 0), $k+q, sigma$, "<|-", bend: -90deg),
    ), [Fock term])
  ])
]

#remark[
  Different from the calculation of scattering amplitude in high energy physics, in condensed matter physics, we are more
  interested in the #emph("vacuum diagrams"). The above two diagrams are all vacuum diagrams.
]

We can calculate the Fock term
$
  mel(F, H_(text("el-int")), F) &= -(4pi e^2 V) / (2 pi)^(6) integral dd(k, 3) theta(k_F-abs(k))integral dd(k', 3)
  theta(k_F-abs(k')) 1 / abs(k-k')^2\
                                & = -(4pi e^2 V) / (2 pi)^(6) integral_0^(k_F) 4pi k^2 dd(k) integral_(0)^(k_F) 2pi k'^2 dd(k') integral_(-1)^(1) dd(cos
  theta) 1 / (k^2+k'^2-2 k k'cos theta)\
                                & = -(4pi e^2 V) / (2 pi)^(6) integral_0^(k_F) 4pi k^2 dd(k) integral_(0)^(k_F) 2pi k'^2 dd(k') (-1 / (k k')) ln
  abs(k-k') / abs(k+k')\
                                & = (4pi e^2 V) / (2 pi)^(6) integral_0^(k_F) 4pi k dd(k) integral_(0)^(k_F) 2pi k'dd(k') ln abs(k-k') / abs(k+k')\
$
#problem[
  $ integral_(0)^(k_F) 2pi k'dd(k') ln abs(k-k') / abs(k+k') =? $
]
$
  integral_(0)^(k_F) 2pi k'dd(k') ln abs(k-k') / abs(k+k') &= integral_(0)^k 2pi k'dd(k') ln (k-k') / (k+k') +
  integral_(k)^(k_F) 2pi k'dd(k') ln (k'-k) / (k+k')
$
With the analytical form
$ integral dd(x) x ln (x-a) = - (a x) / 2 - x^2 / 4 -1 / 2 a^2 ln(a-x) +1 / 2 x^2 ln(-a+x) $
Write down all terms including the divergent part, hopefully they cancel out.
$
  2 pi& [ lr((k k' - 1/2 k^2 ln (k-k')/(k+k') + 1/2 k'^2 ln (k-k')/(k+k'))|)_(0)^(k) +\
    & lr((k k' - 1/2 k^2 ln (k'-k)/(k+k') + 1/2 k'^2 ln (k'-k)/(k+k'))|)_(k)^(k_F)
  ]\
      & = 2 pi [k k_F -1 / 2 k^2 ln (k_F-k) / (k_F+k) + 1 / 2 k_F^2 ln (k-k_F) / (k+k_F) ]\
      & = -2 pi k k_F [1+ (k_F^2-k^2) / (2k_F k) ln abs(k_F-k) / abs(k_F+k) ]
$
Hence we have
$
  mel(F, H_(text("el-int")), F) &= -2(2 pi)^2 (4pi e^2 V) / (2 pi)^(6) integral_0^(k_F) k^2 k_F dd(k) [1+ (k_F^2-k^2) /
  (2k_F k) ln
  abs(k_F-k) / abs(k_F+k) ]\
                                & = -2(2 pi)^2 (4pi e^2 V) / (2 pi)^(6) k_F^(4) integral_0^(1) x^2 dd(x) (1+(1-x^2) / (2x) ln abs(1-x) / abs(1+x) )\
$
where
$ integral_0^(1) x^2 dd(x) (1+(1-x^2)/(2x) ln abs(1-x)/abs(1+x) ) =1/2 $
Thus
$
  E_(text("Fock")) = -2(2 pi)^2 (4pi e^2 V) / (2 pi)^(6) k_F^(4) 1 / 2 = - (3e^2) / (4 pi) N k_F = -0.916 e^2 / (2a_0) N /
  r_s
$ <Fock_energy>

Which means the energy of 3d jellium electron gas is
#corollary[
  $ E = E_g / N = e^2 / (2a_0) (2.21 / r_s^2-0.916 / r_s) $
]

Note that with the assumption $r_s<<1$, the perturbation is valid.
#remark[
  The calculation of jellium model gives us a good approximation approach -- if your system is not too far from the
  jellium model, you can ignore the Hartree self energy term. This concept leads to the RPA (Random Phase Approximation)
  method.
]

== Wigner Crystal

#definition[
  #strong[Wigner crystal]

  If electron density is #emph[less] than a critical value, the jellium model electron gas will crystallize into a #strong[Wigner crystal].
]

Since I'm more familiar with Mott insulator, it seems that the Wigner crystal has much similarity with Mott insulator.
They both form when the potential energy dominates the kinetic energy and have strong localization of electrons.
However, their context differs. While Wigner crystal forms in continuous space, Mott insulator lives on a lattice
system. The Mott physics only have short range interaction, while the Wigner crystal has long range interaction (in
Hartree-Fock level, we didn't cut off the long range interaction).

#problem[
  What is the difference between the Wigner crystal and the Mott insulator?
]

I cannot currently have a good picture of the Wigner crystal. In Mott insulator with short range interaction, if we
perturb one electron (e.g. slightly shift its position), only the nearest neighbor electrons feel that and thus the
perturbation is #emph[local] and #emph[screened].

With some kind help from #link("https://www.zhihu.com/problem/717123704")[zhihu], now I would think Wigner crystal as
isolated oscillating electrons, while Mott insulator is a system electrons still having strong correlations. Part of the
reason is Mott insulator may still have the spin degree of freedom, while we would not say a Wigner crystal is "ferromagnetic"
or something.

However, with long rang interaction, I would possibly expect many local minima around the Wigner crystal. This sense
comes from the experience of thinking the #emph[Thompson Problem].

#definition[
  #strong[Thompson Problem]

  The Thompson problem is a problem of finding the minimum energy configuration of electrons on a sphere.

  As far as I know, few configurations are known to have determined lowest energy.
]

#problem[
  Is Wigner crystal stable?
]

If Wigner crystal has many local minima, it is unlikely to survive disorder and quantum fluctuation. Also, the
discussion of transportation is hard, since the configuration will vary with time.

A friend has told me since it's quite easy to compute the Wigner crystal by numerics, it's unlikely to have many local
minima. Maybe return to this problem if some day I have the chance to calculate it.

However, if the Wigner crystal is stable, it is a good candidate for the metal-insulator transition.

== CDW and SDW
If the electron density can be written as $
  n_(arrow.t)(arrow(r)) &= n / 2 +A cos(arrow(Q) dot arrow(r))\ n_(arrow.b)(arrow(r)) &= n / 2 +A cos(arrow(Q) dot
  arrow(r)+phi)
$
Then the system can form a ground state different from the magnetic etc. ones.

#definition[
  #strong[Charge Density Wave]

  if $phi=0$, the spin density $S^z (arrow(r)) = n_(arrow.t)(arrow(r)) - n_(arrow.b)(arrow(r)) = 0$, the charge density $n(arrow(r)) = n_(arrow.t)(arrow(r)) + n_(arrow.b)(arrow(r)) = n + 2A cos(arrow(Q) dot arrow(r))$ is
  periodic with wave vector $arrow(Q)$. We call this the #strong[Charge Density Wave].

  #strong[Spin Density Wave]

  If $phi=pi$, the spin density $S^z(arrow(r)) = n_(arrow.t)(arrow(r)) - n_(arrow.b)(arrow(r)) = 2A cos(arrow(Q) dot arrow(r))$ is
  periodic with wave vector $arrow(Q)$, the charge density $n(arrow(r)) = n_(arrow.t)(arrow(r)) + n_(arrow.b)(arrow(r)) = n $ is
  uniform. We call this the #strong[Spin Density Wave].

]

CDW breaks the translational symmetry, while SDW breaks the spin rotational symmetry and translational symmetry.

Experimentally, CDW can be observed by X-ray diffraction, while SDW can be observed by neutron diffraction.

== Hartree-Fock Approximation (Mean Field Theory)

#definition[
  #strong[Hartree-Fock Approximation (Mean Field Theory)]

  If the operator has non-zero expectation value, we can assume the fluctuation is small and decompose the two operators
  into the mean field and the fluctuation.

  $ A B approx expval(A) B + expval(B) A - expval(A) expval(B) $ <def:mean-field-approximation>
]

Revisit @electron_gas_hamiltonian, we can decouple the 4 operator terms into 2 terms. Possible decomposition is
$
    & expval(c^(dagger)_(k+q sigma) c^(dagger)_(k'-q sigma'))
$ <electron_pairing> $
    & expval(c^dagger_(k+q sigma) c_(k' sigma'))\
$ <Fock_term> $
    & expval(c^(dagger)_(k+q sigma) c_(k sigma))\
$ <Hartree_term>

@electron_pairing is actually the electron pairing term. This mean field approximation is called the
Hartree-Fock-Bogoliubov Approximation. @Hartree_term and @Fock_term are the Hartree term and the Fock term we have
discussed before.

#remark[
  Key Observation: By this Hamiltonian decomposition, we can achieve the same results from the perturbation theory
  (@Perturbation_calculation_fock).
]

#problem[
  Why the Hartree-Fock-Bogoliubov Approximation can't be achieved by the perturbation theory?
]

That's because we use the Fermi sea as the reference state. The Fermi sea without instability can't excite the electron
pairing term.

By Fock term, the interaction is now quadratic, and we can solve it exactly. $
  H_(text("el-int")) = -1 / V sum_(k,k',sigma) ((4pi e^2) / abs(k-k')^2 expval(c^(dagger)_(k' sigma) c_(k' sigma)))
  c^(dagger)_(k sigma) c_(k sigma)
$
Thus the Hamiltonian of electron gas is now
$
  H_(text("el")) = sum_(k) (k^2 / (2m) -1 / V sum_(k')(4pi e^2) / abs(k-k')^2 expval(c^(dagger)_(k' sigma) c_(k' sigma)))
  c^(dagger)_(k sigma) c_(k sigma)
$
Thus the single electron energy is
$ epsilon(k) = k^2 / (2m) - (2e^2k_F) / pi F(k / k_F) $
where
$F(x) = 1/2 +(1-x^2)/(4x) ln abs((1+x)/(1-x))$. This is consistent with the result from perturbation theory
@Fock_energy.

The velocity is $ v = lr(pdv(epsilon(k), k)|)_(k=k_F) = k_F / m - (2e^2) / pi F'(1) $
But
$F'(1)$ diverges, leading to the un-physical result of infinite Fermi velocity.

#remark[
  The Fermi velocity tells us how electrons near Fermi surface move. The infinite Fermi velocity is due to the unscreened
  long range Coulomb interaction.
]

== Thomas-Fermi Approximation

Thomas-Fermi Approximation is a semi-classical one. It considers high density ($r_s<<1$) limit, thus the electron
density is classical $n(arrow(x))$. The key difficulty in solving the jellium model is the kinetic energy term. It is
because of the existing of kinetic energy term that we need to do all things in momentum space. If we can treat the
kinetic energy term as a functional of $n(arrow(x))$, we can solve the problem in real space.

The Thomas-Fermi Approximation states, we can regard the kinetic energy term as the strong degenerate non-interacting
electron gas, where $ T_(text("TF"))[n(arrow(x))] = integral dd(arrow(x), 3) (3 (3pi^2)^(2 / 3)) / (10m) n(arrow(x))^(5
/ 3) $
Thus
$
  E_(text("TF"))[n(bold(x))] = C(n(bold(x)))^(5 / 3) - Z e^2 integral dd(bold(x), 3) 1 / abs(bold(x)) n(bold(x))+e^2 / 2
  integral dd(bold(x), 3) dd(bold(x)', 3) (n(bold(x)) n(bold(x)')) / abs(bold(x)-bold(x)')
$
with the constraint of the total number of electrons, add a Lagrange multiplier.
$ L[n(bold(x))] = E_(text("TF"))[n(bold(x))] = mu (integral dd(bold(x), 3) n(bold(x)) - N) $ $ pdv(L[n(bold(x))], n(bold(x))) = 0 = C
n(bold(x))^(2 / 3) - Z e^2 / abs(bold(x)) +e^2 integral dd(bold(x)', 3) ( n(bold(x)')) / abs(bold(x)-bold(x)') - mu $
#definition[
  The effective potential is
  $ phi(bold(x)) = C n(bold(x))^(2 / 3) $
]
$ phi(bold(x)) = Z e^2 / abs(bold(x)) -e^2 integral dd(bold(x)', 3) ( n(bold(x)')) / abs(bold(x)-bold(x)') + mu $
Take divergence on both sides, we have
$ laplacian phi(bold(x)) = 4pi e^2 (n(bold(x)) - Z delta(bold(x))) $
Thus we have the Thomas-Fermi equation
#definition[
  The Thomas-Fermi equation is
  $ laplacian phi(bold(x)) = 4pi e^2 ((phi(bold(x)) / C)^(3 / 2) - Z delta(bold(x))) $
]

== Screen Long Range Coulomb Interaction

Thomas Fermi Approximation tells us that the interacting system at high density can be treated as a non-interacting
system with an effective potential. This effective potential will affect the density of electron gas at first order.
Generally, we can iteratively apply the perturbation until the density converges. There's also another approach from
linear response theory to treat it.

Decompose the density into summation of occupation in
$bold(k)$ space. $ rho(arrow(x)) = -e f(epsilon_(bold(k))) $
where
$epsilon_(bold(k)) = (hbar^2 k^2) / (2m) - e phi.alt(bold(x)) $
Define
$ n_(0)(mu) = 1 / V sum_(bold(k)) (exp((hbar^2 k^2) / (2m) - mu) + 1)^(-1) $
The density is now
$ rho(bold(x)) = -e n_0(mu+e phi.alt(bold(x))) $
The "induced" density (or say perturbated) is
$
  rho^(text("induced"))(bold(x)) &= -e [n_0(mu+e phi.alt(bold(x))) - n_0(mu) ]\
                                 &= -e^2 pdv(n_0, mu) phi.alt(bold(x))
$ <eq:induced-density>

Remember the linear response theory in real space, $ phi.alt^(text("ext"))(bold(x)) = integral dd(x')
epsilon(bold(x)-bold(x')) rho(bold(x')) $
Do the Fourier transform,
$ phi.alt^(text("ext"))(bold(q)) = epsilon(bold(q)) rho(bold(q)) $
Generally we have
$ rho^(text("induced"))(bold(q)) = chi_c(bold(q)) phi.alt(bold(q)) $
Fourier transform the Possion equation,
$ q^2(phi.alt(bold(q))- phi.alt^(text("ext"))(bold(q))) = 4pi e^2 rho^(text("induced"))(bold(q)) $
Thus we have
#corollary[
  $ epsilon(bold(q)) = 1 - (4 pi) / q^2 chi_c (bold(q)) $
]

This can be directly achieved by the linear response theory.

Back to @eq:induced-density, we have
$ chi_c(bold(q)) = -e^2 pdv(n_0, mu) $
which leads to a non-trivial permittivity.
$ epsilon(bold(q)) = 1 - (4 pi) / q^2 chi_c(bold(q)) = 1 + (4 pi e^2) / q^2 pdv(n_0, mu) $
#definition[
  Thomas-Fermi wave vector is
  $ k_(text("TF"))^2 = (4 pi e^2) / q^2 pdv(n_0, mu) $
]

This non-trivial permittivity leads to the screening of long range Coulomb interaction.
$ phi.alt(bold(q)) = phi.alt^(text("ext"))(bold(q)) / epsilon(bold(q)) = ( 4pi Q) / (q^2+k_(text("TF"))^2) $
This is the Yukawa potential, which screens the long range Coulomb interaction. Because Thomas-Fermi wave vector is
approximately same order of
$k_F$. So the typical screening length is the same order of distance between electrons.

#remark[
  The Thomas-Fermi wave vector is proportional to the DOS at Fermi surface. If we have large DOS at Fermi surface (e.g.
  flat band), the screening length is short. If the DOS is small, or even zero like at the Dirac point, the screening
  length is long.
]

== Lindhard Function (RPA)
We can treat the $-e phi.alt(bold(x))$ as an perturbation

The wave function $ket(k) = 1/sqrt(V) e^(i bold(k) dot bold(x))$ after first order perturbation is $ ket(k^1) = ket(k)+
sum_(k') mel(k', -e phi.alt(bold(x)), k) / (epsilon_(bold(k))-epsilon_(bold(k'))) ket(k') $
where
$mel(k', -e phi.alt(bold(x)), k) = -e/V phi.alt(bold(k)-bold(k)')$
The induced density is
$ rho^(text("induced"))(bold(x)) = -e^2/V sum_(bold(k),bold(k)') f(epsilon_(bold(k))) e^(i (bold(k)-bold(k')) dot
bold(x)) / (epsilon_(bold(k))-epsilon_(bold(k'))) phi.alt(bold(k)-bold(k')) $
= QFT at $T=0$
I will try to follow AGD in this chapter, see how far I can go!

== Interaction picture
If we can divide the Hamiltonian as
$ H = H_(0) + H_(text("int")) $
where
$H_(0)$ is some Hamiltonian that is relevantly easier to deal with (e.g. the free part), $H_(text("int"))$ contains all
the interaction part.

#definition[
  #strong[unofficial definition]

  Interaction picture says that the state $ket(psi)$ evolves with $H_(text("int"))$ and the operator evolves with
  $H_(0)$.
]

Under interaction picture we have $ i pdv(, t)ket(psi_(I)(t)) = H_(text("int"))(t) ket(psi_(I)(t)) $ <eq:schrodinger-interaction> $ pdv(O(t), t) = 1/i [O(t),H_(0)] $
The schrodinger equation under interaction picture @eq:schrodinger-interaction can be solved perturbatively. From now on
we emit the
$I$ subscript for simplicity.

We write out $ket(psi(t))$ as a series: $ ket(psi(t)) = ket(psi^(0)(t)) + ket(psi^(1)(t)) + ket(psi^(2)(t)) + ... $ <eq:series-psi>

Suppose we know some $ket(psi(t_0))$ at $t=t_0$, in zeroth order where $H_(text("int"))=0$, we have $ ket(psi^(0)(t_0))
= ket(psi(t_0)) $
The first order perturbation is
$ ket(psi^(1)(t_0)) = -i integral_(t_0)^(t) dd(t') H_(text("int"))(t') ket(psi^(0)(t_0)) $
Similarly, the second order perturbation is
$ ket(psi^(2)(t_0)) = -i integral_(t_0)^(t) dd(t') H_(text("int"))(t') ket(psi^(1)(t_0)) = - integral_(t_0)^(t) dd(t_1)
H_(text("int"))(t_1) integral_(t_0)^(t_1) dd(t_2) H_(text("int"))(t_2) ket(psi(t_0)) $ $ ket(psi^(n)(t_0)) = -i
integral_(t_0)^(t) dd(t') H_(text("int"))(t') ket(psi^(n-1)(t_0)) $
#definition[
  The series is called the Dyson series.
]

Rewrite @eq:series-psi as
$ ket(psi(t)) = S(t,t_0) ket(psi(t_0)) $
where
$ S(t, t_0)&= 1-i integral_(t_0)^(t) dd(t_1) H_(text("int"))(t_1) + ... +(-i)^(n) / n! integral_(t_0)^(t) dd(t_1) ...
integral_(t_0)^(t_(n-1)) dd(t_n) H_(text("int"))(t_1) ... H_(text("int"))(t_n)\
         &= 1- i integral_(t_0)^(t) dd(t_1) H_(text("int"))(t_1) +...+ integral_(t>t_1>...>t_n> t_0) H_(text("int"))(t_1)
...H_(text("int"))(t_n) dd(t_1)...dd(t_n) $
Consider the case that time order
$t>t_1>...>t_n>t_0$ doesn't hold. We insert an operator $T$ which is the operation to keep the time order. Thus the
upper bound of each integral can be changed to $t$ with a price of $n!$ duplicate terms. $
  S^((n))(t,t_0)
  = (-i)^(n) / n! integral_(t_0)^(t) dd(t_1) ... integral_(t_0)^(t) dd(t_n) T[H_(text("int"))(t_1) ...
  H_(text("int"))(t_n)]
$
That the time evolution operator
$S(t,t_0)$ is the time-ordered exponential of $H_(text("int"))(t)$,
#definition[
  $ S(t,t_0) = T exp(-i integral_(t_0)^(t) dd(t') H_(text("int"))(t')) $
]

Note the Time-ordering operator behaves differently in Fermionic and Bosonic systems.
#corollary[
  In Bosonic system
  $ T[O_1(t_1)O_2(t_2)...O_N(t_N)]= O_(P_1)(t_(P_1)) O_(P_2)(t_(P_2))...O_(P_N)(t_(P_N)) $

  While Fermionic system there's an extra sign
  $ T[F_1(t_1)F_2(t_2)...F_N(t_N)] = (-1)^(P) F_(P_1)(t_(P_1)) F_(P_2)(t_(P_2))...F_(P_N)(t_(P_N)) $
]

= A Glimpse into Topology

== Why is Landau Level State an Ideal Topological Flat Band?

Ref. #link("https://zhuanlan.zhihu.com/p/581596244")[#zh("空扬笔记")]

#definition[
  The Hamiltonian of a free electron in a magnetic field is
  $
    H = 1/(2M) ( (hat(arrow(p))-arrow(A)(bold(r)))^2 ) + V(r)
  $
  where $hbar = e = 1$ and $V(r) = V(r+R)$ is periodical.
]

This Hamiltonian doesn't commute with the translation operator $cal(T)$, while it commutes with a #strong[magnetic translation operator] $cal(M)(bold(R))$ $
  cal(M)(bold(R), bold(r)) equiv e^(-i xi_(bold(R))(bold(r))) cal(T)(bold(R))
$
where
$xi_(bold(R))(bold(r))$ is defined as $ bold(A)(bold(r)+bold(R)) = bold(A)(bold(r))+ nabla xi_(bold(R))(bold(r)) $
Check that!
$
  [cal(T)(bold(R)),bold(A)^2(bold(r))]= bold(A)(bold(r)) cal(T)(bold(R)) bold(A)(bold(r)) - bold(A)^2(bold(r)) cal(T)(bold(R)) + bold(A)(bold(r)+bold(R)) dot bold(A)(bold(r))=2bold(A)(bold(r)) dot bold(A)(bold(r)+bold(R))\
$ $
  [cal(M)(bold(R),bold(r)),bold(p)^2] &= e^(-i xi_(bold(R))(bold(r))) bold(p)^2 cal(T)(bold(R))-bold(p) dot (-nabla
  xi_(bold(R))(bold(r)) e^(-i xi_(bold(R))(bold(r)))cal(T)(bold(R))) -bold(p) dot (e^(- i
  xi_(bold(R))(bold(r)))bold(p)cal(T)(bold(R)))\
                                      &=-i nabla^2 xi_(bold(R))(bold(r)) e^(-i xi_(bold(R))(bold(r))) cal(T)(bold(R)) - (nabla xi_(bold(R))(bold(r)))^2 e^(-i
  xi_(bold(R))(bold(r)))cal(T)(R)\
$ $
    &[cal(M)(bold(R), bold(r)), -bold(p) dot bold(A)(bold(r))- bold(A)(bold(r)) dot bold(p) + bold(A)^2(bold(r))]\ &=e^(-i
  xi_(bold(R))(bold(r)))[- bold(p) dot cal(T)(bold(R))bold(A)(bold(r)) -cal(T)(bold(R))bold(A)(bold(r)) dot bold(p) +
  cal(T)(R)bold(A)^2(bold(r))]\
    &- [ -bold(p) dot bold(A)(bold(r)) e^(-i xi_(bold(R))(bold(r)))cal(T)(bold(R))- bold(A)(bold(r)) dot bold(p) (e^(-i
  xi_(bold(R))(bold(r)))cal(T)(bold(R)))\
    &+bold(A)^2(bold(r))e^(-i xi_(bold(R))(bold(r)))cal(T)(bold(R))]\
    &= e^(-i xi_(bold(R))(bold(r))) [ -bold(p) dot bold(A)(bold(r)+bold(R))- nabla xi_(bold(R))(bold(r))dot bold(A)(bold(r))
  cal(T)(bold(R)) - bold(A)(r) dot nabla xi_(bold(R))(bold(r))cal(T)(bold(R))\
    &- bold(A)(bold(r)+bold(R)) dot bold(p) + 2 bold(A)(bold(r)) dot bold(A)(bold(r)+bold(R))]
$
The two terms cancel.

= BCS theory Is Deep

== BdG formalism

The BdG (Bogoliubov-de Genes) Hamiltonian can be derived from the negative U real space Hubbard model
#definition[
  Attractive Hubbard model
  $
    H = -t sum_(expval(i j), sigma) c^(dagger)_(i sigma) c_(j sigma) - U sum_i c^(dagger)_(i arrow.t) c_(i arrow.t) c^(dagger)_(i arrow.b) c_(i arrow.b)
  $
]

Using the mean field approximation introduced in @def:mean-field-approximation, we have the BdG Hamiltonian,
#definition[
  Define the order parameter $Delta_i = - U expval(c_(i arrow.b) c_(i arrow.t))$, because Cooper pair of Fermions condense
  at the ground state.

  Thus,
  $
    -U sum_i c^(dagger)_(i arrow.t) c_(i arrow.t) c^(dagger)_(i arrow.b) c_(i arrow.b) &= - U sum_i c^(dagger)_(i arrow.t) c^(dagger)_(i arrow.b) c_(i arrow.b) c_(i arrow.t)\
                                                                                       &approx sum_i (Delta_i c^dagger_(i arrow.t) c^dagger_(i arrow.b) + Delta_i^* c_(i arrow.b) c_(i arrow.t) + abs(Delta_i)^2/U)
  $
  which give the #strong[BdG Hamiltonian]
  $
    H_(text("BdG")) = -t sum_(expval(i j), sigma) c^(dagger)_(i sigma) c_(j sigma) + sum_i (Delta_i c^dagger_(i arrow.t) c^dagger_(i arrow.b) + Delta_i^* c_(i arrow.b) c_(i arrow.t) + abs(Delta_i)^2/U)
  $
]

If the system is uniform where
$Delta_i= Delta$, the Hamiltonian will be diagonalized in Fourier space
#let HBdG = $H_(text("BdG"))$
$
  #HBdG &= sum_(expval(i j) sigma) -t 1/N_s sum_(p,q) e^(i(-p r_i+q r_j))c^dagger_(p sigma) c_(q sigma) + Delta/N_s sum_i
  sum_(p,q) e^(-i (p+q)r_i) c^dagger_(p arrow.t) c^dagger_(q, arrow.b)\
        &+ Delta^* /N_s sum_i sum_(p,q) e^(i (p+q)r_i) c_(p arrow.b) c_(q arrow.t) + N_s abs(Delta)^2/U\
        &= -t sum_(k sigma) (sum_(delta r) e^(i k delta r)) c^dagger_(k sigma) c_(k sigma) + sum_k (Delta c^dagger_(k arrow.t)
  c_(-k arrow.b) + Delta^* c_(k arrow.b) c_(-k arrow.t)) + N_s abs(Delta)^2/U\
        &= sum_(k sigma) xi_k c^dagger_(k sigma) c_(k, sigma) + sum_k (Delta c^dagger_(k arrow.t) c_(-k arrow.b) + Delta^* c_(k
  arrow.b) c_(-k arrow.t)) + N_s abs(Delta)^2/U
$
The kinetic energy can be rewritten as
$
  sum_k xi_k c^dagger_(k sigma) c_(k sigma) = sum_k xi_k (c^dagger_(k sigma) c_(k sigma) - c_(-k sigma) c^dagger_(-k
  sigma) + 1)
$
#definition[
  Nambu Spinor in $k$ space
  $
    psi_k = vec(c_(k arrow.t), c^dagger_(-k arrow.b))
  $
]
Thus
$
  #HBdG = psi_k^dagger mat(xi_k, Delta;Delta^*, -xi_k) psi_k + N_s abs(Delta)^2/U + sum_k xi_k
$
The constant part
$sum_k xi_k$ can be dropped.

Write the $2 times 2$ matrix in the form of Pauli matrix $
  #HBdG = psi_k^dagger [epsilon_k tau_3 + Delta_1 tau_1+Delta_2 tau_2] psi_k + N_s abs(Delta)^2/U
$
where
$
  arrow(tau) = vecrow(tau_1, tau_2, tau_3) = vecrow(mat(0, 1;1, 0), mat(0, -i;i, 0), mat(1, 0;0, -1))
$
The notation
$tau$ is used to distinguish Pauli matrix in charge space from $sigma$ in spin space.

Thus $
  H = sum_k psi_k^dagger (arrow(h)_k dot arrow(tau)) psi_k + N_s abs(Delta)^2/U
$
where
$ arrow(h)_k = vecrow(Delta_1, Delta_2, xi_k) $
acts as a Weiss field
$B_k=-h_k$
#remark[
  The important thing is the Zeeman field here is momentum dependent.

  Unlike normal metals, the Weiss field of superconductor remains finite at the Fermi energy, giving rise to a gap in the
  excitation spectrum.
]

The energy gap is describe by the Weiss field, where
$
  E_(k) equiv abs(arrow(B)_k) = sqrt(abs(Delta_1)^2+abs(Delta_2)^2+xi_k^2) = text("quasi particle energy")
$
The gap is
$2E_k$
This gap is caused by non-zero density of Cooper pair at the ground state.

The Weiss field can be decomposed into magnitude and direction parts.
$
  arrow(B)_k &= - E_k hat(n)_k\
  hat(n)_k   &= vecrow(Delta_1/E_k, Delta_2/E_k, xi_k/E_k)
$
The direction can be described by the
$theta_k$ angle, $
  cos theta_k = xi_k/E_k
$
In the ground state the isospin is parallel to the field, which give the minimum energy of
$- arrow(B) dot arrow(tau)$. $ expval(psi_k^dagger arrow(tau) psi_k) = - hat(n)_k = -(sin theta_k, 0, cos theta_k) $
Here we choose the phase of
$Delta$, letting $Delta_2=0$
Thus we can represent all variables, with
$Delta$ and $theta_k$,
#let cd(body) = $c^dagger_(body)$
$
  expval(tau_(3 k)) = expval(n_(k arrow.t) + n_(-k arrow.b) -1) = - cos theta_k = - xi_k/(sqrt(xi_k^2+Delta^2))
$
$
  expval(tau_(1 k)) = expval(cd(k arrow.t) cd(-k arrow.b) + c_(-k arrow.b) c_(k arrow.t)) = Delta/(sqrt(xi_k^2+Delta^2))
$
#let upa = sym.arrow.t
#let downa = sym.arrow.b
and
$expval(tau_(2k))=0$ tells that $expval(cd(k arrow.t) cd(-k arrow.b)) = expval(c_(-k downa ) c_(k upa)) = -1/2 sin
theta_k $
Thus the consistent equation tells that
$
  Delta = - U expval(c_(i downa) c_(i upa)) = -U/N_s expval(sum_(p,q)e^(-i(p+q)r_i)c_(p downa)c_(q upa))
$
In uniform case,
$Delta = - U/N_s sum_i expval(c_(i downa) c_(i upa)) = -U/N_s sum_k expval(c_(k downa) c_(-k upa))$
Thus we have the self-consistent equation
#corollary[
  BCS gap equation at $T=0$
  $
    Delta = -U/N_s integral_(abs(xi_k)<omega_D) dd(k, [3])/(2pi)^3 Delta/(2sqrt(xi_k^2+Delta^2))
  $
]

== BdG Equation in Continuum
Ref. #link(
  "https://link.springer.com/book/10.1007/978-3-319-31314-6",
)[#strong("Bogoliubov-de Gennes Method and Its Applications")]

The BdG approach relies on the assumption that there exist well-defined quasi-particles in SC.
#remark[
  By Ref. BdG is correct in the weak-coupling regime, but also yields qualitative results in strong-coupling regime.
]
#let psid(body) = $psi^(dagger)_(body)$
#let rb = $bold(r)$
#let Ab = $bold(A)$
#let Veff = $V_(text("eff"))$
#definition[
  The attractive interaction Hamiltonian is
  $
    H = integral dd(rb)psid(alpha)(rb) h_(alpha)(rb)psi_(alpha)(rb) - 1/2 integral dd(rb)dd(rb') psid(alpha)(rb)
    psid(beta)(rb') Veff(rb, rb') psi_(beta)(rb') psi_(alpha)(rb)
  $
  where $h_(alpha)(rb)$ is the single particle Hamiltonian defined as
  $
    h_(alpha)(rb) = ([hbar/i nabla_(rb) + e/c Ab(rb)]^2)/(2m) - e phi(rb) +alpha mu_(B) H(rb)- mu
  $

  With the presence of vector potential, $h_(alpha)(rb)^* != h_(alpha)(rb) $
]

Note that in SC state the Hatree-Fock channel mean field can be absorbed into the chemical potential, we will only
consider the particle-particle pairing channel which terms #strong[Bogoliubov-Hatree-Fock] mean field approxiamation. In
case of s-wave superconductor, we only consider singlet-singlet pairing.

This gives the effective Hamiltonian
$
  H_(text("eff")) &= integral dd(rb) psid(alpha)(rb) h_(alpha)(rb) psi_(alpha)(rb) + integral integral dd(rb)dd(rb')
  [Delta(rb, rb') psid(alpha)(rb) psid(beta)(rb') + h.c.]\
                  &+ integral integral dd(rb) dd(rb') abs(Delta(rb, rb'))^2/(V_(text("eff"))(rb,rb'))
$
where
$
  Delta(rb, rb') = - Veff(rb-rb') expval(psi_(downa)(rb') psi_(upa)(rb))
$
#definition[
  Bogoliubov canonical transformation is helpful.
  $
    psi_(sigma)(rb) = sum_n [ u_(n sigma)(rb)gamma_(n) - sigma v_(n sigma) gamma^(dagger)_(n)]
  $
  where $gamma_n$ is a Fermionic operator. In lattice system the scope of $n$ is restricted by the lattice sites, while in
  continuum, $n$ can reach infinity as a field operator.
]

Suppose the Hamiltonian is diagonalized on the
$gamma_n$ basis,
#let Heff = $H_(text("eff"))$

$
  Heff = E_0 + sum_n E_n gamma^(dagger)_n gamma_n
$
#let gammand = $gamma^dagger_(n)$
#let gamman = $gamma_(n)$
Thus we have,
$
  [gammand, Heff] &= -E_n gammand\
  [gamman, Heff]  &= E_n gamman
$
These are the equations of motion (EOM) for
$gamman$, compared with the EOM of field operators $psi(rb)$, we have equations for $u_n$ and $v_n$.
#let hupr = $h_(upa)(rb)$
#let hdownr = $h_(downa)(rb)$
#let unupr = $u_(upa)^n (rb)$
#let undownr = $u_(downa)^(n) (rb)$
#let vnupr = $v_(upa)^n (rb)$
#let vndownr = $v_(downa)^n (rb)$

#let huprp = $h_(upa)(rb')$
#let hdownrp = $h_(downa)(rb')$
#let unuprp = $u_(upa)^n (rb')$
#let undownrp = $u_(downa)^(n) (rb')$
#let vnuprp = $v_(upa)^n (rb')$
#let vndownrp = $v_(downa)^n (rb')$
#let Deltarp = $Delta(rb, rb')$
#let Deltasrp = $Delta^*(rb,rb')$

$
  hupr unupr + integral dd(rb') Deltarp vndownrp             &= E_n unupr\

  hdownr undownr + integral dd(rb') Deltarp vnuprp           &= E_n undownr\

  integral dd(rb') Deltasrp undownrp - h^*_(upa)(rb) vnupr   &= E_n vnupr\

  integral dd(rb') Deltasrp unuprp - h^*_(downa)(rb) vndownr &= E_n vndownr
$
#problem[
  The $h^*$ here is a little bit weird.
]

The 4 equations can be block diagonalized to 2 sets of 2 equations, since only
$unupr$ and $vndownrp$ are coupled, so are $undownrp$ and $vnupr$.

#remark[
  This is such a messy formalism! I would stop here.
]

== Non-uniform BCS theory
=== Anderson Theorem
Ref. #link("https://zhuanlan.zhihu.com/p/15637929311")[#zh("大黄猫笔记")]

=== Non-uniform BdG
Ref. #link("https://zhuanlan.zhihu.com/p/19294551021")[#zh("大黄猫笔记")]

When system is non-uniform E.g. disorder and boundary condition kicks in.

Introduce Nambu Spinor with $2N_s$ components $
  hat(c)= vecrow(
    c_(1 arrow.t),
    c_(2 arrow.t),
    ..., c_(N_s arrow.t),
    c^dagger_(1 arrow.b),
    c^dagger_(2 arrow.b),
    ..., c^dagger_(N_s arrow.b),

  )
$
Thus
$#HBdG$ can be written as $
  #HBdG = hat(c)^dagger H hat(c) + sum_i abs(Delta_i)^2/U
$
Where
$ H = mat(hat(H)_0, hat(Delta);hat(Delta)^dagger, -hat(H)_0) $ $hat(Delta)$ is $N_s times N_s$ diagonal matrix for order
parameter, and $H_0$ is the tight-binding matrix.

#definition[
  The impurity Hamiltonian
  $
    H = sum_(expval(i j), sigma)[-t_(i j) - mu delta_(i j)] cd(i sigma) c_(j sigma) + sum_i Delta_i c^dagger_(i arrow.t) c_(i arrow.b) + H. c. +sum_sigma (epsilon.alt_I + J sigma) c^dagger_(I sigma) c_(I sigma)
  $
  where $epsilon.alt_I$ and $J$ are the strength of non-magnetic and ferromagnetic impurity scattering.
]
