drop table o2c.tbl_material_productionversions;

/*==============================================================*/
/* Table: tbl_material_productionversions                       */
/*==============================================================*/
create table if not exists o2c.tbl_material_productionversions (
   Kernel_Name          STRING,
   Client_Name          STRING,
   Material_Number      STRING,
   Plant                STRING,
   Production_Version   STRING,
   Key_for_Task_List_Group STRING,
   Run_time_end         DATE,
   Valid_from           DATE,
   Alternative_BOM      STRING,
   BOM_Usage            STRING,
   Task_List_Type       STRING,
   Group_Counter        STRING,
   Special_Procurement_Type STRING,
   Procurement_Type     STRING,
   Short_text_production_version STRING,
   Production_version_is_locked STRING,
   change_type          STRING,
   `timeStamp`          TIMESTAMP,
   constraint FK_MATERIALPRODUCTIONVERSION_ITEM foreign key () references o2c.tbl_item () disable novalidate,
   constraint FK_MATERIALPRODUCTIONVERSION_PLANT foreign key (Kernel_Name, Client_Name, Plant, change_type, `timeStamp`) references o2c.tbl_plant (Kernel_Name, Client_Name, Plant, change_type, `timeStamp`) disable novalidate
)
   USING delta
   LOCATION 'abfss://wb-o2c-commercial@az21q1datalakewe.dfs.core.windows.net/silver/silverl2/O2C_WPP_CDM_Material_Productionversions'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
