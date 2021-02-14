#!/bin/bash
#####################################################################
# Weewx Backup script for Raspberry Pi
# Modified by Jan Stelling (2021-02-14)
# after PapyLeCelte (https://github.com/PapyLeCelte/Weewx-Backup)
#####################################################################

# Stop weewx daemon
sudo /etc/init.d/weewx stop

# What to backup
backup_files1="/var/lib/weewx/weewx.sdb"
backup_files2="/etc/weewx/weewx.conf"
backup_files3="/etc/weewx/skins"
backup_files4="/usr/share/weewx/user"

# Where to backup
dest="/home/pi/Shares/Temp"

# Create archive filename
day=$(date +%y%m%d)
archive_file="weewx-$day.tgz"

# Print start status message.
echo
echo "Backing up $backup_files1 to $dest/$archive_file"
echo "Backing up $backup_files2 to $dest/$archive_file"
echo "Backing up $backup_files3 to $dest/$archive_file"
echo "Backing up $backup_files4 to $dest/$archive_file"
echo

# Backup the files using tar.
# Option 1 - no need to stop and restart weewx
# tar czf $dest/$archive_file $backup_files2 $backup_files3 $backup_files4
# sqlite3 $backup_files1 ".backup $dest/$backup_files1.backup"
# Option 2 - stop and restart of weewx needed
tar czf $dest/$archive_file $backup_files1 $backup_files2 $backup_files3 $backup_files4

# Print end status message. Uncomment if done manually.
# echo
# echo "Backup finished"
# echo

# Restart weewx
sudo /etc/init.d/weewx start

# Long listing of files in $dest to check success. Uncomment if done manually.
# ls -lh $dest
