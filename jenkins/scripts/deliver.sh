#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
java -version
echo ${NAME}-${VERSION}.jar
java -jar target/${NAME}-${VERSION}.jar

