#! /bin/bash

# This script auto push from git to github
git config --global user.name " Prakash Poudel"
git config --global user.email "poudelpra@gmail.com"
git add .
git commit -am "This is Automatically committed for the change, not a manual trigger"
git push origin master
