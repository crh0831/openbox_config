#!/usr/bin/env bash
#===============================================================================
#
#          FILE: tint2_restart.sh
#         USAGE:  
#   DESCRIPTION: 
#       OPTIONS: 
#  REQUIREMENTS: 
#         NOTES: 
#        AUTHOR: C Hawley
#       CREATED: Tue 09 Feb 2016 08:48:45 PM EST
#      REVISION: Tue 09 Feb 2016 10:27:19 PM EST
#
#===============================================================================

set -o nounset                               # Treat unset variables as an error

# Check for empty argument
if [ -z "${1:-}" ]; then
	arg="undefined"
else
	arg=$1
fi

killall tint2
killall xfce4-power-manager
killall nm-applet
killall volumeicon

tint2 -c ~/.config/tint2/tint2rc_clean &
#tint2 -c ~/.config/tint2/tint2rc_clean_2 &
sleep 2
/usr/bin/xfce4-power-manager &
sleep 2
/usr/bin/nm-applet --sm-disable &
sleep 2
/usr/bin/volumeicon &
