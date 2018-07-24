#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep "[0-9].[0-9]-SNAPSHOT$")
$(mvn help:evaluate -Dexpression=project.version | grep "[0-9].[0-9]-SNAPSHOT$" | grep "[0-9].[0-9]-SNAPSHOT$")
echo "BEFORE THE ECHO ---------------"
echo $VERSION
echo "AFTER THE ECHO ----------------"
NAME=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.name}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec)
java -jar target/my-app-1.0-SNAPSHOT.jar