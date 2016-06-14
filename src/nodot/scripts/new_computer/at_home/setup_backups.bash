#!/usr/bin/env bash

id backup &> /dev/null || \
  sudo useradd -U -G users,wheel -c 'Backup cron job owner' -m backup
export BACKUP_SRC=$HOME/scripts/new_computer/at_home/backup
if [ visudo -qc -f $BACKUP_SRC/sudoers_01local ] ; then
  sudo cp $BACKUP_SRC/sudoers_01local /etc/sudoers.d/01local
  sudo chown root:root /etc/sudoers.d/01local
  sudo chmod 0440 /etc/sudoers.d/01local

  sudo -i -u backup -g backup mkdir -p bin
  sudo cp $BACKUP_SRC/do_backups.bash ~backup/bin
  sudo cp $BACKUP_SRC/crontab ~backup
  sudo chown backup:backup ~backup/bin/do_backups.bash
  sudo chown backup:backup ~backup/crontab
  crontab -u backup ~backup/crontab
fi
unset BACKUP_SRC
