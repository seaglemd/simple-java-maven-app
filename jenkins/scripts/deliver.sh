#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -o "[0-9].[0-9]-SNAPSHOT$")
NAME=$(mvn help:evaluate -Dexpression=project.name | grep -o "my-app")
echo "BEFORE THE ECHO ---------------"
echo $VERSION
echo $NAME
echo "AFTER THE ECHO ----------------"
NAME=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.name}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec)
java -jar target/my-app-$VERSION.jar