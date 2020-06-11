--start_ignore
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set hawq_rm_nvseg_perquery_perseg_limit = 10;

\timing
--end_ignore
-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Customer Distribution Query (Q13)
-- Functional Query Definition
-- Approved February 1998


--sql_start
 select
	c_count,
	count(*) as custdist
from
	(
		select
			c_custkey,
			count(o_orderkey)
		from
			customer left outer join orders on
				c_custkey = o_custkey
				and o_comment not like '%special%requests%'
		group by
			c_custkey
	) as c_orders (c_custkey, c_count)
group by
	c_count
order by
	custdist desc,
	c_count desc;
--sql_end

