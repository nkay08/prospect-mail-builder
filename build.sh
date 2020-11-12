#! /bin/bash

cd /prospect/prospect-mail

git config pull.ff only
git pull
yarn
#yarn start
n=0
max_tries=4
until [ "$n" -ge "$max_tries" ]
do
   yarn run dist:linux && break  # substitute your command here
   n=$((n+1)) 
   echo "Failed. Trying again"
   sleep 2
done

if [ "$n" -ge "$max_tries" ]; then
	echo "FAILED. Exceeded maximum tries"
	exit 1
fi

rm -r /prospect/prospect-mail/dist/linux-unpacked || true
cp  /prospect/prospect-mail/dist/* /prospect/dist/