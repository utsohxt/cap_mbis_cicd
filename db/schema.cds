namespace cap.mbis.cicd;

entity Equipment {
  key Equipment          : String(18);
  EquipmentName          : String(40);
  EquipmentCategory      : String(1);
  TechnicalObjectType    : String(10);
  SuperiorEquipment      : String(18);
  FunctionalLocation     : String(40);
  MaintenancePlant       : String(4);
  CompanyCode            : String(4);
  CostCenter             : String(10);
  CreationDate           : Date;
  LastChangeDate         : Date;
  ValidityStartDate      : Date;
  ValidityEndDate        : Date;
}

entity EquipmentCharacteristic {
  key Equipment        : String(18);
  key CharcInternalID  : String(10);
  Characteristic       : String(30);
  CharacteristicValue  : String(70);
}
