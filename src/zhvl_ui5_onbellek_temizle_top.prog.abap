*&---------------------------------------------------------------------*
*& Include          ZHVL_UI5_ONBELLEK_TEMIZLE_TOP
*&---------------------------------------------------------------------*

*- Tipler
TYPES: BEGIN OF gty_bilgi,
         return TYPE char140,
       END OF gty_bilgi.
TYPES gtt_bilgiler TYPE TABLE OF gty_bilgi.

*- İç tablolar
DATA gt_return TYPE gtt_bilgiler.

*- Yapılar
DATA gs_return TYPE gty_bilgi.

*- Değişken alanlar
DATA gv_count  TYPE n LENGTH 2.
