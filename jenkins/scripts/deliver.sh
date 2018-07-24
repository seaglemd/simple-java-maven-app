#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -o "[0-9].[0-9]-SNAPSHOT$")
NAME=$(mvn help:evaluate -Dexpression=project.name | grep -o "my-app")
set -x
name=$NAME | grep -o "my-app$"
echo $name
java -jar target/$name-$VERSION.jar