#!/bin/bash

# Navigate to the config directory
cd "$HOME/.config" || exit

# 1. Update the APT/Pikman package list
echo "Updating package lists..."
pikman list --installed | grep "\[installed" | cut -d'/' -f1 > clean-packages.txt

# 2. Update the Flatpak list
echo "Updating Flatpak lists..."
flatpak list --app --columns=ref > my-flatpaks.txt

# 3. Add specified directories, files, package lists, and the script itself
# Since .zshrc is inside your .config, we address it directly
git add niri/ kitty/ noctalia/ .zshrc starship.toml clean-packages.txt my-flatpaks.txt backup_dotfiles.sh

# 4. Commit with a timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
if git commit -m "Auto-backup: $TIMESTAMP"; then
    echo "Changes committed."
else
    echo "No changes to commit."
fi

# 5. Push to GitHub
# Ensure your SSH key is added to the agent or use a credential helper
git push origin-ssh master:main
