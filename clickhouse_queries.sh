#!/bin/bash

# execute queries
for ((c = 1; c <= 22; ++c))
do

	echo "----------- TPCH Q${c} -----------"
	clickhouse-client --multiline --multiquery --max_threads=10 --max_memory_usage=80000000000 --time --format=Pretty < queries/clickhouse_queries/tpch${c}.sql
	clickhouse-client --multiline --multiquery --max_threads=10 --max_memory_usage=80000000000 --time --format=Pretty < queries/clickhouse_queries/tpch${c}.sql

done