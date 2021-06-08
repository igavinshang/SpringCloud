#!/usr/bin/env bash

for file in $(find /sql -name "*.sql" -exec ls {} \;| grep -v postgres | sort | tr ' ' '|' | tr '\n' ' ')
do
    file=$(echo ${file} | tr '|' ' ')
    printf "Applying update ${file}\n"
    export MYSQL_PWD=$MYSQL_ROOT_PASSWORD
    mysql -uroot -h mysql < ${file}
done
