<div align="center">

<img src="dependencies/images/header.gif" width="100%" alt="Header GIF">

# Downloads and install instructions have been moved to our [website](https://rb2deluxe.neocities.org/)!

<br/> <br/>

# Welcome to the *Rock Band 2 Deluxe* repository!

### Below are instructions for building the game yourself.<br/>[Please visit our website if you're looking for downloads](https://rb2deluxe.neocities.org/).

<br/> <br/>

# 📥 [Downloads](https://rb2deluxe.neocities.org/)

</div>
<br/> <br/>

# 🔨 Building (NOT standard download and install)

## NOTE: This is for *building the game*, for developers and contributors. <br/> If you're looking for downloads, [please visit our website](https://rb2deluxe.neocities.org/).

### Installing Python (Required)

* Head to the [**Python downloads**](https://www.python.org/downloads/), download and install Python (version 3.9 or later).
  * ***Select "Add python.exe to PATH"*** on the installer.

![Python PATH](dependencies/images/pythonpath.png)

### Initializing the Repo

* Go to the **[Releases](https://github.com/hmxmilohax/rock-band-2-deluxe/releases)** of this repo and **download `_init_repo.py`**.
  * Make a new **empty** folder, **put `_init_repo.py` in the folder, and run it**. This will pull the repo down for you and make sure you're completely up to date. **This will take some time.**

### ***The folder should look like this once it's done:***

![Repo Folder](dependencies/images/repofolder.png)

### ✅ ***The Rock Band 2 Deluxe repo is now set up!***

From here, you can make any personal modifications to the game or build it yourself.

* Navigate to `windows_bats` if you're on Windows or `user_scripts` if you're on Linux.
  * Run the `build_` script for your platform of choice to build *Rock Band 2 Deluxe*.
  * Built contents will be in the `_build` folder on the root of the repo.

You can now return to [**Installing on Xenia (Advanced)**](#-installing-on-xenia-advanced) or [**Custom Textures**](#-custom-textures).

<br/>

# 🖥️ Dependencies

[Git for Windows](https://gitforwindows.org/) - CLI application to allow auto updating Deluxe repo files

[Dot Net 6.0 Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0/runtime) - Needed to run ArkHelper

[Python](https://www.python.org/downloads/) - For user script functionality (NOTE: 3.9 or newer is highly recommended!)

[Mackiloha](https://github.com/PikminGuts92/Mackiloha) - ArkHelper for building Deluxe - SuperFreq for building .bmp_xbox highway images

[swap_rb_art_bytes.py](https://github.com/PikminGuts92/re-notes/blob/master/scripts/swap_rb_art_bytes.py) - Python script for converting Xbox images to PS3

[dtab](https://github.com/mtolly/dtab) - For serializing `.dtb` script files
