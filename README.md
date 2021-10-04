**********************************************************************
DO NOT BUILD DIRECTY ON THE GITHUB FILES
MAKE A COPY TO A SAFE LOCATION FIRST, AND ONLY COMMIT SPECIFIC CHANGES
**********************************************************************

arkhelper ark2dir "DRIVE:\PATH\USRDIR\gen\patch_ps3.hdr" "DRIVE:\PATH\PS3_GAME\USRDIR\gen\patch_dir" -s -a -m
arkhelper dir2ark "DRIVE:\PATH\PS3_GAME\USRDIR\gen\patch_dir" "DRIVE:\PATH\USRDIR\gen" -n "patch_ps3" -e -v 5
