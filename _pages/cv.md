---
layout: archive
title: "Curriculum Vitae"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

<p>
  <a class="btn btn--inverse" href="{{ '/files/CV_single_page.pdf' | relative_url }}" download>
    Download as single-page PDF
  </a>
  <!--
  &nbsp;
  <a class="btn btn--inverse" href="{{ '/files/CV_full.pdf' | relative_url }}" download>
    Download full PDF
  </a>
  -->
</p>

Education
======
* **PhD in Theoretical Physics** at Institute of Science and Technology Austria (2018–2024)<br>
    Thesis: [*"Emergent physics of rotating quantum impurities in many-body environments"*](https://doi.org/10.15479/at:ista:19048)<br>
    Research focus: group theory, mathematical physics, numerical modelling, and PINNs. 
* **BSc in Applied Mathematics and Physics** at Moscow Institute of Physics and Technology (2014–2018)<br>
	Thesis: [*"Theory of plasmonic instabilities in MOSFETs with an asymmetric grating-gate"*](../files/BSc_Thesis.pdf)<br>
	Graduated with Honors (GPA 8.6/10), received Abramov and State Academic fellowships.

Experience
======
* **Researcher** at Institute of Science and Technology Austria (2018–present)
	* built neural-network solvers for differential equations in quantum few-body systems using reinforcement learning and Monte Carlo sampling
    * developed a universal group-theoretical framework for analyzing angular momentum exchange in optical systems, applicable to many research fields in physics
    * developed a symmetry-aware mathematical model for optical sensing of material chirality
    * formulated analytical models for controlling quantum many-body systems; assessed their feasibility numerically using variational methods
* **Undergraduate Researcher** at Moscow Institute of Physics and Technology (2016–2018)
	* developed a theoretical framework based on coupled partial differential equations to analyze plasmonic instabilities in nanostructured semiconductor systems
	* designed and maintained a MATLAB codebase for electrodynamics simulations of two-dimensional electron systems
* **Intern** at Helmholtz Zentrum Dresden-Rossendorf (summer 2017)
	* designed and optimized code for molecular dynamics simulations on an HPC cluster
* **Intern** at Deutsches Elektronen-Synchrotron, Hamburg (summer 2016)
	* developed MATLAB code for simulating crystallographic data using Monte Carlo method and comparing it to the experimental data from free-electron laser via Fourier analysis
* **Student Representative** at Institute of Science and Technology Austria (2019–2022)
	* designed curriculum and taught atomic and condensed matter physics to ~50 PhD students
	* managed curriculum and student infrastructure development (~500 PhD students)
	* organized networking and scientific outreach events
* **Teaching assistant** at Moscow Institute of Physics and Technology (2014–2019)
	* taught mathematics, physics and computer science to ~100 high-school students
  
Skills
======
* **Mathematics & modelling:** linear algebra, tensor calculus, probability theory, differential equations, mathematical physics, group theory, differential geometry, quantum algorithms
* **Numerical methods & ML:** Monte Carlo methods, variational methods, finite-difference methods, Fourier analysis, optimization, supervised and reinforcement learning
* **Programming:** Python (NumPy, SciPy, PyTorch), MATLAB, Wolfram Mathematica, bash
* **Computing:** vectorization, parallel computing, HPC, Linux, containerization, automation
* **Selected interests:** game theory, decision theory, auction theory; market making and risk management; macroeconomics and public policy


Publications
======
{% include publications-content.md show_buttons=false%}
<!--
<ul>{% for post in site.publications reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
  -->

Conferences
======
{% include conferences-content.md %}
<!--
  <ul>{% for post in site.conferences reversed %}
    {% include archive-single-conference-cv.html %}
  {% endfor %}</ul>
  -->
  
