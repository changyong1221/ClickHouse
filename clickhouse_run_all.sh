#!/bin/bash

# create tables
clickhouse-client --multiline --multiquery < clickhouse-ddl.sql

# load data
sh clickhouse_load.sh

# execute queries
sh clickhouse_queries.sh

