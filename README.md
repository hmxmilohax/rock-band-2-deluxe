# Rock-Band-2-Deluxe

![Header Image](dependencies/header.png)

## Introduction

This Repo contains everything you need to build an ark for Rock Band 2 Deluxe for PS3 or Xbox 360.

## Features

### Quality of Life
* No strum limit executable modification by GMS
* Fast start executable modification by ihatecompvir
* Additional intro skip scripting to skip the intro movie
* `Overshell` - a custom on-screen menu system for changing modifiers, speeds, textures, and more. Opened by pressing `SELECT, SELECT` on most menu screens
* 1080p support via PS3/RPCS3
* Full Combo indicator per instrument via the multiplier
* New tour setlists utilizing the Rock Band 1 setlist by C0Assassin
* Updated genres from Lego Rock Band/Rock Band 3/Rock Band 4
* Non-Playable characters now playable
* All modifiers unlocked by default
* Integrated Rock Band 1 unexportables
* No losing fans in career on quit/restart
* `Flawless` accomplishment replaced with `Full Combo`, and checks perfect note streak as well as all notes hit
* Double bass pedal port supported on stock rb2/rb3 kits
* Modifier for E-kits to fix an issue the above line introduces (midi drum bass kick fix)
* Disables drum fills by default and replaces activations with auto activations (static fills)
* Modifier to restore Legacy Drum Fills
* Bass streak effect from RB3/RB4 available on all instruments - modifier to restore vanilla functionality
* New menu, `Tweaks`, in game for additional modifications
* Selectable song speed and track speed by 5% increments
* Selectable venue framerate up to 60fps
* Black Venue modifier with decreased load times and system load
* Press select to restart the section in practice mode
* Default difficulty on first load is Expert
* Song title always visible modifier
* Detailed song title modifier including album, year, track number (does not work properly in random/setlists)
* Manual calibration adjusts by 1ms instad of 5ms

### Authoring
* Author shown on song title - in your songs.dta `(author `Author Name`)`
* Autoplay modifier for chart demos
* Gameplay watermarks to deter abuse of autoplay including -
    * Disabling autosave
    * Replacing endgame percentage with `BOT`
    * Manipulating MTV Overlay
* Cycle camera menu button - available in-game when autoplay is enabled

### Additional Modifications
* Selectable colors per fret
* Several modifiers to change the look of the highway/track
* Nice (69%) and Awesome Choke (98-99%) callouts on solo completion
* Various visual upgrades from the fourth main-line Rock Band title
* New main menu music pulled from other Rock Band titles
* Pad is guitar modifier - same functionality as GH1, GH2
* Pad is drum modifier
* Freestyle drums modifier
* Modifier to not force vocal gender per match song
* No flames modifier
* Firework gems modifier
* No crowd modifier
* No whammy effect modifier
* No track muting modifier
* No sustain tails modifier
* Rock Band 3 Sustain look modifier

## Setup

NOTE: You WILL need a modded/hacked console to play this mod on console. I hope this is clear

### Actions

There are now pre compiled ARK files available in the [Actions](https://github.com/hmxmilohax/rock-band-2-deluxe/actions) tab of this repo, as well as the [Nightly](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main) link. These are ready to install files for RB2DX per platform.

* RB2DX-*platform*-Base - The default build of Rock Band 3 Deluxe

If using pre built actions, skip down to the [Install](#install) section of this readme and assume any mention of `_build` is the contents of your zip file you downloaded from the Actions tab.

### Repo-Setup
Setting up the Rock Band 2 Deluxe repo for the first time is meant to be as easy as possible.
As well, it is designed to allow you to automatically receive updates as the repo is updated.

Simply go to the [Releases](https://github.com/hmxmilohax/rock-band-2-deluxe/releases) of this repo and grab the `_init_repo` script for your platform. Currently there are .bat files for Windows and .sh files for linux, as well as a specific branch for Wii.

Included on the release page for ease of install are a couple dependencies, [Git for Windows](https://gitforwindows.org/), and [Dot Net 6.0 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime).
Git is required for you to take advantage of auto updating via github pulls. Dot Net is required to build an ARK/HDR file, the archive format the game needs to run. You cannot run any deluxe title without building an ark first.

You can setup git with all default options, same with dot net.

Once the dependencies are installed, run `_init_repo.bat` in an **empty folder**. git will pull the repo and make sure you are completely up to date.

From then on simply run the build .py corresponding to the platform you are building for. This script will pull the repo again for updates, and build the ARK for you and spit it out in `\_build\xbox\gen` or `\_build\ps3\USRDIR\gen`

## Install

### Xenia-Emulator

To install on Xenia, copy your vanilla Xbox 360 1.0 arks to `\_build\xbox\gen`

then just run `build_xenia.bat` to automatically build and run Rock Band 2 Deluxe.

### RPCS3-Emulator

To install on rpcs3, copy all files/folders in `_build/ps3/` to `/dev_hdd0/game/BLUS30463/`

If the folder does not exist, create it. The game will need the included .bin file, and a built .ark/.hdr to function. The folder format in `/_build/ps3` matches how it should be installed.

Overwrite files if asked.

Run the build script again to pull any new updates committed to the repo and rebuild a new ark/hdr.

### PS3-Hardware

**NOTE: You WILL need a modded/hacked console to play this mod on console. I hope this is clear**

To install on real PS3, you will have to install the vanilla patch on your ps3 first to register the update in your system. You can get this from the RPCS3 Discord server from their bot.

Next, copy all files/folders in `_build/ps3/` to `/dev_hdd0/game/BLUS30147/`

If the folder does not exist, you have not installed the vanilla patch. You need to do this first. The game will need the included .bin file, and a built .ark/.hdr to function. The folder format in `/_build/ps3` matches how it should be installed.

Overwrite files if asked.

Run the build script again to pull any new updates committed to the repo and rebuild a new ark/hdr.

### Xbox

**NOTE: You WILL need a modded/hacked console to play this mod on console. I hope this is clear**

On Xbox, copy the gen folder and the xex from `_build/xbox/` to the same location your base copy of Rock Band 3 lives.

If installing for the first time, make sure you rename the vanilla `default.xex` to `default_vanilla.xex` for safety.

Make sure you clear your song cache, as well as your system cache.

To clear song cache, navigate to `System Settings>Storage>Rock Band 2` and delete the song cache.

To clear system cache, navigate to `System Settings>Storage` and press Y to clear the system cache.

Also make sure to `disable` any enabled updates for Rock Band 3 in Aurora. Rock Band 3 Deluxe rolls TU5 into its base installation.

Run the build script again to pull any new updates committed to the repo and rebuild a new ark/hdr.

## Songs

You can find song packs compatible with all Rock Band titles for both platforms on the [Spreadsheet](https://docs.google.com/spreadsheets/d/1-3lo2ASxM-3yVr_JH14F7-Lc1v2_FcS5Rv_yDCANEmk/edit#gid=0).


You can also use [Onyx Music Game Toolkit](https://github.com/mtolly/onyxite-customs) to generate your own custom song packs for Rock Band games.

## Included Dependencies

[Git for Windows](https://gitforwindows.org/) - CLI application to allow auto updating rb2dx repo files

[Dot Net 6.0 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime) - Needed to run ArkHelper

[Mackiloha](https://github.com/PikminGuts92/Mackiloha) - ArkHelper for building Rock Band 2 ARK - Superfreq for building .bmp_xbox highway images

[dtab](https://github.com/mtolly/dtab) - For serializing Rock Band dtb files
