# download_ps2_files.py
from pathlib import Path
import shutil
import os
try:
    import git
except ImportError:
    subprocess.check_call(["python", "-m", "pip", "install", "gitpython"])
    import git
    
def download_ps2_files():
    # get the current working directory
    cwd = Path().absolute()

    # clone/pull rb2dx-ps2-files
    ps2_files_path = cwd.joinpath("../_ps2_files")
    try:
        repo = git.Repo.clone_from("https://github.com/LlysiX/RB2DX-PS2-FILES.git", ps2_files_path, branch="main")
    except:
        repo = git.Repo(ps2_files_path)
        origin = repo.remotes.origin
        origin.pull()

    print(f"Successfully Downloaded PS2 files. You can now build RB2DX for PS2.")
    return True