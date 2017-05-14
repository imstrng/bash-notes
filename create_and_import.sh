#!/bin/bash

read -p "  DB: " db
read -p " TBL: " tbl
read -p "File: " file


head -1 ${file} | sed 's/ \|#\|-\|\.\|-\|\///g' | sed 's/,/ TINYTEXT,\n/g' > /tmp/fields
echo "DROP TABLE IF EXISTS ${tbl};" > ${tbl}.sql
echo "CREATE TABLE ${tbl} (" >> ${tbl}.sql
cat /tmp/fields |\
  sed '/tio \|Theta \|Gamma \|Delta \|ImpVol \|Open \|High \|Low \|Bid \|Ask \|Price \|Yield \|Yld / s/TINYTEXT/ FLOAT(9,3)/g' |\
  sed '/Turnover \|Volume \|No \|Size / s/TINYTEXT/ INT(9)/g' |\
  sed '/^/ s/^/_/g' |\
  sed '/_DateTime / s/TINYTEXT/datetime(6)/g'\
  >> ${tbl}.sql
echo "TINYTEXT);" >> ${tbl}.sql
echo "alter table ${tbl} add primary key (_DateTime)" >> ${tbl}.sql

mysql -u root -p ${db} < ${tbl}.sql

mysqlimport --ignore-lines=1 --fields-terminated-by=, --local -u root -p ${db} ${tbl}.csv
