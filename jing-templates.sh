#!/bin/bash 
# Shell script to automatically create markdown files for a new github repository
# Files added include:
#   * CHANGELOG.md 
#   * Pull Request Template
#   * Bug Template 
#   * Feature request Template 
echo "####### jing-templates #######"
echo "What is your github username?"
read USERNAME 
echo "$USERNAME, what is the absolute path to your repository?"
read PATH
echo "What is the project name?"
read PROJECT
echo "What is the URL of the github repository?"
read URL

echo $PATH
echo $PROJECT
echo $URL
