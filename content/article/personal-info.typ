#import "/typ/templates/blog.typ": *
#show: main.with(
  title: "Resume",
  desc: [My Academic Resume],
  date: "2025-06-01",
  tags: (
    blog-tags.misc,
  ),
  show-outline: false,
)
// #set text(font: "New Computer Modern", lang: "en", size: 11pt) // Or another common font like "Linux Libertine"
// #show link: it => underline(it)
// #set heading(numbering: none)

// --- Author Information ---
#block(width: 100%)[
  #align(center)[
    #text(size: 22pt, weight: "bold")[Xuanzhe Xia]
    #v(0.4em)
    #link("mailto:xzxia22@m.fudan.edu.cn")[xzxia22\@m.fudan.edu.cn] | GitHub: #link("https://github.com/hz-xiaxz")[hz-xiaxz]
    #v(0.4em)
    // #text(size: 10pt)[#datetime.today().display(date: "long")]
  ]
]
#v(0.5em)
#line(length: 100%, stroke: 0.5pt)
#v(1em)

// --- Education ---
= Education

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Fudan University] #h(1fr) #text(size: 10pt)[_Sept. 2022 - June 2026 (expected)_]
  ]
  #par[#text(size: 10pt)[_Shanghai, China_ | _B.S. in physics_]]
]
#par[]
- GPA: 3.82/4.00, Rank: 5/80 
- _Graduate Courses_: Quantum Mechanics Ⅱ (A), Group Theory (A), Solid State Physics Theory (A)
- Selected Course Projects:
  1. _Percolation Model and Epidemic_ in Prof. Xiaopeng Li's course. We investigated how the percolation model could capture the trend of epidemic spreading. We used the Markov Chain Monte Carlo method to numerically show the transition point of epidemic spread.
  2. _Failure of Neumann's Principle_ in Prof. Yang Qi's course. We showed that the celebrated Neumann’s principle could be violated in non-equilibrium systems and in the context of Modern Theory of Polarization. We then suggested a modern extension of it.
  3. _Quantum Monte Carlo Explanation of Abraham-Minkowski Dilemma_ in Prof. Lei Zhou's course. The AM dilemma debated the self-contained definition of photon momentum in the medium. We show by Variational Monte Carlo calculation that this dilemma aroses from the breakdown of effective medium approximation near the vacuum-medium interface.
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[University of California, Santa Barbara] #h(1fr) #text(size: 10pt)[_Sept. 2024 - Jan. 2025_]
  ]
  #par[#text(size: 10pt)[_Santa Barbara, CA, US_ | _UCEAP program exchange student in Physics_]]

  #par[#text(size: 10pt)[]]
]
- GPA: 4.00/4.00, Dean's Honors
- _Graduate Courses_: Quantum Field Theory (A), Many Body Problem (A+), Concepts in Condense Matter Physics (A+).
- Selected Course Projects:
  1. _Spin Liquids Meet Kagome Lattices: Competing Orders and Dirac Structures_ in Prof. Sagar Vijay's course. I demonstrated the Dirac cone structure in Kagome lattice tight-binding model and made a thorough review of the Projective Symmetry Group construction of Slave Fermion mean field description towards U(1) Dirac Spin Liquid state in Kagome lattice.
  2. _Fractional Quantum Ferroelectricity_ in Prof Dirk Bouwmeester's course. I reviewed the group theory approach to search for newly discovered Fractional Quantum Ferroelectricity materials.
#v(1em)

