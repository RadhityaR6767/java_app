#!/bin/bash

# Use sed to extract values between <artifactId> and <version>
a=$(sed -n 's|<artifactId>\(.*\)</artifactId>|\1|p' pom.xml)
b=$(sed -n 's|<version>\(.*\)</version>|\1|p' pom.xml)

# Use sed to replace placeholders in file1.txt
sed -i "s|<<ARTIFACTID>>|$a|g; s|<<VERSION>>|$b|g" Dockerfile

cat Dockerfile
