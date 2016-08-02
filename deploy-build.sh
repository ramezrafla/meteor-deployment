#! /bin/bash
cd ../build/meteor
rm -rf build
tar xvf meteor.tar.gz
cd bundle
(cd programs/server && npm install)
pm2 restart app-1
sleep 5
pm2 restart app-2
sleep 5
pm2 restart app-3
