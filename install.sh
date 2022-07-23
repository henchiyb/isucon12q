#!bin/sh
#alp
echo 'y' | sudo apt install graphviz
wget https://github.com/tkuchiki/alp/releases/download/v1.0.9/alp_linux_amd64.zip
sudo apt-get install unzip
unzip alp_linux_amd64.zip
echo 'y' | sudo mv alp /usr/local/bin
sudo rm alp_linux_amd64.zip
sudo alp ltsv --file=/var/log/nginx/access.log --sort sum --reverse -o count,method,uri,min,max,sum,avg,p99 -q --nosave-pos --qs-ignore-values -m "/api/*"
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup
sudo rm /etc/nginx/nginx.conf
#TODO
sudo ln -s /home/isucon/webapp/nginx/nginx.conf /etc/nginx/nginx.conf