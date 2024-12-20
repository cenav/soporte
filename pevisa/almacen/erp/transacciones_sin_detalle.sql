select g.*
  from kardex_g g
 where g.fch_transac >= to_date('01/01/2024', 'dd/mm/yyyy')
   and g.estado != '9'
   and not exists(
   select *
     from kardex_d d
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
   )
 order by ing_sal desc;

create table pevisa.tmp_carga_explosion_retail(
  cod_art  varchar2(30 byte)
  , cod_lin  varchar2(6 byte)
  , cantidad number(20, 5)
  , usuario  varchar2(30 byte)
  , cod_for  varchar2(30 byte)
  , tipo     varchar2(2 byte)
)
  tablespace pevisad
  pctused 0
  pctfree 10
  initrans 1
  maxtrans 255
  storage(initial 1344 k
          next 1 m
          maxsize unlimited
          minextents 1
          maxextents unlimited
          pctincrease 0
          buffer_pool default)
  logging
  nocompress
  nocache
  parallel(degree default instances default)
monitoring;


create or replace public synonym tmp_carga_explosion_retail for pevisa.tmp_carga_explosion_retail;


------ NUEVA TABLA TEMPORAL PARA ALMACENAR LA IMPLOSION   CUANDO SE ENCUENTRE COMPONENTES DENTRO DE SAO  UNICAMENTE SERA USADO EN ESTE PROCESO



create table pevisa.tmp_carga_implosion_sao(
  cod_art           varchar2(30 byte)
  , cod_for           varchar2(30 byte)
  , cod_sao           varchar2(30 byte)
  , usuario           varchar2(30 byte)
  , cant_requerida_st number(20, 5)
)
  tablespace pevisad
  pctused 0
  pctfree 10
  initrans 1
  maxtrans 255
  storage(initial 1344 k
          next 1 m
          maxsize unlimited
          minextents 1
          maxextents unlimited
          pctincrease 0
          buffer_pool default)
  logging
  nocompress
  nocache
  parallel(degree default instances default)
monitoring;


create or replace public synonym tmp_carga_implosion_sao for pevisa.tmp_carga_implosion_sao;


--- NUEVO PROCEDIMIENTO PARA CALCULAR LA CANTIDAD DE REQUERIDA CUANDO TIENE SAO


create or replace procedure pevisa.sp_implosion_retail_sao(
  cod_art in varchar2
) as
  cursor c1(
    p_cod_art  varchar2
    ) is
    select prd.cod_art
         , g.cod_art sao
         , (select canti
              from pcformulas
             where cod_art = g.cod_art
               and cod_for = prd.cod_art)
      canti
      from pr_consd prd, pr_consg g, pr_ot o
     where g.tipo_orden = o.nuot_tipoot_codigo
       and g.serie_orden = o.nuot_serie
       and g.num_orden = o.numero
       and g.tipo = prd.tipo
       and g.serie = prd.serie
       and g.numero = prd.numero
       and prd.cod_art = p_cod_art
       and g.cod_art in (select cod_art
                           from articul
                          where cod_lin in ('1970', '1971', '1972')
                            and cod_art = g.cod_art);

  cursor c2(
    p_cod_art  varchar2
    ) is
    select prd.cod_art
         , g.cod_art sao
         , total
         , (select canti
              from pcformulas
             where cod_art = g.cod_art
               and cod_for = prd.cod_art)
      canti_ter
      from pr_consd prd, pr_consg g, pr_ot o
     where g.tipo_orden = o.nuot_tipoot_codigo
       and g.serie_orden = o.nuot_serie
       and g.num_orden = o.numero
       and g.tipo = prd.tipo
       and g.serie = prd.serie
       and g.numero = prd.numero
       and prd.cod_art = p_cod_art
       and abre02 like 'ST%';
begin
  --for a in c1('400.1051-I')

  for a in c1(cod_art) loop
    dbms_output.put_line('Nivel 1 '|| '   Codigo: '|| a.cod_art|| ' Cod_for '|| a.sao|| '   rendimiento: '|| a.canti
    );

    --NULL;
    for b in c2(a.sao) loop
      dbms_output.put_line('Nivel 2 '|| '  Codigo: '|| a.cod_art|| ' Cod_for '|| b.sao|| '  Cod_for '|| a.sao|| '   rendimiento: '|| a.canti
        || ' Rendimiento terminado: '|| b.canti_ter|| '  TOTAL: '|| b.total|| '  CANT. SAO: '|| a.canti * b.canti_ter * b.total
      );

      insert into tmp_carga_implosion_sao(cod_art, cod_for, cod_sao, usuario, cant_requerida_st)
      values (a.cod_art, b.sao, a.sao, user, a.canti * b.canti_ter * b.total);
      --standard.commit;
      -- null;
    end loop;
  end loop;
end;


create or replace public synonym sp_implosion_retail_sao for pevisa.sp_implosion_retail_sao;