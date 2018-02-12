#!/bin/bash

hugo --baseURL="https://weeklyupdates.github.io"
cp -r ~/weeklyupdates.github.io/* ~/weeklyupdates.github.io.backup/
rm -rf ~/weeklyupdates.github.io/*
cp -r ~/blog-source/public/* ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-source.py
~/blog-source/expectBlog
cd ~/weeklyupdates.github.io
git add * 
python ~/blog-source/commit-site.py
~/blog-source/expectSite
