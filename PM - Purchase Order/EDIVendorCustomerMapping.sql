drop table EDIVendorCustomerMapping;

/*==============================================================*/
/* Table: EDIVendorCustomerMapping                              */
/*==============================================================*/
create table if not exists EDIVendorCustomerMapping (
   "Kernel Name"        VARCHAR(3),
   "Client Name"        VARCHAR(3),
   "Customer Number"    CHAR(10),
   "Vendor number sent with EDI" CHAR(20),
   "Sales Organization" CHAR(4),
   "Distribution Channel" CHAR(2),
   Division             CHAR(2),
   "Sales Document Type" CHAR(4),
   "Document Type for Returns Order" CHAR(4)
);
