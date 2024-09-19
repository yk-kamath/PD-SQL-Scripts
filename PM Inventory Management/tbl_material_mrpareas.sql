drop table o2c.tbl_material_mrpareas;

/*==============================================================*/
/* Table: tbl_material_mrpareas                                 */
/*==============================================================*/
create table if not exists o2c.tbl_material_mrpareas (
   Kernel_Name          STRING,
   Client               STRING,
   Material_Number      STRING,
   MRP_Area             STRING,
   Plant                STRING,
   MRP_Profile          STRING,
   MRP_Type             STRING,
   MRP_Controller       STRING,
   MRP_Group            STRING,
   Reorder_Point        DECIMAL(13,3),
   Planning_Cycle       STRING,
   Planning_Time_Fence  STRING,
   Deletion_Indicator   STRING,
   Indicator_Is_Material_Relevant_ STRING,
   Planned_Delivery_Time_In_Days DECIMAL(3,0),
   Assembly_Scrap_In_Percent DECIMAL(5,0),
   Special_Procurement_Type STRING,
   Safety_Stock         DECIMAL(13,3),
   change_type          STRING,
   "timeStamp"          TIMESTAMP,
   constraint FK_MATERIALMRPAREAS_ITEM foreign key () references o2c.tbl_item () disable novalidate,
   constraint FK_MATERIALMRPAREAS_PLANT foreign key (Kernel_Name, Plant, change_type, "timeStamp") references o2c.tbl_plant (Kernel_Name, Plant, change_type, "timeStamp") disable novalidate
)
   USING delta
   LOCATION 'abfss://wb-o2c-commercial@az21q1datalakewe.dfs.core.windows.net/silver/silverl2/O2C_WPP_CDM_Material_MRPareas'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
