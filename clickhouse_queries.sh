#!/bin/bash

# execute queries
for ((c = 1; c <= 22; ++c))
do
	
	clickhouse-client --multiline --multiquery --time --format=Pretty < queries/clickhouse_queries/tpch${c}.sql

done