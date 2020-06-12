#!/bin/bash

# create tables
clickhouse-client --multiline --multiquery < clickhouse_ddl.sql
echo "All tables successfully created"