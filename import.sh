#!/bin/bash
UP=$(pgrep mysql | wc -l);
if [ "$UP" -gt 0 ];
then
    echo "=> Starting MySQL Server"
    /usr/bin/mysqld_safe > /dev/null 2>&1 &
fi

PID=$!

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -u root -h $OPEN_EYES_DB_HOST -e "status" > /dev/null 2>&1
RET=$?
done

echo "   Started with PID ${PID}"

mysql -u root -h $OPEN_EYES_DB_HOST -e "CREATE DATABASE $OPEN_EYES_DB_DATABASE"
mysql -u root -h $OPEN_EYES_DB_HOST -e "CREATE USER '$OPEN_EYES_DB_USER' IDENTIFIED BY '$OPEN_EYES_DB_PASS'"
mysql -u root -h $OPEN_EYES_DB_HOST -e "grant all on $OPEN_EYES_DB_DATABASE.* to '$OPEN_EYES_DB_USER'@'%' identified by '$OPEN_EYES_DB_PASS'"

echo "Created user $OPEN_EYES_DB_USER on host $OPEN_EYES_DB_HOST with pass $OPEN_EYES_DB_PASS"

wget https://raw.githubusercontent.com/openeyes/Sample/master/sql/openeyes.sql
mysql $OPEN_EYES_DB_DATABASE -u $OPEN_EYES_DB_USER -p$OPEN_EYES_DB_PASS < openeyes.sql
