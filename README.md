# Nuxt NixOS performance reproduction
This is a repository to reproduce performance degradations on [NixOS](https://nixos.org) systems.

## Background
This repository is based on the [Nuxt starter](https://github.com/nuxt/starter/tree/v3) template, with slight modifications to work with a Nix development environment, such as the inclusion of a Nix flake in the repository.

## Instructions
This project _requires_ Nix/NixOS to be installed on a given system.

This project also requires the [`nix` command](https://nixos.org/manual/nix/stable/contributing/experimental-features#xp-feature-nix-command) and [Nix flakes](https://nixos.org/manual/nix/stable/contributing/experimental-features#xp-feature-flakes) experimental features to be enabled.

### Installation
`nix develop --impure`

The above command will install all of the relevant dependencies - [`devenv`](https://devenv.sh), NodeJS, a package manager in `pnpm`, as well as automatically installing all of the Node dependencies of the project.

### Reproduction
`pnpm run dev`

## Tested Machines
Lenovo P16s Gen 1 (AMD), AMD Ryzen 7 PRO 6850U (8c/16t), 32GB RAM, NixOS Unstable
------------------------------
- Operating System: Linux
- Node Version:     v22.3.0
- Nuxt Version:     3.9.3
- CLI Version:      3.12.0
- Nitro Version:    -
- Package Manager:  pnpm@9.3.0
- Builder:          -
- User Config:      devtools
- Runtime Modules:  -
- Build Modules:    -
------------------------------
