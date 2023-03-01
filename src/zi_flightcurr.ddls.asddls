@AbapCatalog.sqlViewName: 'ZI_FLIGHTCURRV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exposed Association'
define view ZI_FlightCurr
  as select from ZI_Flight
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      CurrencyCode,
      _Currency.CurrencyISOCode,
      _Currency as _FlightCurrency
}
