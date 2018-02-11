#!/bin/bash

git rm bufferA
cd ~/weeklyupdates.github.io
git rm bufferB
cd ~/blog-source
git add * 
python ~/blog-source/commit-source.py
~/blog-source/expectBlog
cd ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-site.py
~/blog-source/expectSite
