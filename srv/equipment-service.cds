using { cap.mbis.cicd as db } from '../db/schema';

service EquipmentService @(path: '/equipment') {

  @readonly
  entity Equipment             as projection on db.Equipment;

  @readonly
  entity EquipmentCharacteristic as projection on db.EquipmentCharacteristic;
}
