--start_ignore
set max_memory_usage = 80000000000;
set max_threads = 10;
--end_ignore
-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Top Supplier Query (Q15)
-- Functional Query Definition
-- Approved February 1998

--sql_start
create view revenue0 as 
        select
                l_suppkey as supplier_no,
                sum(l_extendedprice * (1 - l_discount)) as total_revenue 
        from
                lineitem
        where
                l_shipdate >= toDate('1996-01-01') and l_shipdate < toDate('1996-04-01')
        group by
                l_suppkey;
--sql_end
