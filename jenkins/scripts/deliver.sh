#!/usr/bin/env bash
mvn jar:jar install:install help:evaluate -Dexpression=project.name
VERSION=$(mvn help:evaluate -Dexpression=project.version | grep -o "[0-9].[0-9]-SNAPSHOT$")
set -x
build_number=$(echo $VERSION | grep -o "[0-9].[0-9]-SNAPSHOT$")
java -jar target/my-app-$build_number.jar