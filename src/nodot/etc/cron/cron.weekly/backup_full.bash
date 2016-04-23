#!/usr/bin/env bash
# Run a full backup.

# Only runs a full backup if anything has changed since the last full backup.
# The backup goes in
#   /dropbox/robin/Dropbox/RobinBackups/$(hostname)/full/$(date +%F).tar.gz
# Differential backups that are more than two months old are deleted.
# Full backups that are more than six months old are deleted.
# Only monthly full backups between six and two months old are retained.

USERNAME=robin
GROUPNAME=$(id -gn $USERNAME)
DROPBOX=/dropbox/$USERNAME/Dropbox/RobinBackups
DIRS_TO_BACKUP='/etc /home /opt /root /srv /var'
test \! -d $DROPBOX && exit 1
FULL=$DROPBOX/$(hostname)/full

function find_last_full () {
  if [ \! -d $FULL ] ; then
    mkdir -p $FULL
    chown $USERNAME:$GROUPNAME $FULL
  else
    # Find last full backup
    ls $FULL | head -1
  fi
}

function is_newer_files_than () {
  # Return true if we are doing the first full backup
  test -z "$1" && return 0
  # Do a find on DIRS_TO_BACKUP for files newer than $1
  # and return 0 if there are any, 1 otherwise
  #TODO
}

function do_backup () {
  #TODO
}

last_full=$(find_last_full)
is_newer_files_than $last_full && do_backup

#TODO
# check backup. Add result to /var/log/backups.out
# if failed, email a notification
# if succeeded, delete obsolete backups
# resources:
#   date +%F -d 'a week ago'
#   date +%F -d '2 weeks ago'
#   date +%F -d '-2 months + 1 week ago'
