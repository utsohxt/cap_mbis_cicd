# cap_mbis_cicd – Equipment List App

CAP-based SAP Fiori application displaying equipment data from **API_EQUIPMENT** (S/4HANA).

## Architecture

```
┌─────────────────────────────┐
│  SAP Fiori Elements UI      │  sap.fe.templates (ListReport + ObjectPage)
│  app/equipment              │  SAP Horizon Theme
└────────────┬────────────────┘
             │ OData V4
┌────────────▼────────────────┐
│  CAP Node.js Service        │  srv/equipment-service.cds/.js
│  /equipment                 │
└────────────┬────────────────┘
             │ OData V2 (Proxy)
┌────────────▼────────────────┐
│  S/4HANA Backend: APD300    │  API_EQUIPMENT_SRV
└─────────────────────────────┘
```

## Local Development

```bash
npm install
cds watch
```

## Build & Deploy (SAP BTP)

```bash
# Build MTA archive
mbt build

# Deploy to Cloud Foundry
cf deploy mta_archives/cap_mbis_cicd_1.0.0.mtar -f
```

## SAP BTP CI/CD Service

Konfiguriere die Pipeline im SAP BTP Continuous Integration & Delivery Service:

1. **Pipeline-Vorlage**: `SAP Cloud Application Programming Model`
2. **Repository**: dieses Repository verbinden
3. **Konfigurationsdatei**: `.pipeline/config.yml`
4. Passe in `.pipeline/config.yml` die Werte für `cfOrg` und `cfSpace` an deinen BTP Subaccount an.

### Benötigte BTP Services

| Service | Plan | Zweck |
|---|---|---|
| HANA Cloud | hdi-shared | Datenbank |
| XSUAA | application | Authentifizierung |
| Destination | lite | APD300 Backend-Verbindung |
| HTML5 App Repository | app-host | UI-Hosting |

### Destination APD300

Anlegen im BTP Cockpit → Connectivity → Destinations:

| Eigenschaft | Wert |
|---|---|
| Name | APD300 |
| Type | HTTP |
| URL | `http://<your-s4-host>:<port>` |
| Proxy Type | OnPremise (via Cloud Connector) |
| Authentication | BasicAuthentication |

> **Hinweis**: Der Cloud Connector muss für den S/4HANA-Host `APD300` konfiguriert sein.
