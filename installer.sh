#!/usr/bin/env bash

# -e: Exit on error, -u: Treat unset variables as errors
set -eu

# Fallback safely if tput is unavailable
bold=$(tput bold 2>/dev/null || printf '')
normal=$(tput sgr0 2>/dev/null || printf '')

echo_text() {
    echo
    echo "========================================"
    echo "${bold}${1}${normal}"
    echo "========================================"
}

# Optimized logic to install a single package depending on the OS
install_single_pkg() {
    local pm=$1
    local pkg=$2

    case "$pm" in
        pacman)
            if sudo pacman -S --noconfirm --needed "$pkg" &> /dev/null; then
                printf "${bold}%-30s${normal} ✔\n" "$pkg"
            else
                printf "${bold}%-30s${normal} ❌\n" "$pkg"
            fi
            ;;
    esac
}

main(){
    echo_text "Installing Applications"

    local packages=("fish" "ghostty" "zed" "uv" "starship" "firefox" "neovim" "ttf-jetbrains-mono-nerd")
    local pm_type=""

    # 1. Detect package manager once at the start
    if command -v pacman &> /dev/null; then
        pm_type="pacman"
    else
        echo "❌ Error: Neither pacman nor dnf detected."
        exit 1
    fi

    # 2. Loop through individual packages to output precise status
    for item in "${packages[@]}"; do
        install_single_pkg "$pm_type" "$item"
    done

    echo_text "Placing dotfiles"
    if command -v python3 &> /dev/null; then
        python3 config_placer.py
    else
        echo "❌ Error: python3 is not installed."
        exit 1
    fi
}

main
