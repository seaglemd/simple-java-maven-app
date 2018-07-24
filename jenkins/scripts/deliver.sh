#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
echo '${NAME}:'
echo ${NAME}
#java -jar target/${NAME}-${VERSION}.jar

