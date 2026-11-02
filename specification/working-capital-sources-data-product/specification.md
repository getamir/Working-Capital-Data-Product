# Specification: working-capital-sources-data-product

> **Guidelines**: Read [guidelines-data-product.md](../guidelines-data-product.md) before executing ANY tasks below. Follow all constraints described there throughout execution.

## Data Dependencies

Source data products confirmed during intent-analysis (no API ORD IDs — consumed via DPQuery only):

- `sap.s4com:dataProduct:CashFlow:v1` (tenant: 5e5c0986-12fa-4ce8-aa63-58879945974c) ✓ Active
- `sap.s4com:dataProduct:BillingDocument:v1` — schema not available at build time
- `sap.s4com:dataProduct:FinancialTransaction:v1` — schema not available at build time

## Basic Setup

- [x] Read `product-requirements-document.md` and `intent.md` for full context
- [x] Run `pwd` and store the output as `working_directory`
- [x] Invoke the `data-product` skill from Step 1a with confirmed source data products

## Project-Specific Tasks

### Working Capital Properties (Step 1a)

- [x] Properties approved: Technical Name = WorkingCapitalSources, Business Name = Working Capital Sources

### CSN Fetch and CDS Build (Step 2)

- [x] `jl data-product fetch-and-prepare` completed — 3 data products fetched; CashFlow schema available

### Schema Exploration and Cube View (Step 3)

- [x] CashFlow entities explored: CashFlow (16 fields), CashFlowForecast (13 fields)
- [x] Cube view `WorkingCapitalSourcesCube` written — GROUP BY CompanyCode, PostingDate, TransactionDate, currencies, BankAccountInternalID

### CDS Self-Check (Step 4)

- [x] CDS validated — all assertions passed

### Interop Generation (Step 5)

- [x] `jl data-product generate-interop` succeeded — WorkingCapitalSources.dpd created
- [x] AMS policy injected for all 7 dimension attributes

### Solution Setup (Step 6)

- [x] `asset.yaml` and `solution.yaml` created

### Refinement and Data Preview (Steps 7 and 7b)

- [x] Data preview generated and approved by user
