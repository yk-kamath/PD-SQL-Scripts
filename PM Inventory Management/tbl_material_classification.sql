drop table o2c.tbl_material_classification;

/*==============================================================*/
/* Table: tbl_material_classification                           */
/*==============================================================*/
create table if not exists o2c.tbl_material_classification (
   Kernel_Name          STRING,
   Client_Name          STRING,
   Internal_Object_Number STRING,
   Class_Type           STRING,
   Name_of_database_table_for_obje STRING,
   Material_Number      STRING,
   Internal_characteristic STRING,
   Characteristic_value_counter STRING,
   Indicator_Object_Class STRING,
   Internal_counter_for_archiving_ STRING,
   Characteristic_Value STRING,
   Internal_floating_point_from DOUBLE,
   Internal_counter     STRING,
   Characteristic_Name  STRING,
   Creation_date        DATE,
   Key_of_object_to_be_classified STRING,
   Deletion_Indicator   STRING,
   Description          STRING,
   change_type          STRING,
   `timeStamp`          TIMESTAMP,
   constraint FK_MATERIALCLASSIFICATION_ITEM foreign key (Kernel_Name, Client_Name, change_type, `timeStamp`) references o2c.tbl_item (Kernel_Name, Client_Name, change_type, `timeStamp`) disable novalidate
)
   USING delta
   LOCATION 'abfss://shared@az21q1datalakewe.dfs.core.windows.net/IM/O2C/silverl2/AzureDataLake/PlanToFinishedGoods/T_MBP_Material_Classification'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
