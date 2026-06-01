namespace cap.mbis.cicd;

// Local cache / extension for equipment data (optional, for future use)
entity EquipmentCache {
  key EquipmentId   : String(18);
  Description       : String(40);
  EquipmentCategory : String(1);
  CreatedOn         : Date;
}
