*&---------------------------------------------------------------------*
*& Report ZHVL_RAP_FLIGHT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhvl_rap_flight.

*- İç tablolar
DATA lt_flights TYPE STANDARD TABLE OF zi_flight.

*- Lojik
"CDS ile temel sorgulama
SELECT carrierid, connectionid, flightdate, price, currencycode, planetypeid, seatsmax, seatsoccupied
  FROM zi_flight
  INTO TABLE @lt_flights
 WHERE carrierid = 'LH'.

"ABAP SQL'de Exposed Association kurma
SELECT price, \_currency-currencyisocode
  FROM zi_flight
 WHERE \_currency-decimals = 0
  INTO TABLE @DATA(currencies).

BREAK-POINT.

IF 'to_see_overview' = 'of_all_annotations' .
  SUBMIT abap_docu_cds_annos_overview AND RETURN.
ENDIF.

BREAK-POINT.
