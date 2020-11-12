#! /bin/bash

cd /prospect/prospect-mail

git pull
yarn
#yarn start
yarn run dist:linux

cp /prospect/prospect-mail/dist/* /prospect/dist/