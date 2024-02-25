# build_ark.py
from pathlib import Path
from subprocess import CalledProcessError
from sys import platform
import subprocess
from check_git_updated import check_git_updated
import shutil
import stat
import os

def rm_tree(pth):
    pth = Path(pth)
    for child in pth.glob('*'):
        if child.is_file():
            child.unlink()
        else:
            rm_tree(child)
    pth.rmdir()

def make_executable_binaries():
    # Make the binaries executable if on a non-Windows platform
    if platform != "win32":
        try:
            cmd_chmod_arkhelper = ["chmod", "+x", "dependencies/linux/arkhelper"]
            subprocess.check_output(cmd_chmod_arkhelper, cwd="..")
        except subprocess.CalledProcessError:
            print("Failed to make arkhelper executable.")
            sys.exit(1)

        try:
            cmd_chmod_dtab = ["chmod", "+x", "dependencies/linux/dtab"]
            subprocess.check_output(cmd_chmod_dtab, cwd="..")
        except subprocess.CalledProcessError:
            print("Failed to make dtab executable.")
            sys.exit(1)

# darwin: mac

# if xbox is true, build the Xbox ARK
# else, build the PS3 ARK
def build_patch_ark(xbox: bool, rpcs3_directory: str = None, rpcs3_mode: bool = False):
    # directories used in this script
    print("Building Rock Band 2 Deluxe patch arks...")
    cwd = Path().absolute() # current working directory (dev_scripts)
    root_dir = cwd.parents[0] # root directory of the repo
    ark_dir = root_dir.joinpath("_ark")

    files_to_remove = "*_ps3" if xbox else "*_xbox"
    ps2_files_to_remove = "*_ps2"
    if rpcs3_mode:
        if platform == "win32":
            build_location = rpcs3_directory + "\\game\\BLUS30147\\USRDIR\\gen"
        else:
            build_location = rpcs3_directory + "/game/BLUS30147/USRDIR/gen"
    else:
        if platform == "win32":
            build_location = "_build\\xbox\gen" if xbox else "_build\ps3\\USRDIR\gen"
        else:
            build_location = "_build/xbox/gen" if xbox else "_build/ps3/USRDIR/gen"

        # build the binaries if on linux/other OS
        if platform != "darwin":
            make_executable_binaries()
    patch_hdr_version = "patch_xbox" if xbox else "patch_ps3"

    # pull the latest changes from the Rock Band 2 Deluxe repo if necessary
    if not check_git_updated(repo_url="https://github.com/hmxmilohax/rock-band-2-deluxe", repo_root_path=root_dir):
        cmd_pull = "git pull https://github.com/hmxmilohax/rock-band-2-deluxe main".split()
        subprocess.run(cmd_pull, shell=(platform == "win32"), cwd="..")

    # temporarily move other console's files out of the ark to reduce overall size
    for f in ark_dir.rglob(files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    for f in ark_dir.rglob(ps2_files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    # build the ark
    failed = False
    try:
        if platform == "win32":
            cmd_build = f"dependencies\windows\\arkhelper.exe dir2ark _ark {build_location} -n {patch_hdr_version} -e -v 5".split()
        elif platform == "darwin":
            cmd_build = f"dependencies/macos/arkhelper dir2ark _ark {build_location} -n {patch_hdr_version} -e -v 5".split()
        else:
            cmd_build = f"dependencies/linux/arkhelper dir2ark _ark {build_location} -n {patch_hdr_version} -e -v 5".split()
        subprocess.check_output(cmd_build, shell=(platform == "win32"), cwd="..")
    except CalledProcessError as e:
        print(e.output)
        failed = True

    # move the other console's files back
    for g in root_dir.joinpath("_tmp").rglob(files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    for g in root_dir.joinpath("_tmp").rglob(ps2_files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    # remove temp directory
    if os.path.exists(root_dir.joinpath("_tmp")):
        rm_tree(root_dir.joinpath("_tmp"))

    if not failed:
        print("Successfully built Rock Band 2 Deluxe ARK.")
        return True
    else:
        print("Error building ARK. Check your modifications or run git_reset.py to rebase your repo.")
        return False

def rmtree_harder(top):
    for root, dirs, files in os.walk(top, topdown=False):
        for name in files:
            filename = os.path.join(root, name)
            os.chmod(filename, stat.S_IWUSR)
            os.remove(filename)
        for name in dirs:
            os.rmdir(os.path.join(root, name))
    os.rmdir(top)

#build ps2 ark
def build_ps2_ark():
    # directories used in this script
    print("Building Rock Band 2 Deluxe patch arks...")
    cwd = Path().absolute() # current working directory (dev_scripts)
    root_dir = cwd.parents[0] # root directory of the repo
    ark_dir = root_dir.joinpath("_ark")
    ps2_ark_dir = root_dir.joinpath("_ark_ps2")
    ps2_main_dir = root_dir.joinpath("_ps2_files")
    tmpbuild_dir = root_dir.joinpath("_tmpbuild")

    files_to_remove = "*_ps3"
    ps2_files_to_remove = "*_xbox"
    if platform == "win32":
        build_location = "_build\ps2\\gen"
    else:
        build_location = "_build/ps2/gen"
        # build the binaries if on linux/other OS
        if platform != "darwin":
            make_executable_binaries()
    patch_hdr_version = "MAIN"

    # pull the latest changes from the Rock Band 2 Deluxe repo if necessary
    if not check_git_updated(repo_url="https://github.com/hmxmilohax/rock-band-2-deluxe", repo_root_path=root_dir):
        cmd_pull = "git pull https://github.com/hmxmilohax/rock-band-2-deluxe main".split()
        subprocess.run(cmd_pull, shell=(platform == "win32"), cwd="..")

    # temporarily move other console's files out of the ark to reduce overall size
    for f in ark_dir.rglob(files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    for f in ark_dir.rglob(ps2_files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    # copy all ark files to temp build folder
    shutil.copytree(ark_dir, tmpbuild_dir, dirs_exist_ok=True)
    shutil.copytree(ps2_main_dir, tmpbuild_dir, dirs_exist_ok=True)
    shutil.copytree(ps2_ark_dir, tmpbuild_dir, dirs_exist_ok=True)
    rmtree_harder(root_dir.joinpath("_tmpbuild/.git"))
    os.remove(root_dir.joinpath("_tmpbuild/readme.md"))

    # build the ark
    failed = False
    try:
        if platform == "win32":
            cmd_build = f"dependencies\windows\\arkhelper.exe dir2ark _tmpbuild {build_location} -n {patch_hdr_version} -e -v 4 -s 4073741823".split()
        elif platform == "darwin":
            cmd_build = f"dependencies/macos/arkhelper dir2ark _tmpbuild {build_location} -n {patch_hdr_version} -e -v 4 -s 4073741823".split()
        else:
            cmd_build = f"dependencies/linux/arkhelper dir2ark _tmpbuild {build_location} -n {patch_hdr_version} -e -v 4 -s 4073741823".split()
        subprocess.check_output(cmd_build, shell=(platform == "win32"), cwd="..")
    except CalledProcessError as e:
        print(e.output)
        failed = True

    # move the other console's files back
    for g in root_dir.joinpath("_tmp").rglob(files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    for g in root_dir.joinpath("_tmp").rglob(ps2_files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    # remove temp directory
    if os.path.exists(root_dir.joinpath("_tmp")):
        rm_tree(root_dir.joinpath("_tmp"))

    #delete tmpbuild folder
    rm_tree(tmpbuild_dir)

    if not failed:
        print("Successfully built Rock Band 2 Deluxe ARK.")
        return True
    else:
        print("Error building ARK. Check your modifications or run git_reset.py to rebase your repo.")
        return False

#build wii ark
def build_wii_ark():
    # directories used in this script
    print("Building Rock Band 2 Deluxe patch arks...")
    cwd = Path().absolute() # current working directory (dev_scripts)
    root_dir = cwd.parents[0] # root directory of the repo
    ark_dir = root_dir.joinpath("_ark")
    wii_ark_dir = root_dir.joinpath("_ark_wii")
    wii_mightmerge_dir = root_dir.joinpath("_wii_possibly_merge")
    wii_main_dir = root_dir.joinpath("_wii_files")
    tmpbuild_dir = root_dir.joinpath("_tmpbuild")

    files_to_remove = "*_ps3"
    wii_files_to_remove = "*_xbox"
    wii_files_to_remove_1 = "*_ps2"
    if platform == "win32":
        build_location = "_build\wii\\DATA\\files"
        hdr_location = "_build\wii\\DATA\\files\\gen\\main_wii.hdr"
        dol_location = "_build\wii\\DATA\\sys\\main.dol"
        og_hdr = "_build\wii_rebuild_files\\main_wii.hdr"
    else:
        build_location = "_build/wii/DATA/files"
        hdr_location = "_build/wii/DATA/files/gen/main_wii.hdr"
        dol_location = "_build/wii/DATA/sys/main.dol"
        og_hdr = "_build/wii_rebuild_files/main_wii.hdr"
        # build the binaries if on linux/other OS
        if platform != "darwin":
            make_executable_binaries()
    patch_hdr_version = "MAIN"

    # pull the latest changes from the Rock Band 2 Deluxe repo if necessary
    if not check_git_updated(repo_url="https://github.com/hmxmilohax/rock-band-2-deluxe", repo_root_path=root_dir):
        cmd_pull = "git pull https://github.com/hmxmilohax/rock-band-2-deluxe main".split()
        subprocess.run(cmd_pull, shell=(platform == "win32"), cwd="..")

    # temporarily move other console's files out of the ark to reduce overall size
    for f in ark_dir.rglob(files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    for f in ark_dir.rglob(wii_files_to_remove):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    for f in ark_dir.rglob(wii_files_to_remove_1):
        temp_path = str(f).replace(f"{str(root_dir)}\\", "").replace(f"{str(root_dir)}/","")
        # print(temp_path)
        the_new_filename = root_dir.joinpath("_tmp").joinpath(temp_path)
        the_new_filename.parent.mkdir(parents=True, exist_ok=True)
        # print(f"moving file {temp_path} to {the_new_filename}")
        f.rename(the_new_filename)

    # copy all ark files to temp build folder
    shutil.copytree(ark_dir, tmpbuild_dir, dirs_exist_ok=True)
    shutil.copytree(wii_main_dir, tmpbuild_dir, dirs_exist_ok=True)
    shutil.copytree(wii_mightmerge_dir, tmpbuild_dir, dirs_exist_ok=True)
    shutil.copytree(wii_ark_dir, tmpbuild_dir, dirs_exist_ok=True)

    #copy og hdr
    shutil.copy(root_dir.joinpath(og_hdr), root_dir.joinpath(hdr_location))

    # build the ark
    failed = False
    try:
        if platform == "win32":
            cmd_build = f"dependencies\windows\\arkhelper.exe patchcreator -a _tmpbuild -o {build_location} {hdr_location} {dol_location}".split()
        elif platform == "darwin":
            cmd_build = f"dependencies/macos/arkhelper patchcreator -a _tmpbuild -o {build_location} {hdr_location} {dol_location}".split()
        else:
            cmd_build = f"dependencies/linux/arkhelper patchcreator -a _tmpbuild -o {build_location} {hdr_location} {dol_location}".split()
        subprocess.check_output(cmd_build, shell=(platform == "win32"), cwd="..")
    except CalledProcessError as e:
        print(e.output)
        failed = True

    # move the other console's files back
    for g in root_dir.joinpath("_tmp").rglob(files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    for g in root_dir.joinpath("_tmp").rglob(wii_files_to_remove):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    for g in root_dir.joinpath("_tmp").rglob(wii_files_to_remove_1):
        final_path = str(g).replace(f"{str(root_dir)}\\_tmp\\", "").replace(f"{str(root_dir)}/_tmp/","")
        # print(final_path)
        g.rename(root_dir.joinpath(final_path))

    # remove temp directory
    if os.path.exists(root_dir.joinpath("_tmp")):
        rm_tree(root_dir.joinpath("_tmp"))

    #delete tmpbuild folder
    rm_tree(tmpbuild_dir)

    if not failed:
        print("Successfully built Rock Band 2 Deluxe ARK.")
        return True
    else:
        print("Error building ARK. Check your modifications or run git_reset.py to rebase your repo.")
        return False