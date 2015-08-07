#!/usr/bin/env bash

sudo locale-gen UTF-8

sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

sudo apt-get -y install ruby2.2 ruby2.2-dev ruby-switch
sudo ruby-switch --set ruby2.2

sudo apt-get install bundler -y

sudo apt-get install -y mongodb

cd /vagrant
sudo bundle install
