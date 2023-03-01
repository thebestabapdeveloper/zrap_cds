*&---------------------------------------------------------------------*
*& Report ZPRIVILEGEDACCESS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprivilegedaccess.

"ABAP'ta, ayrıcalıklı erişim kontrolü,
" WITH PRIVILEGED ACCESS eklenerek atlanabilir.
"Erişim kontrolü yürütülmez ve kayıtlar,
" ABAP SQL'deki seçime göre CDS görünümü I_USER'dan seçilir.

SELECT *
  FROM i_user
  INTO TABLE @DATA(lt_user_restricted).

SELECT *
  FROM i_user
  WITH PRIVILEGED ACCESS
  INTO TABLE @DATA(lt_user).

BREAK-POINT.
