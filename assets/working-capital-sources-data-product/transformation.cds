context cashflow {
};

@AccessControl.authorizationCheck : #MANDATORY
@Analytics.dataCategory : #FACT
@Analytics.dataExtraction.delta.changeDataCapture.mapping : [
  {
    table: 'FQM_FLOW',
    role: #MAIN,
    viewElement: [ 'CashFlowID', 'CshFlwValdtyStrtDteTmeVal' ],
    tableElement: [ 'flow_id', 'valid_from' ]
  }
]
@Analytics.dataExtraction.enabled : true
@Analytics.internalName : #LOCAL
@EndUserText.label : 'Cash Liquidity Actual Flow for WCI'
@ODM.oid : 'CashFlowOID'
@ObjectModel.modelingPattern : #ANALYTICAL_FACT
@ObjectModel.sapObjectNodeType.name : 'CashFlow'
@ObjectModel.supportedCapabilities : [ #CDS_MODELING_DATA_SOURCE, #EXTRACTION_DATA_SOURCE, #SQL_DATA_SOURCE ]
@ObjectModel.usageType.dataClass : #MIXED
@ObjectModel.usageType.serviceQuality : #D
@ObjectModel.usageType.sizeCategory : #XL
@VDM.viewType : #COMPOSITE
entity sap.![s4com:apiResource:CashFlow:v1].CashFlow {
  @EndUserText.heading : 'Flow ID'
  @EndUserText.label : 'Flow ID'
  @EndUserText.quickInfo : 'Flow ID'
  @ObjectModel.upperCase : true
  key CashFlowID : String(16);
  @EndUserText.heading : 'FQM Flow Valid From'
  @EndUserText.label : 'FQM Flow Valid From'
  @EndUserText.quickInfo : 'FQM Flow Valid From - Decimal Type'
  @ObjectModel.upperCase : true
  key CshFlwValdtyStrtDteTmeVal : Decimal(21, 7);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'CoCd'
  @EndUserText.label : 'Company Code'
  @EndUserText.quickInfo : 'Company Code'
  @ObjectModel.foreignKey.association : '_CompanyCode'
  @ObjectModel.upperCase : true
  CompanyCode : String(4);
  @EndUserText.heading : 'Transaction Date'
  @EndUserText.label : 'Transaction Date'
  @EndUserText.quickInfo : 'Transaction Date'
  @ObjectModel.foreignKey.association : '_CalendarDate'
  @ObjectModel.upperCase : true
  TransactionDate : Date;
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Pstng Date'
  @EndUserText.label : 'Posting Date'
  @EndUserText.quickInfo : 'Posting Date in the Document'
  @ObjectModel.upperCase : true
  PostingDate : Date;
  @EndUserText.heading : 'Currency'
  @EndUserText.label : 'Currency'
  @EndUserText.quickInfo : 'Currency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  TransactionCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount'
  @EndUserText.label : 'Amount'
  @EndUserText.quickInfo : 'Amount'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'TransactionCurrency'
  AmountInTransactionCurrency : Decimal(34, 4);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Crcy'
  @EndUserText.label : 'Currency'
  @EndUserText.quickInfo : 'Currency Key'
  @ObjectModel.foreignKey.association : '_CompanyCodeCurrency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  CompanyCodeCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount in Company Code Currency'
  @EndUserText.label : 'Amount in Company Code Currency'
  @EndUserText.quickInfo : 'Amount in Company Code Currency'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'CompanyCodeCurrency'
  AmountInCompanyCodeCurrency : Decimal(34, 4);
  @EndUserText.heading : 'Global Currency'
  @EndUserText.label : 'Global Currency'
  @EndUserText.quickInfo : 'Global Currency'
  @ObjectModel.foreignKey.association : '_GlobalCurrency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  GlobalCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount in Global Currency'
  @EndUserText.label : 'Amount in Global Currency'
  @EndUserText.quickInfo : 'Amount in Global Currency'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'GlobalCurrency'
  AmountInGlobalCurrency : Decimal(34, 4);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Technical ID'
  @EndUserText.label : 'Technical ID'
  @EndUserText.quickInfo : 'Bank Account Technical ID'
  @ObjectModel.foreignKey.association : '_BankAccount'
  @ObjectModel.upperCase : true
  BankAccountInternalID : String(10);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Bank Key'
  @EndUserText.label : 'Bank Key'
  @EndUserText.quickInfo : 'Bank Key'
  @ObjectModel.foreignKey.association : '_Bank'
  @ObjectModel.upperCase : true
  Bank : String(15);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Bank Country/Region Key'
  @EndUserText.label : 'Bank Ctry/Rgn. Key'
  @EndUserText.quickInfo : 'Bank Country/Region Key'
  @ObjectModel.foreignKey.association : '_BankCountry'
  @ObjectModel.upperCase : true
  BankCountry : String(3);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Name of Financial Institution'
  @EndUserText.label : 'Bank Name'
  @EndUserText.quickInfo : 'Name of Financial Institution'
  BankName : String(60);
  CashFlowOID : String(128);
};

@AccessControl.authorizationCheck : #MANDATORY
@Analytics.dataCategory : #FACT
@Analytics.dataExtraction.delta.changeDataCapture.mapping : [
  {
    table: 'FQM_FLOW',
    role: #MAIN,
    viewElement: [ 'CashFlowID', 'CshFlwValdtyStrtDteTmeVal' ],
    tableElement: [ 'flow_id', 'valid_from' ]
  }
]
@Analytics.dataExtraction.enabled : true
@Analytics.internalName : #LOCAL
@EndUserText.label : 'Cash Liquidity Forecast Flow for WCI'
@ODM.oid : 'CashFlowOID'
@ObjectModel.modelingPattern : #ANALYTICAL_FACT
@ObjectModel.sapObjectNodeType.name : 'CashFlow'
@ObjectModel.supportedCapabilities : [ #CDS_MODELING_DATA_SOURCE, #EXTRACTION_DATA_SOURCE, #SQL_DATA_SOURCE ]
@ObjectModel.usageType.dataClass : #MIXED
@ObjectModel.usageType.serviceQuality : #D
@ObjectModel.usageType.sizeCategory : #XL
@VDM.viewType : #COMPOSITE
entity sap.![s4com:apiResource:CashFlow:v1].CashFlowForecast {
  @EndUserText.heading : 'Flow ID'
  @EndUserText.label : 'Flow ID'
  @EndUserText.quickInfo : 'Flow ID'
  @ObjectModel.upperCase : true
  key CashFlowID : String(16);
  @EndUserText.heading : 'FQM Flow Valid From'
  @EndUserText.label : 'FQM Flow Valid From'
  @EndUserText.quickInfo : 'FQM Flow Valid From - Decimal Type'
  @ObjectModel.upperCase : true
  key CshFlwValdtyStrtDteTmeVal : Decimal(21, 7);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'CoCd'
  @EndUserText.label : 'Company Code'
  @EndUserText.quickInfo : 'Company Code'
  @ObjectModel.foreignKey.association : '_CompanyCode'
  @ObjectModel.upperCase : true
  CompanyCode : String(4);
  @EndUserText.heading : 'Transaction Date'
  @EndUserText.label : 'Transaction Date'
  @EndUserText.quickInfo : 'Transaction Date'
  @ObjectModel.foreignKey.association : '_CalendarDate'
  @ObjectModel.upperCase : true
  TransactionDate : Date;
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Pstng Date'
  @EndUserText.label : 'Posting Date'
  @EndUserText.quickInfo : 'Posting Date in the Document'
  @ObjectModel.upperCase : true
  PostingDate : Date;
  @EndUserText.heading : 'Currency'
  @EndUserText.label : 'Currency'
  @EndUserText.quickInfo : 'Currency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  TransactionCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount'
  @EndUserText.label : 'Amount'
  @EndUserText.quickInfo : 'Amount'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'TransactionCurrency'
  AmountInTransactionCurrency : Decimal(34, 4);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Crcy'
  @EndUserText.label : 'Currency'
  @EndUserText.quickInfo : 'Currency Key'
  @ObjectModel.foreignKey.association : '_CompanyCodeCurrency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  CompanyCodeCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount in Company Code Currency'
  @EndUserText.label : 'Amount in Company Code Currency'
  @EndUserText.quickInfo : 'Amount in Company Code Currency'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'CompanyCodeCurrency'
  AmountInCompanyCodeCurrency : Decimal(34, 4);
  @EndUserText.heading : 'Global Currency'
  @EndUserText.label : 'Global Currency'
  @EndUserText.quickInfo : 'Global Currency'
  @ObjectModel.foreignKey.association : '_GlobalCurrency'
  @ObjectModel.upperCase : true
  @Semantics.currencyCode : true
  GlobalCurrency : String(5);
  @Aggregation.default : #SUM
  @EndUserText.heading : 'Amount in Global Currency'
  @EndUserText.label : 'Amount in Global Currency'
  @EndUserText.quickInfo : 'Amount in Global Currency'
  @ObjectModel.upperCase : true
  @Semantics.amount.currencyCode : 'GlobalCurrency'
  AmountInGlobalCurrency : Decimal(34, 4);
  @AbapCatalog.typeSpec.changeDocumentRelevant : true
  @EndUserText.heading : 'Technical ID'
  @EndUserText.label : 'Technical ID'
  @EndUserText.quickInfo : 'Bank Account Technical ID'
  @ObjectModel.foreignKey.association : '_BankAccount'
  @ObjectModel.upperCase : true
  BankAccountInternalID : String(10);
  CashFlowOID : String(128);
};



@EndUserText.label : 'Working Capital Cash Flow Sources Cube'
define view WorkingCapitalSourcesCube as select from sap.![s4com:apiResource:CashFlow:v1].CashFlow as CF
{
  @Analytics.dimension : true
  key CF.CompanyCode                                                                                        as CompanyCode,
  @Analytics.dimension : true
      CF.PostingDate                                                                                        as PostingDate,
  @Analytics.dimension : true
      CF.TransactionDate                                                                                    as TransactionDate,
  @Analytics.dimension : true
      CF.TransactionCurrency                                                                                as TransactionCurrency,
  @Analytics.dimension : true
      CF.CompanyCodeCurrency                                                                                as CompanyCodeCurrency,
  @Analytics.dimension : true
      CF.GlobalCurrency                                                                                     as GlobalCurrency,
  @Analytics.dimension : true
      CF.BankAccountInternalID                                                                              as BankAccountInternalID,
      cast(SUM(CF.AmountInTransactionCurrency) as Decimal(34,4))                                           as AmountInTransactionCurrency,
      cast(SUM(CASE WHEN CF.AmountInTransactionCurrency IS NOT NULL THEN 1 ELSE 0 END) as Integer)         as AmountInTransactionCurrencyCount,
      cast(SUM(CF.AmountInCompanyCodeCurrency) as Decimal(34,4))                                           as AmountInCompanyCodeCurrency,
      cast(SUM(CASE WHEN CF.AmountInCompanyCodeCurrency IS NOT NULL THEN 1 ELSE 0 END) as Integer)         as AmountInCompanyCodeCurrencyCount,
      cast(SUM(CF.AmountInGlobalCurrency) as Decimal(34,4))                                                as AmountInGlobalCurrency,
      cast(SUM(CASE WHEN CF.AmountInGlobalCurrency IS NOT NULL THEN 1 ELSE 0 END) as Integer)              as AmountInGlobalCurrencyCount,
      cast(COUNT(*) as Integer)                                                                             as recordCount
}
GROUP BY
  CF.CompanyCode,
  CF.PostingDate,
  CF.TransactionDate,
  CF.TransactionCurrency,
  CF.CompanyCodeCurrency,
  CF.GlobalCurrency,
  CF.BankAccountInternalID;
