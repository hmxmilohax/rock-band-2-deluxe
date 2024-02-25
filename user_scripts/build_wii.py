import sys
sys.path.append("../dependencies/dev_scripts")

from build_ark import build_wii_ark
from download_mackiloha import download_mackiloha

successful_extraction = download_mackiloha()

if successful_extraction:
    build_wii_ark()
    print("Wii ARK built successfully.")
    print("You may find the files needed to create a Wii ISO in /_build/Wii/.")
else:
    print("Failed to extract Mackiloha-suite-archive.zip. Please check the download and extraction process.")
