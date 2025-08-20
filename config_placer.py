"""
Config Placer - A utility to manage dotfiles by copying them from a source directory to the home directory.

This script helps maintain dotfiles by:
1. Finding configuration files in the dotfiles repository
2. Copying them to appropriate locations in the home directory
3. Preserving directory structures and file metadata
"""

import shutil
from collections.abc import Generator
from pathlib import Path
from typing import Final

# Constants
IGNORED_PATHS: Final[frozenset[str]] = frozenset({".git", "config_placer.py", ".gitignore", ".ruff_cache"})


def find_config_files() -> Generator[Path, None, None]:
    """
    Find all configuration files and directories in the dotfiles repository.

    Yields:
        Path: Path objects for each configuration file or directory found,
              excluding items specified in IGNORED_PATHS.

    Note:
        The search is performed in the 'dotfiles' directory within the user's
        Github directory.

    """
    dotfiles_path = Path.home().joinpath("Github/dotfiles")
    for item_path in dotfiles_path.iterdir():
        if item_path.name not in IGNORED_PATHS:
            yield item_path


def copy_config_item(source: Path, destination: Path) -> None:
    """
    Copy a configuration file or directory to its destination.

    Args:
        source: The source Path object to copy from
        destination: The destination Path object to copy to

    The function handles both files and directories recursively, preserving
    metadata and creating parent directories as needed.

    """
    if source.name in IGNORED_PATHS:
        print(f"Skipping ignored item: {source.name}")
        return

    target_path = destination.joinpath(source.name)
    try:
        if source.is_dir():
            target_path.mkdir(parents=True, exist_ok=True)
            for item in source.iterdir():
                copy_config_item(item, target_path)
        else:
            shutil.copy2(src=source, dst=target_path)
            print(f"{source.name.upper()} -> {destination}")

    except shutil.Error as err:
        print(f"Failed to copy {source.name}: {err}")
    except Exception as err:
        print(f"Unexpected error while copying {source.name}: {err}")


def main() -> None:
    """Main function to initiate the configuration placement process."""
    home_dir = Path.home()

    print("Starting config placement...")
    for config_item in find_config_files():
        copy_config_item(config_item, home_dir)
    print("Config placement complete!")


if __name__ == "__main__":
    main()
