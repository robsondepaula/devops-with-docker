#!/bin/bash

usage() {
  echo "A simple 'build server' using shell script."
  echo "Run it passing as parameter the Github username and repo to build."
  echo "The repo must contain a Dockerfile for the build to be successfull."
  echo ""
  echo "Sample usage:"
  echo ""
  echo -e "\t$(basename $0) robsondepaula/shell-guessing-game"
  echo ""
  exit
}

if [ -z "$1" ] ; then
   usage
fi

git clone "https://github.com/${1}.git" git/

cd git

docker build -t ${1} .

docker push ${1}

rm -rf git/