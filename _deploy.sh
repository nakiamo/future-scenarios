#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "naimcinar@gmail.com"
git config --global user.name "Nakiamo"

git clone -b gh-pages \
  https://${GITHUB_PAT}@github.com/${nakiamo/future-scenarios-book}.git \
  book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book"
git push -q origin gh-pages

