#!/bin/bash

cp config/database.yml.travis config/database.yml
psql -c 'create database travis_ci_test;' -U postgres
