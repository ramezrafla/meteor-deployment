cd ../meteor
meteor build --architecture=os.linux.x86_64 ../build
scp ../build/meteor.tar.gz user@example.org:/home/meteor/build
ssh user@example "cd /home/meteor/scripts && ./deploy-build.sh" &
