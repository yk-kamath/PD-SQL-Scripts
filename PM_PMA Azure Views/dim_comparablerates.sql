drop table DIM_COMPARABLERATE;

/*==============================================================*/
/* Table: DIM_COMPARABLERATE                                    */
/*==============================================================*/
create table DIM_COMPARABLERATE (
COMPARABLERATEID integer,
COMPARABLERATENAME Text,
SOURCECURRENCYID integer,
COMPARABLERATE float,
YEAR integer
);
