HOW TO USE
==========

Just run the installer. It will create symlinks to the repository 
files, warning if there is already a file with that name but not 
overwriting it. If you want to substitute that file with the ones 
provided, delete it and run the installer again.

DEPENDENCIES
============

.bashrc depends on:
* keychain package (not default on ubuntu or archlinux)
* rvm ( not a package by definition, see RVM section)

RVM
===

Just run:
    bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

Then restart your terminal and run:
    rvm install 1.8.7

Wait for it to install and run:
    rvm --default use 1.8.7
