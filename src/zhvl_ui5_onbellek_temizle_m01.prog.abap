*&---------------------------------------------------------------------*
*& Include          ZHVL_UI5_ONBELLEK_TEMIZLE_M01
*&---------------------------------------------------------------------*
DEFINE listeye_ekle.
  CLEAR gs_return.
  gv_count += 1.
  gs_return-return = |{ gv_count } - { &1 } yürütüldü.|.
  APPEND gs_return TO gt_return.
END-OF-DEFINITION.
