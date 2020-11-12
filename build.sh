#! /bin/bash

cd /prospect/prospect-mail

git config pull.ff only
git pull
yarn
#yarn start
yarn run dist:linux

cp /prospect/prospect-mail/dist/* /prospect/dist/