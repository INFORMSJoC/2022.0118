[![INFORMS Journal on Computing Logo](https://INFORMSJoC.github.io/logos/INFORMS_Journal_on_Computing_Header.jpg)](https://pubsonline.informs.org/journal/ijoc)

# InfrastructureModels: Composable Multi-Infrastructure Optimization in Julia

This archive is distributed in association with the [INFORMS Journal on
Computing](https://pubsonline.informs.org/journal/ijoc) under a BSD license as part of the Multi-Infrastructure Control and Optimization Toolkit (MICOT) project at Los Alamos National Laboratory, LA-CC-13-108.

The software and data in this repository provides links to a snapshot of the software and data
that were used in the research reported on in the paper 
[This is a Template](https://doi.org/10.1287/ijoc.2019.0934) by R. Bent, B. Tasseff and C. Coffrin.
The snapshot is based on the specific commits of the submodules linked to in the `src` directory.

**Important: This code is being developed on an on-going basis at submodules linked in the `src` directory. Please visit these repositories if you would like to get a more recent version or would like support**

## Cite

To cite this software, please cite the [paper](https://doi.org/10.1287/ijoc.2019.0934) using its DOI and the software itself, using the following DOI.

[![DOI](https://zenodo.org/badge/285853815.svg)](https://zenodo.org/badge/latestdoi/285853815)

Below is the BibTex for citing this version of the code.

```
@article{CacheTest,
  author =        {R. Bent, B. Tasseff and C. Coffrin},
  publisher =     {INFORMS Journal on Computing},
  title =         {InfrastructureModels: Composable Multi-Infrastructure Optimization in Julia},
  year =          {2023},
  doi =           {TBD},
  url =           {https://github.com/INFORMSJoC/2022.0118},
}  
```

## Description

This Julia package, [InfrastructureModels](https://github.com/lanl-ansi/InfrastructureModels.jl), is an extensible, open-source mathematical programming framework for co-optimizing multiple interdependent infrastructures.
Leveraging the Julia mathematical programming [JuMP](https://jump.dev/) as a foundation, InfrastructureModels adds sector specific abstractions for critical infrastructure modeling and methods for combining multiple infrastructure sectors for co-optimization of such systems.


## Building

The InfrastructureModels packages are provided as Julia source code, which is complied Just-In-Time as part of the code execution process.  No explicit building is required.


## Results

TBD


## Replicating

A Julia v1.8 environment is provided in the `src` directory, which can be used to replicate the software package setting used in this paper.
The results presented in the paper can be replicated used in the scripts that are provided in the `examples` sub-directories in the PowerWaterModels.jl and GasPowerModels.jl repositories.


## Ongoing Development

This code is being developed on an on-going basis at submodules linked in the `src` directory. Please visit these repositories if you would like to get the most recent version of the source code.


## Support

Support for InfrastructureModels is primarily handled through inquires on the Julia discussion forum under the [mathematical optimization subcategory](https://discourse.julialang.org/c/domain/opt/13). Posting issues on the github repositories is also a reasonable path to get support.


## License

This code archive is provided under a BSD license as part of the Multi-Infrastructure Control and Optimization Toolkit (MICOT) project, LA-CC-13-108.