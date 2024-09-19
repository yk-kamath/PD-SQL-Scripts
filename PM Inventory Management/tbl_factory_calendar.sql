drop table o2c.tbl_factory_calendar;

/*==============================================================*/
/* Table: tbl_factory_calendar                                  */
/*==============================================================*/
create table if not exists o2c.tbl_factory_calendar (
   Kernel_Name          STRING,
   Client_Name          STRING,
   Plant                STRING,
   CalendarID           STRING,
   CalendarText         STRING,
   Year_from_which_data_is_stored STRING,
   Year_from_which_data_is_saved STRING,
   Bit_for_workday_2    STRING,
   Public_Holiday_Calendar STRING,
   CalendarDate         DATE,
   change_type          STRING,
   `timeStamp`          TIMESTAMP,
   constraint FK_FACTORYCALENDAR_PUBLICHOLIDAYCALENDAR foreign key (Kernel_Name, Public_Holiday_Calendar, change_type, `timeStamp`) references o2c.tbl_public_holiday_calendar (Kernel_Name, Public_Holiday_Calendar, change_type, `timeStamp`) disable novalidate,
   constraint FK_FACTORYCALENDAR_PLANT foreign key (Client_Name, Plant) references o2c.tbl_plant (Client_Name, Plant) disable novalidate
)
   USING delta
   LOCATION 'abfss://shared@az21q1datalakewe.dfs.core.windows.net/IM/O2C/silverl2/AzureDataLake/PlanToFinishedGoods/T_MBP_Factory_Calendar'
   TBLPROPERTIES (
     'delta.autoOptimize.autoCompact' = 'true',
     'delta.autoOptimize.optimizeWrite' = 'true',
     'delta.enableChangeDataFeed' = 'true',
     'delta.minReaderVersion' = '1',
     'delta.minWriterVersion' = '4');
