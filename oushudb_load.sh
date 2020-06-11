#!/bin/bash

gpfdist -d ./tpch-dbgen -p 8081 &

hawq sql -f ./oushudb_load.sql
