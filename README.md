[![INFORMS Journal on Computing Logo](https://INFORMSJoC.github.io/logos/INFORMS_Journal_on_Computing_Header.jpg)](https://pubsonline.informs.org/journal/ijoc)

# InfrastructureModels: Composable Multi-Infrastructure Optimization in Julia

This archive is distributed in association with the [INFORMS Journal on
Computing](https://pubsonline.informs.org/journal/ijoc) under a BSD license as part of the Multi-Infrastructure Control and Optimization Toolkit (MICOT) project at Los Alamos National Laboratory, LA-CC-13-108.

The software and data in this repository provides links to a snapshot of the software and data
that were used in the research reported on in the paper 
[InfrastructureModels: Composable Multi-Infrastructure Optimization in Julia](https://doi.org/10.1287/ijoc.2022.0118) by R. Bent, B. Tasseff and C. Coffrin.
The snapshot is based on the specific commits of the submodules linked to in the `src` directory.

**Important: This code is being developed on an on-going basis at submodules linked in the `src` directory. Please visit these repositories if you would like to get a more recent version or would like support**

## Cite

To cite the contents of this repository, please cite both the paper and this repo, using their respective DOIs.

[https://doi.org/10.1287/ijoc.2022.0118](https://doi.org/10.1287/ijoc.2022.0118)

[https://doi.org/10.1287/ijoc.2022.0118.cd](https://doi.org/10.1287/ijoc.2022.0118.cd)

Below is the BibTex for citing this snapshot of the respiratory.

```
@article{InfrastructureModels,
  author =        {Russell Bent and Byron Tasseff and Carleton Coffrin},
  publisher =     {INFORMS Journal on Computing},
  title =         {InfrastructureModels: Composable Multi-Infrastructure Optimization in Julia},
  year =          {2023},
  doi =           {10.1287/ijoc.2022.0118.cd},
  note =          {Available for download at https://github.com/INFORMSJoC/2022.0118},
}  
```

## Description

This Julia package, [InfrastructureModels](https://github.com/lanl-ansi/InfrastructureModels.jl), is an extensible, open-source mathematical programming framework for co-optimizing multiple interdependent infrastructures.
Leveraging the Julia mathematical programming [JuMP](https://jump.dev/) as a foundation, InfrastructureModels adds sector specific abstractions for critical infrastructure modeling and methods for combining multiple infrastructure sectors for co-optimization of such systems.


## Building

The InfrastructureModels packages are provided as Julia source code, which is complied Just-In-Time as part of the code execution process.  No explicit building is required.


## Results

The results folder includes CSV files of the raw data that is presented in the paper's figures.


## Replicating

A Julia v1.8 environment is provided in the `src` directory, which can be used to replicate the software package setting used in this paper.
The results presented in the paper can be replicated using the scripts that are provided in the `examples` subdirectories in the PowerWaterModels.jl and GasPowerModels.jl repositories.
To retrieve the source code for these packages, which are provided as Git submodules, execute the following:
```bash
git submodule update --init --recursive
```

To use the `src` folder as the project environment, execute
```bash
julia --project=src
```
Then, instantiate the project using
```julia
] instantiate
```

To replicate the GasPowerModels maximal load delivery (MLD) example results, execute the following:
```bash
julia --project="src" scripts/gaspowermodels-mld.jl
```
Select solution data will be written to the terminal.
Output from a prior execution has been stored in `results/gaspowermodels-mld.csv`.

To replicate the PowerWaterModels example, execute the following:
```bash
cd src/PowerWaterModels.jl
mkdir results
julia --project="../../src" examples/opwf.jl
```
Select solution data will be written to CSV files within the `results` directory.


## Ongoing Development

This code is being developed on an on-going basis at submodules linked in the `src` directory. Please visit these repositories if you would like to get the most recent version of the source code.


## Support

Support for InfrastructureModels is primarily handled through inquires on the Julia discussion forum under the [mathematical optimization subcategory](https://discourse.julialang.org/c/domain/opt/13). Posting issues on the github repositories is also a reasonable path to get support.


## License

This code archive is provided under a BSD license as part of the Multi-Infrastructure Control and Optimization Toolkit (MICOT) project, LA-CC-13-108.
