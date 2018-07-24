#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -o "[0-9].[0-9]-SNAPSHOT$")
NAME=$(mvn help:evaluate -Dexpression=project.name | grep -o "my-app")
echo "BEFORE THE ECHO ---------------"
echo $VERSION
VERSION=$VERSION | grep -o "[0-9].[0-9]-SNAPSHOT$"
echo $VERSION
echo $NAME
echo "AFTER THE ECHO ----------------"
set +x
java -jar target/$NAME-$VERSION.jar