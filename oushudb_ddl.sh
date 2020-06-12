#!/bin/bash

# create tables
hawq sql -f ./oushudb_ddl.sql
