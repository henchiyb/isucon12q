#!/bin/sh
#TODO
cd webapp
sudo rm /home/isucon/webapp/.git/index.lock
git add .
git stash
git fetch
git checkout ${BRANCH_NAME}
git reset --hard origin/${BRANCH_NAME}
echo "Reset ${BRANCH_NAME} done"
#rebuild go
#TODO
sudo systemctl daemon-reload
sudo systemctl restart isuports.service

# reset memory cache
sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'
# reset log
sudo rm /var/log/nginx/access.log
sudo touch /var/log/nginx/access.log
sudo chmod 777 /var/log/nginx/access.log
sudo systemctl restart nginx

sudo rm /var/log/mysql/mysql-slow.log
sudo touch /var/log/mysql/mysql-slow.log
sudo chown mysql:mysql /var/log/mysql/mysql-slow.log
sudo systemctl restart mysql

echo "DONE"