# Home

My [Nix](https://nixos.org/) configuration.

## Getting started

Install Nix by running the following command:

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Open a new terminal session and verify the `nix` executable is in your `$PATH`:

```shell
nix --version
```

## Installation

Run the following command to activate the home configuration:

```shell
nix run github:andrewgarner/home#homeConfigurations.andrewgarner.activationPackage
```
