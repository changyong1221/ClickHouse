drop table if exists nation;
drop table if exists customer;
drop table if exists region;
drop table if exists part;
drop table if exists supplier;
drop table if exists partsupp;
drop table if exists orders;
drop table if exists lineitem;

create table nation
(
    n_nationkey integer,
    n_name      String,
    n_regionkey integer,
    n_comment   String
) engine = MergeTree order by tuple();

create table region
(
    r_regionkey integer,
    r_name      String,
    r_comment   String
) engine = MergeTree order by tuple();

create table part
(
    p_partkey     integer,
    p_name        String,
    p_mfgr        String,
    p_brand       String,
    p_type        String,
    p_size        integer,
    p_container   String,
    p_retailprice float,
    p_comment     String
) engine = MergeTree order by tuple();

create table supplier
(
    s_suppkey   integer,
    s_name      String,
    s_address   String,
    s_nationkey integer,
    s_phone     String,
    s_acctbal   float,
    s_comment   String
) engine = MergeTree order by tuple();

create table partsupp
(
    ps_partkey    integer,
    ps_suppkey    integer,
    ps_availqty   integer,
    ps_supplycost float,
    ps_comment    String
) engine = MergeTree order by tuple();

create table customer
(
    c_custkey    integer,
    c_name       String,
    c_address    String,
    c_nationkey  integer,
    c_phone      String,
    c_acctbal    float,
    c_mktsegment String,
    c_comment    String
) engine = MergeTree order by tuple();

create table orders
(
    o_orderkey      Int64,
    o_custkey       integer,
    o_orderstatus   char,
    o_totalprice    float,
    o_orderdate     date,
    o_orderpriority String,
    o_clerk         String,
    o_shippriority  integer,
    o_comment       String
) engine = MergeTree order by tuple();
;

create table lineitem
(
    l_orderkey      Int64,
    l_partkey       integer,
    l_suppkey       integer,
    l_linenumber    integer,
    l_quantity      float,
    l_extendedprice float,
    l_discount      float,
    l_tax           float,
    l_returnflag    char,
    l_linestatus    char,
    l_shipdate      date,
    l_commitdate    date,
    l_receiptdate   date,
    l_shipinstruct  String,
    l_shipmode      String,
    l_comment       String
) engine = MergeTree order by tuple();