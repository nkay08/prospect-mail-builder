#! /bin/bash

cd /prospect/prospect-mail

git config pull.ff only
git pull
yarn
#yarn start
n=0
until [ "$n" -ge 3 ]
do
   yarn run dist:linux && break  # substitute your command here
   n=$((n+1)) 
   sleep 15
done

cp -r /prospect/prospect-mail/dist/* /prospect/dist/