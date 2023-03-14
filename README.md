# Rock Band 2 Deluxe

![Header Image](dependencies/header.png)

# Introduction

### Rock Band 2 Deluxe is a Massive Quality-of-Life Improvement Mod by [MiloHax](https://github.com/hmxmilohax)

This guide contains full instructions on how to install Rock Band 2 Deluxe for PlayStation 3 or Xbox 360.

*There is also a (less supported) PS2 version available in* ***[this branch](https://github.com/hmxmilohax/rock-band-2-deluxe/tree/ps2).***

# Table of Contents  
- [Features](#features)
  - [Quality of Life](#quality-of-life)
  - [Authoring](#authoring)
  - [Additional Modifications](#additional-modifications)
- [What You'll Need](#what-youll-need)
- [Downloads](#downloads)
- [How to Install](#how-to-install)
  - [Installing on RPCS3 (Recommended for PC)](#installing-on-rpcs3-recommended-for-pc)
  - [Installing on PS3](#installing-on-ps3)
  - [Installing on Xbox 360](#installing-on-xbox-360)
  - [Installing on Xenia (Advanced)](#installing-on-xenia-advanced)
- [Optional Upgrades](#optional-upgrades)
  - [Songs](#songs)
  - [Custom Textures](#custom-textures)
- [Dependencies](#dependencies)

# Features

## Quality of Life
* No strum limit executable modification by GMS
* Fast start executable modification by ihatecompvir
* Additional intro skip scripting to skip the intro movie
* [Custom settings loader](https://github.com/hmxmilohax/dx-settings-loader) as a frontend for Xbox and Xenia
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
* Manual calibration adjusts by 1ms instead of 5ms

## Authoring
* Author shown on song title - in your songs.dta `(author `Author Name`)`
* Autoplay modifier for chart demos
* Gameplay watermarks to deter abuse of autoplay including -
    * Disabling autosave
    * Replacing endgame percentage with `BOT`
    * Manipulating MTV Overlay
* Cycle camera menu button - available in-game when autoplay is enabled

## Additional Modifications
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

# What You'll Need

### Playing Rock Band 2 Deluxe requires these things:

- **A vanilla copy of Rock Band 2** for PS3 or Xbox 360 that you can extract onto your PC. The **USA** version is required for PS3 (`BLUS30147`)
- For Console: A **modded/hacked PS3 or Xbox 360** and a way to transfer files to it, we recommend using FTP
- For Emulator: A **mid-to-high-end PC** capable of running RPCS3

# Downloads

### [Rock Band 2 Deluxe for PS3](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-PS3.zip)
### [Rock Band 2 Deluxe for Xbox 360](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-Xbox.zip)

# How to Install

## Installing on RPCS3 (Recommended for PC)

* **Install your North American copy of Rock Band 2** through the emulator. The [**official RPCS3 site covers this nicely**](https://rpcs3.net/quickstart).
  * Remember, **you need to be running** ***BLUS30147***. RPCS3 will tell you this in the game selection GUI under the `Serial` column.

* **If this is your first time installing**, you will need the [**latest update for Rock Band 2**](http://b0.ww.np.dl.playstation.net/tppkg/np/BLUS30147/BLUS30147_T1/c8b8d16f692b3672/UP0006-BLUS30147_00-ROCKBAND2PATCH02-A0102-V0100-PE.pkg) installed on RPCS3.
  * *Right-click and select `Save link as...` to start the download*, then **drag and drop it on top of the main RPCS3 window** to install it.

* Download [**Rock Band 2 Deluxe for PS3**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-PS3.zip). 
  * **Copy the contents of it to `\dev_hdd0\game\BLUS30147\`** in your RPCS3 directory. Click `Yes` to overwrite the files.

***Rock Band 2 Deluxe is now installed!*** We highly recommend you check out [**Optional Upgrades**](#optional-upgrades) for songs and other cool stuff you can add to your game.

**To update Rock Band 2 Deluxe**, [**re-download it**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-PS3.zip) and repeat the above steps. You can click the `Watch` button (All Activity) to be notified about any updates that occur.

***Sidenote:*** *we recommend* ***enabling `Write Color Buffers`*** *for Rock Band 2 to prevent any character model issues.*

![Custom Configuration](dependencies/images/customconfig.png)
![GPU Tab](dependencies/images/gputab.png)
![Write Color Buffers](dependencies/images/writecolorbuffers.png)

## Installing on PS3

**NOTE: You WILL need a HACKED/MODDED (CFW or HFW/HEN) PS3 in order to play this mod on console. We hope this is clear.**

**NOTE: Rock Band 2 Deluxe only works with** ***North American (`BLUS30147`)*** **copies of the game on PS3.**

* **If this is your first time installing**, you will need the **latest update for Rock Band 2** installed on your system.
  * Insert our mount your disc, press `Triangle` on it, and select `Check for Update`. Update to version `1.02` if it asks you.

* Download [**Rock Band 2 Deluxe for PS3**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-PS3.zip). 
  * **Copy the contents of it to `\dev_hdd0\game\BLUS30147\`** on your PS3's hard drive (we recommend using FTP to do so). Click `Yes` to overwrite the files.

***Rock Band 2 Deluxe is now installed!*** We highly recommend you check out [**Optional Upgrades**](#optional-upgrades) for songs and other cool stuff you can add to your game.

**To update Rock Band 2 Deluxe**, [**re-download it**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-PS3.zip) and repeat the above steps. You can click the `Watch` button (All Activity) to be notified about any updates that occur.

## Installing on Xbox 360

**NOTE: You WILL need a HACKED/MODDED (RGH or JTAG) Xbox 360 in order to play this mod on console. We hope this is clear.**

* **Install your vanilla copy of Rock Band 2** to your console's hard drive.
  * In case anything goes wrong, we recommend that you **rename `default.xex` to `default_vanilla.xex`**.

* **Disable updates** for Rock Band 2 in Aurora. Rock Band 2 Deluxe rolls `TU6` into its base installation.

* Download [**Rock Band 2 Deluxe for Xbox 360**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-Xbox.zip). 
  * **Copy the contents of it to where your copy of Rock Band 2 is installed** (we recommend using FTP to do so). Select `Yes` to overwrite the files.

* We also recommend **clearing your song cache**, as well as your **system cache**.
  * *To clear your **song cache**, navigate to `System Settings > Storage > Rock Band 2` and delete the song cache.*
  * *To clear your **system cache**, navigate to `System Settings > Storage` and press `Y` to clear the system cache.*

***Rock Band 2 Deluxe is now installed!*** We highly recommend you check out [**Optional Upgrades**](#optional-upgrades) for songs and other cool stuff you can add to your game.

**To update Rock Band 2 Deluxe**, [**re-download it**](https://nightly.link/hmxmilohax/rock-band-2-deluxe/workflows/build/main/RB2DX-Xbox.zip) and repeat the above steps. You can click the `Watch` button (All Activity) to be notified about any updates that occur.

## Installing on Xenia (Advanced)

*Follow [**Repo Setup (Advanced)**](#repo-setup-advanced) first in order to properly follow this guide.*

* **Extract your vanilla copy of Rock Band 2** and copy the contents of the `gen` folder to `\_build\xbox\gen\`.

* Navigate to `_xenia` and **map your controller with x360ce**.
  * When it asks you to create `xinput1_3.dll`, create it and **rename it to `xinput1_4.dll`**.

* Then, **navigate to `windows_bats`** if you're on Windows or **`user_scripts`** if you're on Linux and **run `build_xenia` to automatically update, build, and run Rock Band 2 Deluxe.**
  * *You need to run this script every time in order to play and update the game. `run_xenia` will run the game only and won't update and build it unless a new update is available, so you can use that if `build_xenia` takes too long.*

***Rock Band 2 Deluxe is now installed!*** We highly recommend you check out [**Optional Upgrades**](#optional-upgrades) for songs and other cool stuff you can add to your game.

***Sidenote:*** *if you're experiencing issues regarding character models, navigate to `_xenia`, open `xenia-canary.config.toml` in your text editor of choice, and change `gpu` from `vulkan` to `d3d12` and `d3d12_readback_resolve` from `false` to `true` (you may need to press `CTRL + F` to find these). This will fix all texture issues but will drastically affect the framerate, you also may experience BSODs. If you don't want to deal with any of this, we recommend using* [***RPCS3***](#installing-on-rpcs3-recommended-for-pc) *instead.*

![D3D12](dependencies/images/d3d12.png)
![Readback Resolve](dependencies/images/readbackresolve.png)

# Optional Upgrades

*These are some optional, but very handy additions you can make to your Rock Band 2 Deluxe installation.*

## Songs

You can find song packs compatible with all Rock Band titles for both platforms on [**This Spreadsheet**](https://docs.google.com/spreadsheets/d/1-3lo2ASxM-3yVr_JH14F7-Lc1v2_FcS5Rv_yDCANEmk/edit#gid=0).

You can also use [**Onyx Music Game Toolkit**](https://github.com/mtolly/onyxite-customs) to generate your own custom song packs for Rock Band games or convert Xbox 360 packs to PS3, and vice versa. Converting custom songs from games like Clone Hero is a breeze.

### Installing Songs on RPCS3

Download a PS3 song pack of your choice and open RPCS3. Drag and drop the song pack you want to install on top of the main RPCS3 window and select `Yes` to install it.

![RPCS3 PKG](dependencies/images/rpcs3_pkg.png)

### Installing Songs on PS3

Download a PS3 song pack of your choice and put it on the root of a USB drive. Then, open `Package Manager` and select the song pack you want to install.

![PS3 PKG](dependencies/images/ps3_pkg.png)

### Installing Songs on Xbox 360

Download an Xbox 360 song pack of your choice, then copy it to its respective folder.

***For RB2 LIVE files, install them to:***

![RB2 LIVE](dependencies/images/360_rb2live.png)

### Installing Songs on Xenia

Download an Xbox 360 song pack of your choice and open Xenia. Navigate to `File > Install Content`, and select your song pack(s) of choice. You can select more than one at a time. Xenia supports both CON and LIVE files.

![Xenia Songs](dependencies/images/xenia_installcontent.png)

## Custom Textures

Rock Band 2 Deluxe has a variety of custom textures, found in the `Deluxe Settings` menu in-game, as well as a way to import your own with relative ease.

### Importing Your Own Textures

*Follow [**Repo Setup (Advanced)**](#repo-setup-advanced) first in order to properly follow this guide.*

* Copy any `.jpg`, `.png`, or `.bmp` file into `\custom_textures\***\`, then navigate back to `windows_bats` and run `process_textures_***.bat`.
  * These will make them show up in game, resize your images accordingly, including those with arbitrary resolutions, and convert them to the proper format for Rock Band 2 Deluxe to read.

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

***The Rock Band 2 Deluxe repo is now set up!***

# Dependencies

[**Git for Windows**](https://gitforwindows.org/) - CLI application to allow auto updating Deluxe repo files

[**Dot Net 6.0 Runtime**](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime) - Needed to run ArkHelper

[**Python**](https://www.python.org/downloads/) - For user script functionality (NOTE: 3.9 or newer is highly recommended!)

[**Mackiloha**](https://github.com/PikminGuts92/Mackiloha) - ArkHelper for building Deluxe - SuperFreq for building .bmp_xbox highway images

[**swap_rb_art_bytes.py**](https://github.com/PikminGuts92/re-notes/blob/master/scripts/swap_rb_art_bytes.py) - Python script for converting Xbox images to PS3

[**dtab**](https://github.com/mtolly/dtab) - For serializing `.dtb` script files
