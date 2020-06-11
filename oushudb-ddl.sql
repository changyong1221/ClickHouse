DROP TABLE IF EXISTS NATION CASCADE;
DROP TABLE IF EXISTS CUSTOMER CASCADE;
DROP TABLE IF EXISTS REGION CASCADE;
DROP TABLE IF EXISTS PART CASCADE;
DROP TABLE IF EXISTS SUPPLIER CASCADE;
DROP TABLE IF EXISTS PARTSUPP CASCADE;
DROP TABLE IF EXISTS ORDERS CASCADE;
DROP TABLE IF EXISTS LINEITEM CASCADE;
DROP EXTERNAL TABLE IF EXISTS e_nation;
DROP EXTERNAL TABLE IF EXISTS e_customer;
DROP EXTERNAL TABLE IF EXISTS e_region;
DROP EXTERNAL TABLE IF EXISTS e_part;
DROP EXTERNAL TABLE IF EXISTS e_supplier;
DROP EXTERNAL TABLE IF EXISTS e_partsupp;
DROP EXTERNAL TABLE IF EXISTS e_orders;
DROP EXTERNAL TABLE IF EXISTS e_lineitem;

CREATE EXTERNAL TABLE e_nation (N_NATIONKEY  INTEGER ,
                            N_NAME       VARCHAR(25) ,
                            N_REGIONKEY  INTEGER ,
                            N_COMMENT    VARCHAR(152))
                        location ('gpfdist://localhost:8081/nation.tbl') format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_REGION  ( R_REGIONKEY  INTEGER ,
                            R_NAME       VARCHAR(25) ,
                            R_COMMENT    VARCHAR(152))
                        location ('gpfdist://localhost:8081/region.tbl') format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_PART  ( P_PARTKEY     INTEGER ,
                          P_NAME        VARCHAR(55) ,
                          P_MFGR        VARCHAR(25) ,
                          P_BRAND       VARCHAR(10) ,
                          P_TYPE        VARCHAR(25) ,
                          P_SIZE        INTEGER ,
                          P_CONTAINER   VARCHAR(10) ,
                          P_RETAILPRICE  FLOAT  ,
                          P_COMMENT     VARCHAR(23) )
                        location ('gpfdist://localhost:8081/part.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_SUPPLIER ( S_SUPPKEY     INTEGER ,
                             S_NAME        VARCHAR(25) ,
                             S_ADDRESS     VARCHAR(40) ,
                             S_NATIONKEY   INTEGER ,
                             S_PHONE       VARCHAR(15) ,
                             S_ACCTBAL      FLOAT  ,
                             S_COMMENT     VARCHAR(101) )
                        location ('gpfdist://localhost:8081/supplier.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_PARTSUPP ( PS_PARTKEY     INTEGER ,
                             PS_SUPPKEY     INTEGER ,
                             PS_AVAILQTY    INTEGER ,
                             PS_SUPPLYCOST   FLOAT   ,
                             PS_COMMENT     VARCHAR(199) )
                        location ('gpfdist://localhost:8081/partsupp.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_CUSTOMER ( C_CUSTKEY     INTEGER ,
                             C_NAME        VARCHAR(25) ,
                             C_ADDRESS     VARCHAR(40) ,
                             C_NATIONKEY   INTEGER ,
                             C_PHONE       VARCHAR(15) ,
                             C_ACCTBAL      FLOAT  ,
                             C_MKTSEGMENT  VARCHAR(10) ,
                             C_COMMENT     VARCHAR(117) )
                        location ('gpfdist://localhost:8081/customer.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_ORDERS  ( O_ORDERKEY       INT8 ,
                           O_CUSTKEY        INTEGER ,
                           O_ORDERSTATUS    VARCHAR(1) ,
                           O_TOTALPRICE      FLOAT  ,
                           O_ORDERDATE      DATE,
                           O_ORDERPRIORITY  VARCHAR(15) ,
                           O_CLERK          VARCHAR(15) ,
                           O_SHIPPRIORITY   INTEGER ,
                           O_COMMENT        VARCHAR(79) )
                        location ('gpfdist://localhost:8081/orders.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE E_LINEITEM ( L_ORDERKEY    INT8 ,
                              L_PARTKEY     INTEGER ,
                              L_SUPPKEY     INTEGER ,
                              L_LINENUMBER  INTEGER ,
                              L_QUANTITY     FLOAT  ,
                              L_EXTENDEDPRICE   FLOAT  ,
                              L_DISCOUNT     FLOAT  ,
                              L_TAX          FLOAT  ,
                              L_RETURNFLAG  VARCHAR(1) ,
                              L_LINESTATUS  VARCHAR(1) ,
                              L_SHIPDATE    DATE ,
                              L_COMMITDATE  DATE ,
                              L_RECEIPTDATE DATE ,
                              L_SHIPINSTRUCT CHAR(25) ,
                              L_SHIPMODE     VARCHAR(10) ,
                              L_COMMENT      VARCHAR(44) )
                         location ('gpfdist://localhost:8081/lineitem.tbl') format 'text' (delimiter '|');

