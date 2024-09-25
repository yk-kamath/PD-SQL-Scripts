drop table o2c.PurchaseRequisitionItem;

/*==============================================================*/
/* Table: PurchaseRequisitionItem                               */
/*==============================================================*/
create table if not exists o2c.PurchaseRequisitionItem (
   Kernel_Name          STRING,
   Client               STRING,
   Purchase_Req         STRING,
   Requisn_Item         STRING,
   Fixed_Vendor         STRING,
   Document_Type        STRING,
   Document_Cat         STRING,
   Del_Indicator        STRING,
   Material             STRING,
   Plant                STRING,
   Storage_Loc          STRING,
   Supplying_Plant      STRING,
   Quantity             DECIMAL(13,3),
   Unit_Of_Measure      STRING,
   Requisn_Date         DATE,
   Delivery_Date        DATE,
   Release_Date         DATE,
   GR_Proc_Time         DECIMAL(3,0),
   Item_Category        STRING,
   Purchasing_Org       STRING,
   Info_Record          STRING,
   Purchase_Order       STRING,
   Item                 STRING,
   Order_Quantity       DECIMAL(13,3),
   Fixed_Ind            STRING,
   Closed               STRING,
   Processing_stat      STRING,
   change_type          STRING,
   "timeStamp"          TIMESTAMP,
   Name_of_Person_who_Created_the_ STRING,
   constraint FK_REFERENCE_1 foreign key (Purchase_Order) references o2c.PurchaseOrder (Purchasing_Doc) disable novalidate
)
   USING delta
   LOCATION 'abfss://wb-o2c-commercial@az21q1datalakewe.dfs.core.windows.net/silver/silverl2/O2C_WPP_CDM_Purchase_Requisition_Item'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
