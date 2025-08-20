import shutil
from collections.abc import Generator
from pathlib import Path


def find_config_present() -> Generator[Path]:
    ignore_vals = [".git", "config_placer.py", ".gitignore", ".ruff_cache"]
    for loc in Path.home().joinpath("Github/dotfiles").iterdir():
        print(loc)
        if loc.name not in ignore_vals:
            yield loc


def check_and_replace(src_path: Path, dest_path: Path) -> None:
    new_dest_path = Path(dest_path).joinpath(src_path.name)
    try:
        if src_path.is_dir():
            new_dest_path.mkdir(parents=True, exist_ok=True)
            for loc in src_path.iterdir():
                check_and_replace(loc, new_dest_path)
        else:
            shutil.copy2(src=src_path, dst=new_dest_path)
            print(f"{src_path.name.upper()} -> {dest_path}")
    except shutil.Error as e:
        print(f"{src_path.name} couldn't be placed due to : {e}")


if __name__ == "__main__":
    for curr in find_config_present():
        check_and_replace(curr, Path.home())
