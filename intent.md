# Working Capital Data Product from ECC

SAP ECC-sourced working capital data product combining cash flow, billing, and financial transaction data.

## Business challenge

Build a governed, reusable data product exposing working capital sources from SAP ECC — covering cash flows, accounts receivable via billing documents, and financial transactions — for analytics and downstream consumption.

## Business Architecture (RBA)

### End-to-End Process

Manage Treasury (E2E)

### Process Hierarchy

```
Manage Treasury (E2E)
└── Manage Treasury (Phase)
    └── Manage payment, cash and risk (BPS-414_001)
        └── Manage cash and working capital
```

### Summary

Working capital management from ECC maps to the Manage Treasury E2E, specifically the "Manage payment, cash and risk" sub-process covering cash and working capital monitoring via cash flows, accounts receivable, and financial transactions.

## Fit Gap Analysis

| Requirement (business) | Standard asset(s) found | API ORD ID | MCP Server ORD ID | MCP Server Version | Webhook API ORD ID | Data Product ORD ID | Gap? | Notes / assumptions |
| ---------------------- | ----------------------- | ---------- | ----------------- | ------------------ | ------------------ | ------------------- | ---- | ------------------- |
| Cash flow data (actual + forecasted) | CashFlow data product | — | — | — | — | `sap.s4com:dataProduct:CashFlow:v1` | No | Active in tenant 5e5c0986; covers AR, AP, and treasury cash flows from ECC |
| Accounts receivable / billing | BillingDocument data product | — | — | — | — | `sap.s4com:dataProduct:BillingDocument:v1` | No | Customer invoices, credit/debit memos; drives AR postings |
| Treasury financial transactions | FinancialTransaction data product | — | — | — | — | `sap.s4com:dataProduct:FinancialTransaction:v1` | No | Full lifecycle treasury transactions with cash flow attributes |

### Key findings
- Three source data products confirmed: CashFlow, BillingDocument, FinancialTransaction from sap.s4com namespace.
- CashFlow v1.1.1 has an active instance (tenant 5e5c0986) — preferred primary source.
- SAP S/4HANA Cloud (Public and Private Edition) fully covers Cash and Liquidity Management, Treasury Analytics, and Payment Centralization capabilities.
- No existing working capital data product with the exact ECC-derived combination exists — a new derived product is required.
- Source data products are in the sap.s4com namespace, appropriate for S/4HANA / ECC-connected scenarios.

## Recommendations

### Working Capital Data Product

#### Executive Summary

Derived data product combining ECC cash, AR, and treasury data.

#### Recommended Solution

Build a new derived CDS-based data product that joins CashFlow, BillingDocument, and FinancialTransaction source data products into a unified working capital view. The product exposes key working capital metrics — cash position, AR aging, and treasury commitments — as a governed, reusable asset consumable by analytics tools, dashboards, and AI agents.

#### Recommended solution category

Data Product

#### Intent fit
90%
