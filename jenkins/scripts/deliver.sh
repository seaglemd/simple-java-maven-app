#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name

VERSION=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.version}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec)
echo $VERSION
echo "NEXT VERSION -----------------------"
echo ${VERSION}
NAME=$(mvn -q -Dexec.executable="echo" -Dexec.args='${project.name}' --non-recursive org.codehaus.mojo:exec-maven-plugin:1.3.1:exec)
java -jar target/${NAME}-${VERSION}.jar

