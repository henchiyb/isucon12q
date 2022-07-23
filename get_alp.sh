#!bin/sh
#TODO
sudo alp ltsv --file=/var/log/nginx/access.log --sort sum --reverse -q --nosave-pos --qs-ignore-values
# sudo mysqldumpslow -s t /var/log/mysql/mysql-slow.log | head -n 20

# cd webapp
# BODY_ALP="$(sudo alp ltsv --file=/var/log/nginx/access.log --sort sum --reverse -o count,method,uri,min,max,sum,avg,p99 -q --nosave-pos --qs-ignore-values -m "/api/course/*,  /api/announcements/*")"
# BODY_SLOW_LOG="$(sudo mysqldumpslow -s t /tmp/slow-query.log | head -n 20)"
# gh issue comment 1 --body "$(echo -e "ALP RESULT\n\`\`\`\n$BODY_ALP\n\`\`\`\nSLOW LOG RESULT\n\`\`\`\n$BODY_SLOW_LOG\n\`\`\`")"