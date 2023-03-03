@AbapCatalog.sqlViewAppendName: 'ZXEPRODUCTPREM'
@EndUserText.label: 'CDS view extension(include view)'
extend view E_Product with ZX_E_Product_Premium
{
  Persistence.zzpremium as ZZPremium
}
