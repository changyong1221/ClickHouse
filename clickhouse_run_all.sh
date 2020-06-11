#!/bin/bash

# create tables
clickhouse-client --multiline --multiquery < clickhouse-ddl.sql


# load data
list = {nation, region, part, supplier, partsupp, customer, orders, lineitem}
for i in list
do
	cat tpch-dbgen/${i}.tbl | clickhouse-client --max_threads=8 --max_memory_usage=80000000000 --format_csv_delimiter="|" --query="insert into ${i} format CSV";
	echo "${i} table done."
done
echo "All table successfully loaded."


# execute queries
for ((c = 1; c <= 22; ++c))
do

	clickhouse-client --multiline --multiquery --time --format=Pretty < queries/clickhouse_queries/tpch${c}.sql

done

