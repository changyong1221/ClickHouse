--start_ignore
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set hawq_rm_nvseg_perquery_perseg_limit = 10;

\timing
--end_ignore
-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Top Supplier Query (Q15)
-- Functional Query Definition
-- Approved February 1998

--sql_start
create view revenue0 (supplier_no, total_revenue) as
        select
                l_suppkey,
                sum(l_extendedprice * (1 - l_discount))
        from
                lineitem
        where
                l_shipdate >= date '1996-01-01'
                and l_shipdate < date '1996-01-01' + interval '3 month'
        group by
                l_suppkey;
--sql_end