CREATE TABLE NATION
(
    N_NATIONKEY INTEGER,
    N_NAME      CHAR(25),
    N_REGIONKEY INTEGER,
    N_COMMENT   VARCHAR(152)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE REGION
(
    R_REGIONKEY INTEGER,
    R_NAME      CHAR(25),
    R_COMMENT   VARCHAR(152)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE PART
(
    P_PARTKEY     INTEGER,
    P_NAME        VARCHAR(55),
    P_MFGR        CHAR(25),
    P_BRAND       CHAR(10),
    P_TYPE        VARCHAR(25),
    P_SIZE        INTEGER,
    P_CONTAINER   CHAR(10),
    P_RETAILPRICE DECIMAL(38,2),
    P_COMMENT     VARCHAR(23)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE SUPPLIER
(
    S_SUPPKEY   INTEGER,
    S_NAME      CHAR(25),
    S_ADDRESS   VARCHAR(40),
    S_NATIONKEY INTEGER,
    S_PHONE     CHAR(15),
    S_ACCTBAL   DECIMAL(38,2),
    S_COMMENT   VARCHAR(101)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE PARTSUPP
(
    PS_PARTKEY    INTEGER,
    PS_SUPPKEY    INTEGER,
    PS_AVAILQTY   INTEGER,
    PS_SUPPLYCOST DECIMAL(38,2),
    PS_COMMENT    VARCHAR(199)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE CUSTOMER
(
    C_CUSTKEY    INTEGER,
    C_NAME       VARCHAR(25),
    C_ADDRESS    VARCHAR(40),
    C_NATIONKEY  INTEGER,
    C_PHONE      CHAR(15),
    C_ACCTBAL    DECIMAL(38,2),
    C_MKTSEGMENT CHAR(10),
    C_COMMENT    VARCHAR(117)
) with (appendonly = true, orientation = orc, compresstype=lz4);

CREATE TABLE orders
(
    o_orderkey      bigint,
    o_custkey       INTEGER,
    o_orderstatus   CHAR,
    o_totalprice    DECIMAL(38,2),
    o_orderdate     DATE,
    o_orderpriority CHAR(15),
    o_clerk         CHAR(15),
    o_shippriority  integer,
    o_comment       VARCHAR(79)
) with (appendonly = true, orientation = orc, compresstype=lz4)
;

CREATE TABLE lineitem
(
    L_ORDERKEY      bigint,
    L_PARTKEY       INTEGER,
    L_SUPPKEY       INTEGER,
    L_LINENUMBER    INTEGER,
    L_QUANTITY      DECIMAL(38,2),
    L_EXTENDEDPRICE DECIMAL(38,2),
    L_DISCOUNT      DECIMAL(38,2),
    L_TAX           DECIMAL(38,2),
    L_RETURNFLAG    CHAR,
    L_LINESTATUS    CHAR,
    L_SHIPDATE      DATE,
    L_COMMITDATE    DATE,
    L_RECEIPTDATE   DATE,
    L_SHIPINSTRUCT  CHAR(25),
    L_SHIPMODE      CHAR(10),
    L_COMMENT       VARCHAR(44)
) with (appendonly = true, orientation = orc, compresstype=lz4);