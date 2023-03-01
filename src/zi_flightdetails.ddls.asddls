@AbapCatalog.sqlViewName: 'ZI_FLIGHTDETV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Detail'
define view ZI_FlightDetails
  with parameters
    P_TargetCurrency :abap.cuky( 5 )
  as select from ZI_Flight
  association [1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1] to /DMO/I_Connection as _Connection on  $projection.ConnectionId = _Connection.ConnectionID
                                                      and $projection.CarrierId    = _Connection.AirlineID
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      SeatsMax - SeatsOccupied as SeatsFree,
      case SeatsOccupied
      when SeatsMax
      then 'X'
       else ''
      end                      as FlightOccupied,

      @Semantics.amount.currencyCode: 'TargetCurrency'
      currency_conversion(
      amount => Price,
      source_currency => CurrencyCode,
      round => 'X',
      target_currency => :P_TargetCurrency,
      exchange_rate_date => FlightDate
      )                        as PriceInTargetCurrency,

      @Semantics.currencyCode: true
      cast(:P_TargetCurrency
      as vdm_v_target_currency
      preserving type)         as TargetCurrency,
      _Carrier,
      _Connection
}
where
  FlightDate >= $session.system_date
