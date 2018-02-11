#!/bin/bash

touch buffer1a
cd ~/weeklyupdates.github.io
touch buffer2b
cd ~/blog-source
git add * 
python ~/blog-source/commit-source.py
~/blog-source/expectBlog
cd ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-site.py
~/blog-source/expectSite
