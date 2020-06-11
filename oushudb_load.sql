
ALTER RESOURCE QUEUE pg_default with (VSEG_RESOURCE_QUOTA='mem:8gb');
set hawq_rm_nvseg_perquery_perseg_limit = 10;

insert into nation select * from e_nation;
insert into region select * from e_region;
insert into part select * from e_part;
insert into supplier select * from e_supplier;
insert into partsupp select * from e_partsupp;
insert into customer select * from e_customer;
insert into orders select * from e_orders;
insert into lineitem select * from e_lineitem;

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

ANALYZE nation;
ANALYZE region;
ANALYZE part;
ANALYZE supplier;
ANALYZE partsupp;
ANALYZE customer ;
ANALYZE orders;
ANALYZE lineitem;