.DEFAULT_GOAL := help
#TODO
APP_NAME:=isuports
SERVER_1:=isucon@54.249.124.34
SERVER_2:=isucon@13.115.2.227
SERVER_3:=isucon@52.68.210.58

pull:
	@ssh ${SERVER_1} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh
	@ssh ${SERVER_2} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh
	@ssh ${SERVER_3} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh

pull-is1:
	@ssh ${SERVER_1} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh

pull-is2:
	@ssh ${SERVER_2} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh

pull-is3:
	@ssh ${SERVER_3} "sudo -i -u isucon APP_NAME=${APP_NAME}" BRANCH_NAME=$(BRANCH_NAME)< pull.sh

install:
	@ssh ${SERVER_1} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh
	@ssh ${SERVER_2} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh
	@ssh ${SERVER_3} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh
install-1:
	@ssh ${SERVER_1} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh
install-2:
	@ssh ${SERVER_2} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh
install-3:
	@ssh ${SERVER_3} "sudo -i -u isucon" APP_NAME=${APP_NAME}< install.sh

get-alp-3:
	@ssh ${SERVER_3} "sudo -i -u isucon" < get_alp.sh

get-alp-2:
	@ssh ${SERVER_2} "sudo -i -u isucon" < get_alp.sh

get-alp-1:
	@ssh ${SERVER_1} "sudo -i -u isucon" < get_alp.sh

get-slowlog-1:
	@ssh ${SERVER_1} "sudo -i -u isucon" < get_slowlog.sh

get-slowlog-2:
	@ssh ${SERVER_2} "sudo -i -u isucon" < get_slowlog.sh

get-slowlog-3:
	@ssh ${SERVER_3} "sudo -i -u isucon" < get_slowlog.sh

reboot:
	@ssh ${SERVER_1} "sudo -i -u isucon" < reboot.sh
	@ssh ${SERVER_2} "sudo -i -u isucon" < reboot.sh
	@ssh ${SERVER_3} "sudo -i -u isucon" < reboot.sh

# install-db:
# 	@sudo apt-get install -yq percona-toolkit
# 	@wget https://github.com/KLab/myprofiler/releases/download/0.2/myprofiler.linux_amd64.tar.gz
# 	@tar xf myprofiler.linux_amd64.tar.gz
# 	@mv myprofiler ~/bin
# 	@rm myprofiler.linux_amd64.tar.gz

# enable-ruby:
# 	@sudo systemctl stop isubata.python
# 	@sudo systemctl disable isubata.python
# 	@sudo systemctl start isubata.ruby
# 	@sudo systemctl enable isubata.ruby
# 	@export PATH=$HOME/local/ruby/bin:$HOME/ruby/bin:$PATH

# restart: ## restart all service
# 	# @sudo cp config/nginx.conf /etc/nginx/
# 	# @sudo cp config/my.cnf /etc/
# 	@make -s nginx-restart
# 	@make -s db-restart
# 	@make -s ruby-restart

# ruby-log: ## Ruby server's log
# 	@sudo journalctl -f isubata.ruby

# ruby-restart: ## Restart Server
# 	@sudo systemctl restart isubata.ruby
# 	@echo 'Restart isu-ruby'

# nginx-restart: ## Restart nginx
# 	@sudo systemctl restart nginx
# 	@echo 'Restart nginx'

# nginx-log: ## tail nginx access.log
# 	@sudo tail -f /var/log/nginx/access.log

# nginx-error-log: ## tail nginx error.log
# 	@sudo tail -f /var/log/nginx/error.log

# alp: ## Run alp
# 	@alp -f /var/log/nginx/access.log  --sum  -r --aggregates '/profile/\w+, /diary/entry/\d+, /diary/entries/\w+, /diary/comment/\d+, /friends/\w+' --start-time-duration 5m

# db-restart: ## Restart mysql
# 	@sudo systemctl restart mysql
# 	@echo 'Restart mysql'

# db-log: ## tail mysql.log
# 	@sudo tail -f /var/log/mysql/mysql.log

# myprofiler: ## Run myprofiler
# 	@myprofiler -user=isucon -password=isucon -host=127.0.0.1

git-init:
	@ssh ${SERVER_1} "sudo -i -u isucon" < git_init.sh
	@ssh ${SERVER_2} "sudo -i -u isucon" < git_init.sh
	@ssh ${SERVER_3} "sudo -i -u isucon" < git_init.sh

.PHONY: help
help:
	@grep -E '^[a-z0-9A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'