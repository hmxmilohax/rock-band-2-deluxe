# Rock Band 2 Deluxe [PS2]

![Header Image](dependencies/header.png)

# Introduction

### Rock Band 2 Deluxe [PS2] is a Massive Quality-of-Life Improvement Mod by [MiloHax](https://github.com/hmxmilohax)

This guide contains full instructions on how to install Rock Band 2 Deluxe for PlayStation 2.

*There are also (better and more supported) PS3 and Xbox 360 versions available in the* ***[main branch](https://github.com/hmxmilohax/rock-band-2-deluxe).***

# Table of Contents  
- [Features](#features)
  - [Quality of Life](#quality-of-life)
  - [Additional Modifications](#additional-modifications)
- [What You'll Need](#what-youll-need)
- [Downloads](#downloads)
  - [Installing Songs](#installing-songs)
  - [Building an ISO](#building-an-iso)
- [Custom Textures](#custom-textures)
- [Repo Setup (Advanced)](#repo-setup-advanced)
- [Dependencies](#dependencies)

# Features

## Quality of Life
* No strum limit
* `Overshell` - a custom on-screen menu system for changing modifiers, speeds, textures, and more. Opened by pressing `SELECT, SELECT` on most menu screens
* All modifiers unlocked by default
* Bass streak effect from RB3/RB4 available on all instruments - modifier to restore vanilla functionality
* Selectable song speed and track speed by 5% increments
* Song title always visible modifier
* Manual calibration adjusts by 1ms instead of 5ms

## Additional Modifications
* Several modifiers to change the look of the highway/track
* Various visual upgrades from the fourth main-line Rock Band title

# What You'll Need

### Playing Rock Band 2 Deluxe [PS2] requires these things:

- For Console: A **modded/hacked PS2**
- For Emulator: A **PC** capable of running PCSX2

# Downloads

### [Rock Band 2 Deluxe for PS2](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/ps2/RB2DX-PS2.zip)
### [Rock Band 2 Deluxe: Custom Edition](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/ps2/RB2DXCE-PS2.zip)

*Have a modded PS3/Xbox 360? Check out the [main version](https://github.com/hmxmilohax/rock-band-2-deluxe#what-youll-need)!*

## Installing Songs

(coming soon)

## Building an ISO

(coming soon)

# Custom Textures

Rock Band 2 Deluxe has a variety of custom textures, found in the `Deluxe Settings` menu in-game, as well as a way to import your own with relative ease.

### Importing Your Own Textures

*Follow [**Repo Setup (Advanced)**](#repo-setup-advanced) first in order to properly follow this guide.*

* Copy any `.jpg`, `.png`, or `.bmp` file into `\custom_textures\***\`, then navigate back to `windows_bats` and run `process_textures_***.bat`.
  * These will make them show up in game, resize your images accordingly (including those with arbitrary resolutions), and convert them to the proper format for Rock Band 2 Deluxe to read.

***You will need to rebuild Rock Band 2 Deluxe in order for these to take effect.***

# Repo Setup (Advanced)

### Installing Required Dependencies

* Install [**Git for Windows**](https://gitforwindows.org/), [**Dot Net 6.0 Runtime**](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime), and [**Python**](https://www.python.org/downloads/) (version 3.9 or later).
  * Install **Git** and **Dot Net 6.0 Runtime** with their default options, and ***select "Add python.exe to PATH"*** on the **Python** installer.

![Python PATH](dependencies/images/pythonpath.png)

* Open a **new command prompt** (press `Win+R`, type `cmd` and press Enter), type in `pip install gitpython`, and press enter. Close the command prompt when it's done installing.

### Initializing the Repo

* Go to the **[Releases](https://github.com/hmxmilohax/rock-band-2-deluxe/releases)** of this repo and **download `_init_repo.bat`** if you're on Windows or **`_init_repo.sh`** if you're on Linux.
  * Make a new **empty** folder, **put `_init_repo` in the folder, and run it**. This will pull the repo down for you and make sure you're completely up to date. **This will take some time.**

### ***The folder should look like this once it's done:***

![Repo Folder](dependencies/images/repofolder.png)

***The Rock Band 2 Deluxe repo is now set up!*** You can now return to [**Custom Textures**](#custom-textures).

# Dependencies

[**Git for Windows**](https://gitforwindows.org/) - CLI application to allow auto updating Deluxe repo files

[**Dot Net 6.0 Runtime**](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime) - Needed to run ArkHelper

[**Python**](https://www.python.org/downloads/) - For user script functionality (NOTE: 3.9 or newer is highly recommended!)

[**Mackiloha**](https://github.com/PikminGuts92/Mackiloha) - ArkHelper for building Deluxe - SuperFreq for building .bmp_xbox highway images

[**dtab**](https://github.com/mtolly/dtab) - For serializing `.dtb` script files
