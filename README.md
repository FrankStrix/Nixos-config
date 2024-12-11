<h2 align="center">:snowflake: FrankStrix's NixOS Config :snowflake:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-24.11-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://nixos.wiki/wiki/Flakes">
        <img src="https://img.shields.io/static/v1?label=Nix Flakes&message=Got 'em&style=for-the-badge&logo=nixos&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41"></a>
  </a>
</p>

Welcome to the repository for my NixOS configuration! This project contains the files and settings required to set up a custom NixOS system.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Repository Structure](#repository-structure)
- [Installation Guide](#installation-guide)
- [Contributing](#contributing)
## Introduction
NixOS is an operating system based on the Nix package manager, known for its declarative configuration and reliable dependency management. This repository includes:
Configuration files for the main machine.
Custom modules for specific settings..

## Requirements
To use this configuration, you will need:

- A machine compatible with NixOS.
- A USB stick or bootable drive with a NixOS image.
- Basic familiarity with the terminal and the Nix language.
## Repository Structure
Here is an overview of the repository structure:

```
etc/nixos/
|
├── modules/
|   ├── nixos/
|   |   ├── modules/                      # All the modules for the configuration
|   |   |  ├── aliases.nix                # The aliases of the bash
|   |   |  ├── bootloader.nix
|   |   |  ├── default.nix                # All this modules imported in this file
|   |   |  ├── display.nix
|   |   |  ├── env-var.nix
|   |   |  ├── hyprland.nix               # Enable hyprland
|   |   |  ├── localization.nix
|   |   |  ├── networking.nix
|   |   |  ├── packages.nix               # All the installed packages
|   |   |  ├── security.nix
|   |   |  ├── sound.nix
|   |   |  └── users.nix                  # Configuration for users, mine in this case
│   |   ├── configuration.nix             # Main system configuration
|   |   └── hardware-configuration.nix    # Auto-generated hardware configuration
|   ├── home-manager/
|   |  └── home.nix                       # Home manager file configuration
├── flake.nix                             # Nix Flakes configuration (optional)
├── flake.lock                            # Flake lock file
├── README.md                             # This file
└── LICENCE                               # Licence of this repo
```

## Main Files
- ```configuration.nix```: The main file defining system behavior.
- ```hardware-configuration.nix```: Auto-generated during NixOS installation, contains hardware-specific settings.
- ```home.nix```: Home manager configuration for declarative configurations
- ```flake.nix (optional)```: Configuration for Nix Flakes support.
# Installation Guide

### 1. install NixOS:

Download the NixOS image from the official [website](https://nixos.org/).
Follow the installation guide to set up your base system.

### 2. Clone this Repository:

```
git clone https://github.com/FrankStrix/Nixos-config nixos-configuration
cd nixos-configuration
```
### 3. Link Configuration Files:
Replace or integrate the existing configuration files with those from this repository:
```
sudo cp -r modules /etc/nixos/
sudo cp flake.nix /etc/nixos/
sudo cp flake.lock /etc/nixos/
```
### 4. Rebuild the System:
```
nixos-rebuild switch --flake /etc/nixos/#
```
### 5. Reboot the System:
```
sudo reboot
```
> ### Important 🚨 
>  Remeber to change all users.frank options or it will change your user in frank without a password!!
## Contributing
Contributions are welcome! If you have suggestions or want to add custom modules:

- Fork this repository.
- Create a new branch.
- Open a pull request with your changes.

**Thank you for exploring my NixOS configuration!
If you have questions or suggestions, feel free to open an Issue.**
