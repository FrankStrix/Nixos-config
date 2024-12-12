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
|   |   ├── modules/                       # NixOS configuration modules
|   |   |  ├── aliases.nix                 # The aliases of the bash
|   |   |  ├── bootloader.nix              # Bootloader configuration module
|   |   |  ├── default.nix                 # All this modules imported in this file
|   |   |  ├── display.nix                 # Display configuration module
|   |   |  ├── env-var.nix                 # Envarioment variables configuration module
|   |   |  ├── hyprland.nix                # Enable hyprland
|   |   |  ├── localization.nix            # Module for the localization
|   |   |  ├── networking.nix              # Networking configuration module
|   |   |  ├── packages.nix                # All the installed packages
|   |   |  ├── security.nix                # Security configuration module
|   |   |  ├── sound.nix                   # Sound configuration module
|   |   |  └── users.nix                   # Configuration for users, mine in this case
│   |   ├── configuration.nix              # Main system configuration
|   |   └── hardware-configuration.nix     # Auto-generated hardware configuration
|   ├── home-manager/
|   |   ├── home-modules/                  # Home manager modules
|   |   |   ├── hyrpland/                  # Hyprland window manager config modules
|   |   |   |   ├── config.nix             # Hyprland configuration module
|   |   |   |   ├── default.nix            # Imports of all the module in the current directory
|   |   |   |   ├── hyprland.nix           # Home packages and configuration of Hyprland
|   |   |   |   ├── hyprlock.nix           # Hyprlock for Hyprland configuration module
|   |   |   |   └── variables.nix          # Home session variables for hyprland
|   |   |   ├── swaync/                    # Notification deamon with a GTK GUI for notifications
|   |   |   |   ├── config.json            # Swaync configuration module
|   |   |   |   ├── style.css              # Swaync style configuration module
|   |   |   |   └── swaync.nix             # Imports for all the modules in the current directory
|   |   |   ├── waybar/                    # Waybar for Hyprland config modules
|   |   |   |   ├── default.nix            # Imports for all the modules in the current directory
|   |   |   |   ├── setting.nix            # Waybar configuration module
|   |   |   |   ├── style.nix              # Waybar style configuration module
|   |   |   |   └── waybar.nix             # Module that enables waybar
|   |   |   ├── default.nix                # File for importing all modules in the home.nix file
|   |   |   ├── git.nix                    # Git configuration module
|   |   |   ├── gtk.nix                    # GTK configuration module
|   |   |   ├── kitty.nix                  # Kitty terminal configuration module
|   |   |   ├── pakcages.nix               # Home packages module
|   |   |   ├── rofi.nix                   # Rofi window switcher & runner configuration module
|   |   |   ├── session-var.nix            # Home session variables module
|   |   |   ├── swaylock.nix               # Swaylock for Hyprland configuration module
|   |   |   └── vscode,nix                 # Vscode configuration module
|   |   └── home.nix                       # Home manager file configuration
├── flake.nix                              # Nix Flakes configuration (optional)
├── flake.lock                             # Flake lock file
├── README.md                              # This file
└── LICENCE                                # Licence of this repo
```

## Main Files
- ```configuration.nix```: The main file defining system behavior.
- ```hardware-configuration.nix```: Auto-generated during NixOS installation, contains hardware-specific settings.
- ```home.nix```: Home manager configuration for declarative configurations
- ```flake.nix```: Configuration for Nix Flakes support.
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
> ### IMPORTANT 🚨 
>  Remeber to change all users.frank options into your user name, or it will change your user in frank without a password!!
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
## Contributing
Contributions are welcome! If you have suggestions or want to add custom modules:

- Fork this repository.
- Create a new branch.
- Open a pull request with your changes.

**Thank you for exploring my NixOS configuration!
If you have questions or suggestions, feel free to open an Issue.**
