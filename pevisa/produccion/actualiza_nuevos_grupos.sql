select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 607457;

-- debe ser BH 0.32-670

create trigger tbu_pr_ot_det_cod_art
  after update of art_cod_art
  on pr_ot_det
  for each row
begin
  delete
    from pr_ot_det_lin
   where ot_nuot_tipoot_codigo = :old.ot_nuot_tipoot_codigo
     and ot_nuot_serie = :old.ot_nuot_serie
     and ot_numero = :old.ot_numero
     and art_cod_art = :old.art_cod_art;
end;


create trigger tai_pr_ot_det_grupo
  after insert
  on pr_ot_det
  for each row
begin
  delete
    from pr_ot_det_lin
   where ot_nuot_tipoot_codigo = :old.ot_nuot_tipoot_codigo
     and ot_nuot_serie = :old.ot_nuot_serie
     and ot_numero = :old.ot_numero
     and art_cod_art = :old.art_cod_art;
end;
