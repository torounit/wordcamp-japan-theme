#!/usr/bin/env bash

set -e


if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
	echo "Not deploying pull requests."
	exit
fi

if [[ "develop" != "$TRAVIS_BRANCH" ]]; then
	echo "Not on the 'master' branch."
	exit
fi

git clone -b master --quiet "https://github.com/${TRAVIS_REPO_SLUG}.git" master
cp -R ./css/ ./master/css
cd master
git add -f ./css
git commit -m "Update from travis $TRAVIS_COMMIT"
git push --quiet "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git" master 2> /dev/null
