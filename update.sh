#!/bin/bash

set githubName "weeklyupdates"

touch bufferA
cd ~/weeklyupdates.github.io
touch bufferB
cd ~/blog-source
git add * 
python ~/blog-source/commit-source.py
~/blog-source/expectBlog
cd ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-site.py
~/blog-source/expectSite
