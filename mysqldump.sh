#!/bin/bash

today=`date +'%Y-%m-%d-%H'`
BACKUP=/tmp/backup/
DB=`mysql -uroot -p123456    -e 'show databases;'|egrep -iv "Database|information_schema|mysql|performance_schema|sys"`

for i in ${DB} 
do
        mkdir -pv $BACKUP$i
        for dp in ${i}
        do
                mysqldump -uroot -p123456 --single-transaction --master-data=2 ${dp} >$BACKUP$i/${i}-${today}.sql
done
        done

