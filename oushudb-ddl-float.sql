

CREATE EXTERNAL TABLE e_nation (N_NATIONKEY  INTEGER ,
                            N_NAME       TEXT ,
                            N_REGIONKEY  INTEGER ,
                            N_COMMENT    TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T n -s 100"' on 4 format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_REGION  ( R_REGIONKEY  INTEGER ,
                            R_NAME       TEXT ,
                            R_COMMENT    TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T r -s 100"' on 4 format 'text' (delimiter '|');

CREATE EXTERNAL TABLE e_PART  ( P_PARTKEY     INTEGER ,
                          P_NAME        TEXT ,
                          P_MFGR        TEXT ,
                          P_BRAND       TEXT ,
                          P_TYPE        TEXT ,
                          P_SIZE        INTEGER ,
                          P_CONTAINER   TEXT ,
                          P_RETAILPRICE  FLOAT8  ,
                          P_COMMENT     TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T P -s 100 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                        on 4 format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_SUPPLIER ( S_SUPPKEY     INTEGER ,
                             S_NAME        TEXT ,
                             S_ADDRESS     TEXT ,
                             S_NATIONKEY   INTEGER ,
                             S_PHONE       TEXT ,
                             S_ACCTBAL      FLOAT8  ,
                             S_COMMENT     TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T s -s 100 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                        on 4 format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_PARTSUPP ( PS_PARTKEY     INTEGER ,
                             PS_SUPPKEY     INTEGER ,
                             PS_AVAILQTY    INTEGER ,
                             PS_SUPPLYCOST   FLOAT8   ,
                             PS_COMMENT     TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T S -s 100 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                        on 4 format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_CUSTOMER ( C_CUSTKEY     INTEGER ,
                             C_NAME        TEXT ,
                             C_ADDRESS     TEXT ,
                             C_NATIONKEY   INTEGER ,
                             C_PHONE       TEXT ,
                             C_ACCTBAL      FLOAT8  ,
                             C_MKTSEGMENT  TEXT ,
                             C_COMMENT     TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T c -s 100 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                        on 4 format 'text' (delimiter '|');
CREATE EXTERNAL TABLE e_ORDERS  ( O_ORDERKEY       INT8 ,
                           O_CUSTKEY        INTEGER ,
                           O_ORDERSTATUS    TEXT ,
                           O_TOTALPRICE      FLOAT8  ,
                           O_ORDERDATE      DATE,
                           O_ORDERPRIORITY  TEXT ,
                           O_CLERK          TEXT ,
                           O_SHIPPRIORITY   INTEGER ,
                           O_COMMENT        TEXT )
                        execute 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T O -s 100 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                        on 4 format 'text' (delimiter '|');
CREATE EXTERNAL TABLE E_LINEITEM ( L_ORDERKEY    INT8 ,
                              L_PARTKEY     INTEGER ,
                              L_SUPPKEY     INTEGER ,
                              L_LINENUMBER  INTEGER ,
                              L_QUANTITY     FLOAT8  ,
                              L_EXTENDEDPRICE   FLOAT8  ,
                              L_DISCOUNT     FLOAT8  ,
                              L_TAX          FLOAT8  ,
                              L_RETURNFLAG  TEXT ,
                              L_LINESTATUS  TEXT ,
                              L_SHIPDATE    DATE ,
                              L_COMMITDATE  DATE ,
                              L_RECEIPTDATE DATE ,
                              L_SHIPINSTRUCT TEXT ,
                              L_SHIPMODE     TEXT ,
                              L_COMMENT      TEXT )
                         EXECUTE 'bash -c "$GPHOME/bin/dbgen -b $GPHOME/bin/dists.dss -T L -s 1 -N 4 -n $((GP_SEGMENT_ID + 1))"'
                              on 4 format 'text' (delimiter '|');

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
    P_RETAILPRICE FLOAT8,
    P_COMMENT     TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE SUPPLIER
(
    S_SUPPKEY   INTEGER,
    S_NAME      TEXT,
    S_ADDRESS   TEXT,
    S_NATIONKEY INTEGER,
    S_PHONE     TEXT,
    S_ACCTBAL   FLOAT8,
    S_COMMENT   TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE PARTSUPP
(
    PS_PARTKEY    INTEGER,
    PS_SUPPKEY    INTEGER,
    PS_AVAILQTY   INTEGER,
    PS_SUPPLYCOST FLOAT8,
    PS_COMMENT    TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE CUSTOMER
(
    C_CUSTKEY    INTEGER,
    C_NAME       TEXT,
    C_ADDRESS    TEXT,
    C_NATIONKEY  INTEGER,
    C_PHONE      TEXT,
    C_ACCTBAL    FLOAT8,
    C_MKTSEGMENT TEXT,
    C_COMMENT    TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);

CREATE TABLE orders
(
    o_orderkey      bigint,
    o_custkey       INTEGER,
    o_orderstatus   CHAR,
    o_totalprice    FLOAT8,
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
    L_QUANTITY      FLOAT8,
    L_EXTENDEDPRICE FLOAT8,
    L_DISCOUNT      FLOAT8,
    L_TAX           FLOAT8,
    L_RETURNFLAG    CHAR,
    L_LINESTATUS    CHAR,
    L_SHIPDATE      DATE,
    L_COMMITDATE    DATE,
    L_RECEIPTDATE   DATE,
    L_SHIPINSTRUCT  TEXT,
    L_SHIPMODE      TEXT,
    L_COMMENT       TEXT
) with (appendonly = true, orientation = orc, compresstype=lz4, dicthreshold=0.8);