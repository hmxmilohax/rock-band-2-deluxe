import sys
sys.path.append("../dependencies/dev_scripts")

from build_ark import build_patch_ark

build_patch_ark()
print("You may find the files needed to create a PS2 ISO in /_build/PS2/.")