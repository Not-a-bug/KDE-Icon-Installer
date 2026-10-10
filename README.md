# Icon Installer Script

A quick and dirty Bash script, made for my personal use, to batch install PNG icons on KDE Plasma 6 environment (CachyOS).

## Description

This script scans the `./icons/` directory for PNG files, extracts the icon name and size from the filename, and uses `xdg-icon-resource` to install them into the local icon theme.

## Prerequisites

- **Linux OS**: Designed for environments supporting the XDG Icon Theme Specification. Created and tested on CachyOS.
- **xdg-user-dirs / xdg-utils**: The `xdg-icon-resource` util must be available on the sytem.
- **icons/ directory**: A folder named `icons` must exist in the script's working directory containing all `.png` files.

## Usage

1. Clone or download the repository.
2. Place icon files in the `icons/` folder.
3. Make the script executable and run it:

   ```bash
   git clone https://github.com/Not-a-bug/KDE-Icon-Installer.git
   cd ./KDE-Icon-Installer
   chmod +x install_icons.sh
   ./install_icons.sh
   ```

## Naming Convention

For the script to work correctly, the icon files must follow a naming pattern:

<icon_name>-<size>.png

    icon_name: The logical name of the icon (e.g., lorem, ipsum).
    size: The resolution/size of the icon in pixels (e.g., 16, 64, 512).

Examples:

    flaticon-16.png
    flaticon-32.png
    flaticon-512.png

    Note: The script uses sed to strip the size suffix. It expects the size to be the final number separated by a hyphen.

## Credits & Licenses

All icons belong to their respective authors as described in the ['./icons'](https://github.com/Not-a-bug/KDE-Icon-Installer/tree/main/icons) folder.
The code itself is licensed under the GNU General Public License v3.0. See the LICENSE file for more details.