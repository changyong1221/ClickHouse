#!/bin/bash

# create tables
hawq sql -f ./oushudb_ddl.sql


# load data
gpfdist -d ./tpch-dbgen -p 8081 &
hawq sql -f ./oushudb_load.sql


# execute queries
for ((c = 1; c <= 22; ++c))
do
	
	hawq sql -f queries/oushudb_queries/tpch${c}.sql

done