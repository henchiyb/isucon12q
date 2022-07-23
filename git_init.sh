#bin/bash!
rm -rf ~/.ssh/id_rsa 
rm -rf ~/.ssh/id_rsa.pub
echo 'Generate SSH key..'
ssh-keygen -f ~/.ssh/id_rsa -N ''
echo 'ssh key created OK!'
printf '\n'
cat ~/.ssh/id_rsa.pub
printf '\n'

#TODO
cd webapp
echo 'Init Isucon Repository..'
rm -rf .git && git init
echo 'Init Repo OK!'

echo 'Config Git email and user name...'
git config user.email "ducnhanyb@gmail.com"
git config user.name "henchiyb"
echo 'Config Git OK!'

echo 'add remote..'
git remote add origin git@github.com:henchiyb/isucon12q.git
echo 'Init Repo OK!'