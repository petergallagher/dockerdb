#!/bin/bash

mysql -u root -h $OPEN_EYES_DB_HOST -e "CREATE DATABSE $OPEN_EYES_DB_DATABASE"
mysql -u root -h $OPEN_EYES_DB_HOST -e "CREATE USER '$OPEN_EYES_DB_USER' IDENTIFIED BY '$OPEN_EYES_DB_PASS'"
mysql -u root -h $OPEN_EYES_DB_HOST -e "CREATE USER '$OPEN_EYES_DB_USER';"
mysql -u root -h $OPEN_EYES_DB_HOST -e "grant all on $OPEN_EYES_DB_DATABASE.* to '$OPEN_EYES_DB_USER'@'%' identified by '$OPEN_EYES_DB_PASS'"

curl https://raw.githubusercontent.com/openeyes/Sample/master/sql/openeyes+ophtroperationbooking.sql | mysql -u $OPEN_EYES_DB_USER