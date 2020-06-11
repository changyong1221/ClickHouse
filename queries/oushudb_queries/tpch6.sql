-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Forecasting Revenue Change Query (Q6)
-- Functional Query Definition
-- Approved February 1998
--start_ignore
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set hawq_rm_nvseg_perquery_perseg_limit = 10;

\timing
--end_ignore

--sql_start
 select
	sum(l_extendedprice * l_discount) as revenue
from
	lineitem
where
	l_shipdate >= date '1994-01-01'
	and l_shipdate < date '1994-01-01' + interval '1 year'
	and l_discount between 0.06 - 0.01 and 0.06 + 0.01
	and l_quantity < 24;
--sql_end