// --- Research Projects ---
= Research Projects

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[VMC/FFS simulation of 2D Anderson-Hubbard Model] #h(1fr) #text(size: 10pt)[_June 2023 - July 2024_]
  ]
  #par[#text(size: 10pt)[_Fudan University, Shanghai, China_]]
  #par[#text(size: 10pt)[_Individual Project, Supervised by Prof. Xiaopeng Li_]]
]
#par[]
- Investigated the insulator-metal phase transition in ​2D Anderson-Hubbard model, trying to resolve contradictions between ​dynamical mean-field theory (DMFT) observations of finite-size metallic phases and ​variational Monte Carlo (VMC) predictions.
- Developed a hybrid VMC framework integrating ​Fast Fermion Sampling (FFS) to reconcile discrepancies.
  - Implemented Fast Fermion Sampling (FFS), a sampling algorithm with ​_2×_ efficiency gain over state-of-the-art methods for free Fermion sampling. Extended its utility to ​strongly correlated electron systems via re-weighting techniques.
  - ​Implemented FFS in Julia, optimizing memory allocation and using LAPACK to attain ​_15×_ acceleration vs. legacy Python implementations. (#link("https://github.com/hz-xiaxz/FFS-julia")[GitHub])
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Detecting U(1) Dirac Spin Liquid State in Kagome Material] #h(1fr) #text(size: 10pt)[_Sept. 2024 - Jan. 2025_]
  ]
  #par[#text(size: 10pt)[_UCSB, Santa Barbara, CA,US_]]
  #par[#text(size: 10pt)[_Individual Project, Supervised by Prof. Leon Balents_]]
]
#par[]
- Analyzed $U(1)$ Dirac spin liquid states through gauge theory formalism, constructing mean-field ansatz via slave-fermion approach. Performed band structure calculations confirming Dirac cone formation in the reciprocal lattice.
- Implemented unbiased Monte Carlo sampling to demonstrate energy preference of $U(1)$ Dirac spin liquid states over competing orders through comparative ground state analysis. (#link("https://github.com/hz-xiaxz/KagomeDSL.jl")[GitHub])
#v(1em)

// --- Scholarships & awards ---
= Scholarships & awards

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Huatai Securities Schoalrship] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_Fudan University_]]
  #par[#text(size: 10pt)[_amount: 10,000 RMB, approximately \$1400 USD_]]
]
#par[]
- Awarded to top 1 student in all physics undergraduates per year
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[FDUROP] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_Fudan University_]]
  #par[#text(size: 10pt)[_amount: 10000 RMB, approximately \$1400 USD_]]
]
#par[]
- Fudan's Undergraduate Research Opportunities Program (FDUROP), "VMC/FFS simulation for two-dimensional Anderson-Hubbard Model,"
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[National Finals Outstanding Award (CUPT)] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_Fudan University_]]
  #par[#text(size: 10pt)[_Research grant 4,000, approximately \$600 USD_]]
]
#par[]
- China Undergraduate Physics Tournament (CUPT) is a Chinese analog to International Youth Physics Tournament (IYPT). As the leader of team, I won the special prize in national's final. This tournament has a research funding for my two projects: Upstream Flow and Oscillating Screw.
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Secondary Scholarship for Fudan Students] #h(1fr) #text(size: 10pt)[_2023_]
  ]
  #par[#text(size: 10pt)[_Fudan University_]]
  #par[#text(size: 10pt)[_Research grant 5,000, approximately \$700 USD_]]
]
#v(1em) // This entry has no items, so the v-space applies after the block.

// --- Conferences ---
= Conferences

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Tunable Two-Dimensional Materials: Moiré and Beyond] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_UCSB_]]
]
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Numerical Methods in Quantum Many Body System] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_Hangzhou, China_ | _Tensor Network and Quantum Monte Carlo Algoritms_]]
]
#v(1em)

#block(above: 0.6em, below: 0.1em)[
  #par[
    #strong[Artificial Intelligence and It's Application in Physics] #h(1fr) #text(size: 10pt)[_2024_]
  ]
  #par[#text(size: 10pt)[_Hangzhou, Westlake University, China_]]
]
#v(1em)

// --- Skills ---
= Skills

#par[
  #strong[Languages:] #h(1em) #strong[Julia], #strong[Python], LaTeX, Bash, Typst
]
#v(0.5em)