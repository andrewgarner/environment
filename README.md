# Environment

My development environment, powered by [Nix](https://nixos.org/).

## Getting started

Install Nix by running the following command:

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
```

Open a new terminal session and verify the `nix` executable is in your `$PATH`:

```shell
nix --version
```

## Installation

Run the following command to apply the configuration:

```shell
nix --experimental-features 'nix-command flakes' run nix-darwin -- switch --flake github:andrewgarner/environment
```
