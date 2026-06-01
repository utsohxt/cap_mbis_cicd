const cds = require('@sap/cds');

module.exports = class EquipmentService extends cds.ApplicationService {
  async init() {
    const { Equipment, EquipmentCharacteristic } = this.entities;
    const api = await cds.connect.to('API_EQUIPMENT');

    this.on('READ', Equipment, async (req) => {
      const query = SELECT.from('API_EQUIPMENT.A_Equipment')
        .columns([
          'Equipment', 'EquipmentName', 'EquipmentCategory',
          'TechnicalObjectType', 'SuperiorEquipment', 'FunctionalLocation',
          'MaintenancePlant', 'CompanyCode', 'CostCenter',
          'CreationDate', 'LastChangeDate', 'ValidityStartDate', 'ValidityEndDate'
        ]);
      if (req.query.SELECT?.where) query.where(req.query.SELECT.where);
      if (req.query.SELECT?.limit)  query.limit(req.query.SELECT.limit.rows?.val ?? 50, req.query.SELECT.limit.offset?.val ?? 0);
      return api.run(query);
    });

    this.on('READ', EquipmentCharacteristic, async (req) => {
      return api.run(req.query);
    });

    return super.init();
  }
};
