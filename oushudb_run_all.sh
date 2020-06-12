#!/bin/bash

# create tables
sh oushudb_ddl.sh

# load data
sh oushudb_load.sh

# execute queries
sh oushudb_queries.sh