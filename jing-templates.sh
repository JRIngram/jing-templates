#!/bin/bash 
# Shell script to automatically create markdown files for a new github repository
# Files added include:
#   * CHANGELOG.md 
#   * Pull Request Template
#   * Bug Template 
#   * Feature request Template 

echo "############## jing-templates ##############"
echo "What is your github username?"
read USERNAME 

echo "$USERNAME, what is the absolute path to your repository?"
read REPOPATH

echo "What is the URL of the github repository?"
read URL

# Edit templates
cp -r templates templates-bak

# Change <USERNAME>
sed -i "s/<USERNAME>/$USERNAME/g" templates-bak/.github/ISSUE_TEMPLATE/*.md
sed -i "s/<USERNAME>/$USERNAME/g" templates-bak/.github/*.md
sed -i "s/<USERNAME>/$USERNAME/g" templates-bak/*.md

# Change <URL>
sed -i "s/<URL>/$URL/g" templates-bak/.github/ISSUE_TEMPLATE/*.md
sed -i "s/<URL>/$URL/g" templates-bak/.github/*.md
sed -i "s/<URL>/$URL/g" templates-bak/*.md