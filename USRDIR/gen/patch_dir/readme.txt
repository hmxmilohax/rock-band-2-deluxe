             ____            _      ____                  _   ____
            |  _ \ ___   ___| | __ | __ )  __ _ _ __   __| | |___ \
            | |_) / _ \ / __| |/ / |  _ \ / _` | '_ \ / _` |   __) |
            |  _ < (_) | (__|   <  | |_) | (_| | | | | (_| |  / __/
            |_| \_\___/ \___|_|\_\ |____/ \__,_|_| |_|\__,_| |_____|
                        ____  _____ _    _   ___  _______
                       |  _ \| ____| |  | | | \ \/ / ____|
                       | | | |  _| | |  | | | |\  /|  _|
                       | |_| | |___| |__| |_| |/  \| |___
                       |____/|_____|_____\___//_/\_\_____|

                               Installation Guide
===============================================================================

INTRODUCTION
============
This is a brief text tutorial on installing Rock Band 2 Deluxe on both real
consoles and on the RPCS3 emulator. Please keep it handy for future use.

WHAT YOU'LL NEED
================
Playing Rock Band 2 Deluxe requires these things:

- Either a modded console or an emulator
	- RPCS3 is the team's main testbed, so we know it works well on it. So
	long as your computer runs it well, it's a good choice.
	- If you're using a modded PS3, the game only runs if you're using CFW,
	not HEN, which is a way to run homebrew without modifying your firmware.
- The North American release of Rock Band 2
	- This will be serial BLUS30147 for PS3 or title ID 45410869 for 360.
	- Other regions will not work! BLES versions of the game do not work.

Rock Band 2 Deluxe, depending on platform, comes in either a .pkg file (which
are used for PS3 game updates) or as a set of Xbox files, including a xex
file (Xbox executable) and a patch ARK/HDR (for 360). Depending on where you
plan to play the game, you only need to follow one of the following sections.

INSTALLING ON EMULATOR (RPCS3)
==============================
1. Install your North American copy of Rock Band 2 through the emulator. The
official RPCS3 site covers this nicely: https://rpcs3.net/quickstart
	a. Remember, you NEED to be running BLUS30147. RPCS3 will tell you this
	in the game selection GUI under the Serial column.
2. Drag the .pkg file and drag it into the game selection GUI. The game will
update, and if you were running 1.00, you'll also get a nice Rock Band 2
Deluxe icon in the window to match.

Double-click to run Deluxe.

INSTALLING ON HARDWARE (PS3)
============================
1. Install your vanilla copy of RB2 to the console's hard drive.
1. FTP into your PS3, or use your preferred way to copy files onto the
console's hard drive.
2. Drag the .pkg file into dev_hdd0/packages. That's dev_hdd0, and then you
want to put the .pkg into the packages folder on dev_hdd0, your hard drive.
3. On your console, navigate to your Package Manager. Then go into Install
Package Files > PS3 System Storage, and select the BLUS30147 update .pkg.
4. Install it.

The next time you mount and run the game, it will be Rock Band 2 Deluxe
instead of vanilla.

INSTALLING ON HARDWARE (XBOX 360)
=================================
1. Install your vanilla copy of RB2 game to your console's hard drive.
2. FTP into your 360, or use your preferred way to copy files onto it.
3. In the Games folder, there should be a folder (probably named Rock Band 2)
with a default.xex file and a gen folder in it. If you don't have that, the
game isn't installed to the hard drive.
4. Rename the default.xex to default_retail.xex as a backup in case something
goes wrong.
5. Drag in the default.xex you got from your Rock Band 2 Deluxe download. In
the gen folder, Drag in the patch_xbox.hdr and patch_xbox_0.ark files from
your Rock Band 2 Deluxe download.

The next time you run the game, it will be Rock Band 2 Deluxe instead of
vanilla.

CONTACT
=======
Rock Band 2 Deluxe was brought to you by MiloHax, a big ol' Discord for
gigantic crazy mods to various Harmonix games. For any questions, comments,
mods of your own, or just plain seething resentment, come join the server:

https://discord.gg/TPycZbVeqY

Enjoy!

- The RB2 Deluxe Team