drop table o2c.VendorConsignment;

/*==============================================================*/
/* Table: VendorConsignment                                     */
/*==============================================================*/
create table if not exists o2c.VendorConsignment (
   Kernel_Name          STRING NOT NULL,
   Client               STRING NOT NULL,
   SystemID             STRING NOT NULL,
   MaterialNumber       STRING NOT NULL,
   Plant                STRING NOT NULL,
   StorageLocation      STRING,
   Batch                STRING,
   SpecialStockInd      STRING,
   Vendor               STRING,
   UnrestrictedStock    DECIMAL(13,3),
   change_type          STRING,
   "timeStamp"          TIMESTAMP,
   constraint FK_REFERENCE_4 foreign key (Vendor) references o2c.Vendor (Vendor) disable novalidate
)
   USING delta
   LOCATION 'abfss://wb-o2c-commercial@az21q1datalakewe.dfs.core.windows.net/silver/silverl2/O2C_WPP_CDM_Vendor_Consignment'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
