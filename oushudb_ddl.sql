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
                            N_NAME       TEXT ,
                            N_REGIONKEY  INTEGER ,
                            N_COMMENT    TEXT
                        location ('gpfdist://localhost:8081/nation.tbl') format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_REGION  ( R_REGIONKEY  INTEGER ,
                            R_NAME       TEXT ,
                            R_COMMENT    TEXT
                        location ('gpfdist://localhost:8081/region.tbl') format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_PART  ( P_PARTKEY     INTEGER ,
                          P_NAME        TEXT ,
                          P_MFGR        TEXT ,
                          P_BRAND       TEXT ,
                          P_TYPE        TEXT ,
                          P_SIZE        INTEGER ,
                          P_CONTAINER   TEXT ,
                          P_RETAILPRICE  FLOAT  ,
                          P_COMMENT     TEXT )
                        location ('gpfdist://localhost:8081/part.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_SUPPLIER ( S_SUPPKEY     INTEGER ,
                             S_NAME        TEXT ,
                             S_ADDRESS     TEXT ,
                             S_NATIONKEY   INTEGER ,
                             S_PHONE       TEXT ,
                             S_ACCTBAL      FLOAT  ,
                             S_COMMENT     TEXT )
                        location ('gpfdist://localhost:8081/supplier.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_PARTSUPP ( PS_PARTKEY     INTEGER ,
                             PS_SUPPKEY     INTEGER ,
                             PS_AVAILQTY    INTEGER ,
                             PS_SUPPLYCOST   FLOAT   ,
                             PS_COMMENT     TEXT )
                        location ('gpfdist://localhost:8081/partsupp.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_CUSTOMER ( C_CUSTKEY     INTEGER ,
                             C_NAME        TEXT ,
                             C_ADDRESS     TEXT ,
                             C_NATIONKEY   INTEGER ,
                             C_PHONE       TEXT ,
                             C_ACCTBAL      FLOAT  ,
                             C_MKTSEGMENT  TEXT ,
                             C_COMMENT     TEXT )
                        location ('gpfdist://localhost:8081/customer.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_ORDERS  ( O_ORDERKEY       INT8 ,
                           O_CUSTKEY        INTEGER ,
                           O_ORDERSTATUS    TEXT ,
                           O_TOTALPRICE      FLOAT  ,
                           O_ORDERDATE      DATE,
                           O_ORDERPRIORITY  TEXT ,
                           O_CLERK          TEXT ,
                           O_SHIPPRIORITY   INTEGER ,
                           O_COMMENT        TEXT )
                        location ('gpfdist://localhost:8081/orders.tbl') format 'text' (delimiter '|');
CREATE EXTERNAL TABLE E_LINEITEM ( L_ORDERKEY    INT8 ,
                              L_PARTKEY     INTEGER ,
                              L_SUPPKEY     INTEGER ,
                              L_LINENUMBER  INTEGER ,
                              L_QUANTITY     FLOAT  ,
                              L_EXTENDEDPRICE   FLOAT  ,
                              L_DISCOUNT     FLOAT  ,
                              L_TAX          FLOAT  ,
                              L_RETURNFLAG  TEXT ,
                              L_LINESTATUS  TEXT ,
                              L_SHIPDATE    DATE ,
                              L_COMMITDATE  DATE ,
                              L_RECEIPTDATE DATE ,
                              L_SHIPINSTRUCT TEXT ,
                              L_SHIPMODE     TEXT ,
                              L_COMMENT      TEXT )
                         location ('gpfdist://localhost:8081/lineitem.tbl') format 'text' (delimiter '|');

CREATE TABLE NATION
(
    N_NATIONKEY INTEGER,
    N_NAME      TEXT,
    N_REGIONKEY INTEGER,
    N_COMMENT   TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE REGION
(
    R_REGIONKEY INTEGER,
    R_NAME      TEXT,
    R_COMMENT   TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE PART
(
    P_PARTKEY     INTEGER,
    P_NAME        TEXT,
    P_MFGR        TEXT,
    P_BRAND       TEXT,
    P_TYPE        TEXT,
    P_SIZE        INTEGER,
    P_CONTAINER   TEXT,
    P_RETAILPRICE DECIMAL(38,2),
    P_COMMENT     TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE SUPPLIER
(
    S_SUPPKEY   INTEGER,
    S_NAME      TEXT,
    S_ADDRESS   TEXT,
    S_NATIONKEY INTEGER,
    S_PHONE     TEXT,
    S_ACCTBAL   DECIMAL(38,2),
    S_COMMENT   TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE PARTSUPP
(
    PS_PARTKEY    INTEGER,
    PS_SUPPKEY    INTEGER,
    PS_AVAILQTY   INTEGER,
    PS_SUPPLYCOST DECIMAL(38,2),
    PS_COMMENT    TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE CUSTOMER
(
    C_CUSTKEY    INTEGER,
    C_NAME       TEXT,
    C_ADDRESS    TEXT,
    C_NATIONKEY  INTEGER,
    C_PHONE      TEXT,
    C_ACCTBAL    DECIMAL(38,2),
    C_MKTSEGMENT TEXT,
    C_COMMENT    TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE orders
(
    o_orderkey      bigint,
    o_custkey       INTEGER,
    o_orderstatus   CHAR,
    o_totalprice    DECIMAL(38,2),
    o_orderdate     DATE,
    o_orderpriority TEXT,
    o_clerk         TEXT,
    o_shippriority  integer,
    o_comment       TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8)
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
    L_SHIPINSTRUCT  TEXT,
    L_SHIPMODE      TEXT,
    L_COMMENT       TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);