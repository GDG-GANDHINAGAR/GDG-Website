#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "smitthakkar96@gmail.com"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
gulp build

# deploy
cd build
touch CNAME
echo "gdggandhinagar.org" > CNAME
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
