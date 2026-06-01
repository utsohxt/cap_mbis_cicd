using { API_EQUIPMENT as external } from './external/API_EQUIPMENT';

service EquipmentService @(path: '/equipment') {

  @readonly
  entity Equipment as projection on external.A_Equipment {
    key Equipment,
    EquipmentName,
    EquipmentCategory,
    TechnicalObjectType,
    SuperiorEquipment,
    FunctionalLocation,
    MaintenancePlant,
    CompanyCode,
    CostCenter,
    CreationDate,
    LastChangeDate,
    ValidityStartDate,
    ValidityEndDate
  };

  @readonly
  entity EquipmentCharacteristic as projection on external.A_EquipCharacteristic {
    key Equipment,
    key CharcInternalID,
    Characteristic,
    CharacteristicValue
  };
}
