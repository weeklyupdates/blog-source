#!/bin/bash

set githubName "weeklyupdates"

git rm buffer.1
cd ~/weeklyupdates.github.io
git rm buffer.2
cd ~/blog-source
git add * 
python ~/blog-source/commit-source.py
/usr/bin/expect <<EOD
spawn git push -u origin master
expect "Username for 'https://github.com':"
send -- "$githubName\r"
interact
EOD
cd ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-site.py
/usr/bin/expect <<EOD
spawn git push -u origin master
expect "Username for 'https://github.com':"
send -- "$githubName\r"
interact
EOD
