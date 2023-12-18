import sys
sys.path.append("../dependencies/dev_scripts")

from build_ark import build_ps2_ark
from download_mackiloha import download_mackiloha
from download_ps2_files import download_ps2_files

successful_extraction = download_mackiloha()
ps2_successful = download_ps2_files()

if successful_extraction:
    if ps2_successful:
        build_ps2_ark()
        print("PS2 ARK built successfully.")
        print("You may find the files needed to create a PS2 ISO in /_build/PS2/.")
    else:
        print("Failed to download ps2 files. Please check the download and extraction process.")
else:
    print("Failed to extract Mackiloha-suite-archive.zip. Please check the download and extraction process.")
