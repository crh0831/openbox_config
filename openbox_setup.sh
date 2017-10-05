#!/usr/bin/env bash
#===============================================================================
#
#          FILE: openbox_setup.sh
#         USAGE: ./openbox_setup.sh 
#   DESCRIPTION: script to install and configure openbox window manager
#       OPTIONS: 
#  REQUIREMENTS: openbox obmenu obconf lxappearance-obconf nitrogen xcompmgr tint2 tilda
#         NOTES: 
#        AUTHOR: C Hawley
#       CREATED: 2015-10
#      REVISION: Thu 05 Oct 2017 12:11:06 PM EDT
#
#===============================================================================

set -o nounset                               # Treat unset variables as an error

# specify where your dotfiles live
dotfiledir="$HOME/dotfiles"

clear

echo "------------------------------------------"
echo "          openbox setup script            "
echo "------------------------------------------"
echo "          Setting up symlinks             "
echo "------------------------------------------"
echo ""

# Check for dependencies
for app in openbox obmenu obconf lxappearance nitrogen xcompmgr tint2 tilda
do 
	if [ ! $(command -v "${app}") ]; then
		echo "$app not installed."
	fi
done
 
# link .config/openbox
#-------------------------------------------------------------------------------
if [ -f "${HOME}"/.config/openbox ] || [ -d "${HOME}"/.config/openbox ]; then
	mv "${HOME}"/.config/openbox "${HOME}"/.config/openbox_original
fi
ln -s "{dotfiledir}"/openbox $HOME/.config/openbox

# link .config/tint2
#-------------------------------------------------------------------------------
if [ -f "${HOME}"/.config/tint2 ] || [ -d "${HOME}"/.config/tint2 ]; then
	mv "${HOME}"/.config/tint2 "${HOME}"/.config/tint2_original
fi
ln -s "{dotfiledir}"/tint2 $HOME/.config/tint2

# Report on backed up files
#-------------------------------------------------------------------------------
echo "These original files were backed up as '*_original'"
ofiles=$(find "${HOME}"/.config -maxdepth 1 -regex ".*_original$" | wc -l)
if [ "${ofiles}" -gt 0 ]; then
    find "${HOME}"/.config -maxdepth 1 -regex ".*_original$"
else
    echo "<No Files Were Backed Up>"
fi

echo ""
echo "------------------------------------------"
echo "Done.                                     "
echo "------------------------------------------"
