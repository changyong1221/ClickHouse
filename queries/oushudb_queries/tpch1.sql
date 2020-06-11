-- using 1478625302 as a seed to the RNG
-- $ID$
-- TPC-H/TPC-R Pricing Summary Report Query (Q1)
-- Functional Query Definition
-- Approved February 1998
--start_ignore
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set enforce_virtual_segment_number = 10;

\timing
--end_ignore
--sql_start
 select
	l_returnflag,
	l_linestatus,
	sum(l_quantity) as sum_qty,
	sum(l_extendedprice) as sum_base_price,
	sum(l_extendedprice * (1 - l_discount)) as sum_disc_price,
	sum(l_extendedprice * (1 - l_discount) * (1 + l_tax)) as sum_charge,
	avg(l_quantity)::decimal(15,2) as avg_qty,
	avg(l_extendedprice)::decimal(15,2) as avg_price,
	avg(l_discount)::decimal(15,2) as avg_disc,
	count(*) as count_order
from
	lineitem
where
	l_shipdate <= date '1998-12-01' - interval '90 day'
group by
	l_returnflag,
	l_linestatus
order by
	l_returnflag,
	l_linestatus;
--sql_end



