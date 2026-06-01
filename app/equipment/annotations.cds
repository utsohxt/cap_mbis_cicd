using EquipmentService from '../../srv/equipment-service';

// ─── List Report ────────────────────────────────────────────────────────────
annotate EquipmentService.Equipment with @(
  UI.SelectionFields: [
    Equipment,
    EquipmentName,
    EquipmentCategory,
    MaintenancePlant,
    CompanyCode
  ],
  UI.LineItem: [
    { $Type: 'UI.DataField', Value: Equipment,           Label: 'Equipment ID'         },
    { $Type: 'UI.DataField', Value: EquipmentName,       Label: 'Name'                 },
    { $Type: 'UI.DataField', Value: EquipmentCategory,   Label: 'Category'             },
    { $Type: 'UI.DataField', Value: TechnicalObjectType, Label: 'Object Type'          },
    { $Type: 'UI.DataField', Value: FunctionalLocation,  Label: 'Functional Location'  },
    { $Type: 'UI.DataField', Value: MaintenancePlant,    Label: 'Plant'                },
    { $Type: 'UI.DataField', Value: CompanyCode,         Label: 'Company Code'         },
    { $Type: 'UI.DataField', Value: CreationDate,        Label: 'Created On'           }
  ],
  UI.HeaderInfo: {
    TypeName      : 'Equipment',
    TypeNamePlural: 'Equipment',
    Title         : { Value: Equipment },
    Description   : { Value: EquipmentName }
  },
  UI.Facets: [
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'General Information',
      Target: '@UI.FieldGroup#General'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Organizational Data',
      Target: '@UI.FieldGroup#OrgData'
    }
  ],
  UI.FieldGroup#General: {
    Data: [
      { $Type: 'UI.DataField', Value: Equipment          },
      { $Type: 'UI.DataField', Value: EquipmentName      },
      { $Type: 'UI.DataField', Value: EquipmentCategory  },
      { $Type: 'UI.DataField', Value: TechnicalObjectType},
      { $Type: 'UI.DataField', Value: SuperiorEquipment  },
      { $Type: 'UI.DataField', Value: FunctionalLocation },
      { $Type: 'UI.DataField', Value: ValidityStartDate  },
      { $Type: 'UI.DataField', Value: ValidityEndDate    }
    ]
  },
  UI.FieldGroup#OrgData: {
    Data: [
      { $Type: 'UI.DataField', Value: MaintenancePlant   },
      { $Type: 'UI.DataField', Value: CompanyCode        },
      { $Type: 'UI.DataField', Value: CostCenter         },
      { $Type: 'UI.DataField', Value: CreationDate       },
      { $Type: 'UI.DataField', Value: LastChangeDate     }
    ]
  }
);
