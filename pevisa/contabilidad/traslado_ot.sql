select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 537;

select *
  from itemord
 where serie = 6
   and num_ped in (2246, 2251);