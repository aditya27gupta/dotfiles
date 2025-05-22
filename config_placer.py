import argparse
import shutil
from pathlib import Path


def find_config_present():
    for loc in Path('.').iterdir():
        if not loc.name.startswith('.') and not loc.name.endswith('py'):
            yield loc


def check_and_replace(config_loc, application):
    src_path = Path('.').joinpath(application)
    dest_path = Path(config_loc).joinpath(application)
    try:
        if src_path.is_dir():
            shutil.copytree(src=src_path, dst=dest_path, dirs_exist_ok=True)
        else:
            shutil.copy2(src=src_path, dst=dest_path)
        print(f'{application.name.upper()} is placed in {dest_path}')
    except shutil.Error as e:
        print(f"{application.name} couldn't be placed due to : {e}")

def get_config_location():
    parser = argparse.ArgumentParser()
    parser.add_argument('--loc', help="Config Location to put files in")
    args = parser.parse_args()
    config_location = args.loc
    return config_location


if __name__ == "__main__":
    config_loc = get_config_location()
    for app in find_config_present():
        check_and_replace(config_loc, app)
