--start_ignore
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set hawq_rm_nvseg_perquery_perseg_limit = 10;

\timing
--end_ignore
-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Local Supplier Volume Query (Q5)
-- Functional Query Definition
-- Approved February 1998


--sql_start
 select
	n_name,
	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	customer,
	orders,
	lineitem,
	supplier,
	nation,
	region
where
	c_custkey = o_custkey
	and l_orderkey = o_orderkey
	and l_suppkey = s_suppkey
	and c_nationkey = s_nationkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'ASIA'
	and o_orderdate >= date '1994-01-01'
	and o_orderdate < date '1994-01-01' + interval '1 year'
group by
	n_name
order by
	revenue desc;
--sql_end

