
#!/bin/sh

#################################################################
#  Define your variables here:
#################################################################

FILESTOKEEP=100
BACKUP_DIR=/home/ubuntu/backup
BMYSQL_USER=root
BMYSQL_PWD=xx

DATE=$(date +"%m-%d-%Y")_$(date +"%T")

BMYSQL_DBNAME=threepak
BMYSQL_DBFILENAME=MYSQL_BACKUP_$DATE


#################################################################
#  Make sure output directory exists.
#################################################################

        if [ ! -d $BACKUP_DIR ]; then
            mkdir -p $BACKUP_DIR
        fi


#################################################################
#  Create backup
#################################################################

        mysqldump --user=$BMYSQL_USER --password=$BMYSQL_PWD $BMYSQL_DBNAME | gzip > $BACKUP_DIR/$BMYSQL_DBFILENAME.gz
        echo "Backup Generated successfully"
#################################################################
#  Remove old backups
#  - this will list files according to date (DESC)
#  - skip the first few files (FILESTOKEEP)
#  - remove all files past that
#  NOTE: Make sure not to save the backups into any directory
#  where there are other files other than these backup ones.
#
#  Uncomment when you are confident in rest of setup
#################################################################

      cd $BACKUP_DIR
      ls -t1 | tail -n +$(($FILESTOKEEP+1)) | xargs rm
      echo "Old backup deleted"
