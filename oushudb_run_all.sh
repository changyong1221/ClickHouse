#!/bin/bash

# create tables
hawq sql -f ./oushudb_ddl.sql

# load data
sh oushudb_load.sh

# execute queries
sh oushudb_queries.sh