#!/bin/bash

# execute queries

for ((c = 1; c <= 22; ++c))
do

	echo "----------- TPCH Q${c} -----------"
	hawq sql -f queries/oushudb_queries/tpch${c}.sql
	hawq sql -f queries/oushudb_queries/tpch${c}.sql

done