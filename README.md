<h2 align="center">:snowflake: FrankStrix's Nix Config :snowflake:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

<p align="center">
    <a href="https://nixos.org/">
        <img src="https://img.shields.io/badge/NixOS-24.11-informational.svg?style=for-the-badge&logo=nixos&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41"></a>
    <a href="https://github.com/ryan4yin/nixos-and-flakes-book">
        <img src="https://img.shields.io/static/v1?label=Nix Flakes&message=learning&style=for-the-badge&logo=nixos&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41"></a>
  </a>
</p>

Welcome to the repository for my NixOS configuration! This project contains the files and settings required to set up a custom NixOS system.

## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Repository Structure](#repository-structure)
- Installation Guide
  - [Basic Steps](#basic_steps)
  - [Flakes (Optional)](#6-flakes-optional)
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
etc/nixos/.
|
├── modules/                 # Custom modules
|   ├── nixos/
│   |  ├── configuration.nix             # Main system configuration
|   |  └── hardware-configuration.nix    # Auto-generated hardware configuration
|   ├── home-manager/
|   |  └── home.nix                      # Home manager file configuration
├── flake.nix                # Nix Flakes configuration (optional)
├── flake.lock               # Flake lock file
└── README.md                # This file
```

## Main Files
- ```configuration.nix```: The main file defining system behavior.
- ```hardware-configuration.nix```: Auto-generated during NixOS installation, contains hardware-specific settings.
- ```home.nix```: Home manager configuration for declarative configurations
- ```flake.nix (optional)```: Configuration for Nix Flakes support.
# Installation Guide

## Basic Steps

### 1. install NixOS:

Download the NixOS image from the official [website](#https://nixos.org/).
Follow the installation guide to set up your base system.

### 2. Clone this Repository:

```
git clone https://github.com/your-username/nixos-configuration.git
cd nixos-configuration
```
### 3. Link Configuration Files:
Replace or integrate the existing configuration files with those from this repository:
```
sudo cp configuration.nix /etc/nixos/
sudo cp hardware-configuration.nix /etc/nixos/
```
### 4. Rebuild the System:
```
sudo nixos-rebuild switch
```
### 5. Reboot the System:
```
sudo reboot
```
### 6. Flakes (Optional)
If you’re using Nix Flakes, enable them by adding this line to /etc/nixos/configuration.nix:
```
nix = {
  experimental-features = [ "nix-command" "flakes" ];
};
```
Then, rebuild with:
```
nixos-rebuild switch --flake .#
```
## Contributing
Contributions are welcome! If you have suggestions or want to add custom modules:

- Fork this repository.
- Create a new branch.
- Open a pull request with your changes.

**Thank you for exploring my NixOS configuration!
If you have questions or suggestions, feel free to open an Issue.**
