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
#import "@preview/modern-cv:0.8.0": *
#show link: underline

#show: resume.with(
  author: (
    firstname: "Xuanzhe",
    lastname: "Xia",
    email: "xzxia22@m.fudan.edu.cn",
    // homepage: "https://example.com",
    // phone: "(+1) 111-111-1111",
    github: "hz-xiaxz",
    // twitter: "typstapp",
    // scholar: "",
    // orcid: "0000-0000-0000-000X",
    // birth: "January 1, 1990",
    // linkedin: "Example",
    // address: "111 Example St. Example City, EX 11111",
    positions: (
      // "Software Engineer",
      // "Software Architect",
      // "Developer",
    ),
  ),
  profile-picture: none,
  date: datetime.today().display(),
  language: "en",
  colored-headers: true,
  show-footer: false,
  paper-size: "us-letter",
)

= Education

#resume-entry(
  title: "Fudan University",
  location: "Shanghai, China",
  date: "Sept. 2022 - June 2026 (expected)",
  description: "B.S. in Physics",
)

#resume-item[
  - GPA: 3.82/4.00, Rank: 5/75 (< 7%)
  - *Graduate Courses*: Quantum Mechanics Ⅱ (A), Group Theory (A), Solid State Physics Theory (A)
  - Selected Course Projects:
    1. *Percolation Model and Epidemic* in Prof. Xiaopeng Li's course. We investigated how the percolation model could capture the trend of epidemic spreading. We used the Markov Chain Monte Carlo method to numerically show the transition point of epidemic spread.
    2. *Failure of Neumann's Principle* in Prof. Yang Qi's course. We showed that the celebrated Neumann’s principle could be violated in non-equilibrium systems and in the context of Modern Theory of Polarization. We then suggested a modern extension of it.
    3. *Quantum Monte Carlo Explanation of Abraham-Minkowski Dilemma* in Prof. Lei Zhou's course. The AM dilemma debated the self-contained definition of photon momentum in the medium. We show by Variational Monte Carlo calculation that this dilemma aroses from the breakdown of effective medium approximation near the vacuum-medium interface.
]

#resume-entry(
  title: "University of California, Santa Barbara",
  location: "Santa Barbara, CA, US",
  date: "Sept. 2024 - Jan. 2025",
  description: "UCEAP program exchange student in Physics",
)

#resume-item[
  - GPA: 4.00/4.00, Dean's Honors
  - *Graduate Courses*: Quantum Field Theory (A), Many Body Problem (A+), Concepts in Condense Matter Physics (A+).
  - Selected Course Projects: 
    1. *Spin Liquids Meet Kagome Lattices: Competing Orders and Dirac Structures* in Prof. Sagar Vijay's course. I demonstrated the Dirac cone structure in Kagome lattice tight-binding model and made a thorough review of the Projective Symmetry Group construction of Slave Fermion mean field description towards U(1) Dirac Spin Liquid state in Kagome lattice.
    2. *Fractional Quantum Ferroelectricity* in Prof Dirk Bouwmeester's course. I reviewed the group theory approach to search for newly discovered Fractional Quantum Ferroelectricity materials.
]

= Research Projects

#resume-entry(
  title: "VMC/FFS simulation of 2D Anderson-Hubbard Model",
  location: "Fudan University, Shanghai, China",
  date: "June 2023 - July 2024",
  description: "Individual Project, Supervised by Prof. Xiaopeng Li",
  // title-link: "https://github.com/hz-xiaxz/FFS-julia",
)

#resume-item[
  - Investigated the insulator-metal phase transition in ​2D Anderson-Hubbard model, trying to resolve contradictions between ​dynamical mean-field theory (DMFT) observations of finite-size metallic phases and ​variational Monte Carlo (VMC) predictions. 
  - Developed a hybrid VMC framework integrating ​Fast Fermion Sampling (FFS) to reconcile discrepancies.
    - Implemented Fast Fermion Sampling (FFS), a sampling algorithm with ​*2×* efficiency gain over state-of-the-art methods for free Fermion sampling. Extended its utility to ​strongly correlated electron systems via re-weighting techniques.
    - ​Implemented FFS in Julia, optimizing memory allocation and using LAPACK to attain ​*15×* acceleration vs. legacy Python implementations. #github-link("https://github.com/hz-xiaxz/FFS-julia")
]

#resume-entry(
  title: "Detecting U(1) Dirac Spin Liquid State in Kagome Material",
  location: "UCSB, Santa Barbara, CA,US",
  date: "Sept. 2024 - Jan. 2025",
  description: "Individual Project, Supervised by Prof. Leon Balents",
)

#resume-item[
 - Analyzed $U(1)$ Dirac spin liquid states through gauge theory formalism, constructing mean-field ansatz via slave-fermion approach. Performed band structure calculations confirming Dirac cone formation in the reciprocal lattice.
 - Implemented unbiased Monte Carlo sampling to demonstrate energy preference of $U(1)$ Dirac spin liquid states over competing orders through comparative ground state analysis. #github-link("https://github.com/hz-xiaxz/KagomeDSL.jl")
]


=  Scholarships & awards

#resume-entry(
  title: "Huatai Securities Schoalrship",
  location: "Fudan University",
  date: "2024",
  description: "amount: 10,000 RMB, approximately $1400 USD",
)

#resume-item[
  Awarded to top 1 student in all physics undergraduates per year
]

#resume-entry(
  title: "FDUROP",
  location: "Fudan University",
  date: "2024",
  description: "amount: 10000 RMB, approximately $1400 USD",
)

#resume-item[
 Fudan's Undergraduate Research Opportunities Program (FDUROP), "VMC/FFS simulation for two-dimensional Anderson-
Hubbard Model,"
]

#resume-entry(
  title: "National Finals Outstanding Award (CUPT)",
  location: "Fudan University",
  date: "2024",
  description: "Research grant 4,000, approximately $600 USD",
)

#resume-item[
 China Undergraduate Physics Tournament (CUPT) is a Chinese analog to International Youth Physics Tournament (IYPT). As the leader of team, I won the special prize in national's final. This tournament has a research funding for my two projects: Upstream Flow and Oscillating Screw.
]

#resume-entry(
  title: "Secondary Scholarship for Fudan Students ",
  location: "Fudan University",
  date: "2023",
  description: "Research grant 5,000, approximately $700 USD",
)

= Conferences
#resume-entry(
  title: "Tunable Two-Dimensional Materials: Moiré and Beyond",
  location: "UCSB",
  date: "2024",
  // description: "Research grant 5,000, approximately $700 USD",
)
#resume-entry(
  title: "Numerical Methods in Quantum Many Body System",
  location: "Hangzhou, China",
  date: "2024",
  description: " Tensor Network and Quantum Monte Carlo Algoritms",
)
#resume-entry(
  title: "Artificial Intelligence and It's Application in Physics",
  location: "Hangzhou, Westlake University, China",
  date: "2024",
  // description: " Tensor Network and Quantum Monte Carlo Algoritms",
)
= Skills

#resume-skill-item(
  "Languages",
  (strong("Julia"), strong("Python"),"LaTeX", "Bash", "Typst"),
)




