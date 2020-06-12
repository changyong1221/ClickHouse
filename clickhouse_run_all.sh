#!/bin/bash

# create tables
sh clickhouse_ddl.sh

# load data
sh clickhouse_load.sh

# execute queries
sh clickhouse_queries.sh

