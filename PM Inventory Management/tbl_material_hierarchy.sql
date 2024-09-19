drop table o2c.tbl_material_hierarchy;

/*==============================================================*/
/* Table: tbl_material_hierarchy                                */
/*==============================================================*/
create table if not exists o2c.tbl_material_hierarchy (
   Kernel_Name          STRING,
   Client_Name          STRING,
   Product_Hierarchy    STRING,
   Loading_Date         DATE,
   `Level`              STRING,
   Language_Key         STRING,
   Business_Group_Code  STRING,
   Business_Group_Name  STRING,
   Business_Unit_Code   STRING,
   Business_Unit_Name   STRING,
   Material_Group_Code  STRING,
   Material_Group_Name  STRING,
   Article_Group_Code   STRING,
   Article_Group_Name   STRING,
   change_type          STRING,
   `timeStamp`          TIMESTAMP
)
   USING delta
   LOCATION 'abfss://shared@az21q1datalakewe.dfs.core.windows.net/IM/O2C/silverl2/AzureDataLake/MasterData/T_MBP_Material_Hierarchy'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
