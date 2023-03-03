@AbapCatalog.sqlViewAppendName: 'ZXIPRODUCTPREM2'
@EndUserText.label: 'CDS view extension I_Product'
extend view I_Product with ZX_I_Product_Premium_2
{
  mara.zzpremium as ZZPREMIUM
}
