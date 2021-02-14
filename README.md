# Weewx-Backup
Original bash script worked by creating backups ona temporarily mounted USB drive. This modified version creates a backup to a mounted network temp drive that is mapped to `/home/pi/Shares/Temp`.

The backup includes:
- /var/lib/weewx/weewx.sdb
- /etc/weewx/weewx.conf
- /etc/weewx/skins
- /usr/share/weewx/user

The name of the tgz archive will be composed of *weewx-date.tgz*.
Two options can be used, with or without stopping weewx.

On my Pi, the script runs every Sunday at 2 am as a cron job:
`0 2 * * 7 /home/pi/weewx_backup.sh`
