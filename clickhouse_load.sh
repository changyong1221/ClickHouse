#!/bin/bash

# load data
for i in nation region part supplier partsupp customer orders lineitem
do
	cat tpch-dbgen/${i}.tbl | clickhouse-client --max_threads=10 --max_memory_usage=80000000000 --format_csv_delimiter="|" --query="insert into ${i} format CSV";
	echo "${i} table done."
done
echo "All table successfully loaded."

clickhouse-client --max_threads=10 --max_memory_usage=80000000000 --query="create view revenue0 as select l_suppkey as supplier_no, sum(l_extendedprice * (1 - l_discount)) as total_revenue from lineitem where l_shipdate >= toDate('1996-01-01') and l_shipdate < toDate('1996-04-01') group by l_suppkey;";
echo "Create view revenue0 succeeded."