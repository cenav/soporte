select *
  from clientes
 where cod_cliente in (
                       '20131823020', '20116225779', '20131867744', '20547999691', '20600180631',
                       '20601226015'
   );

select *
  from clientes
 where grupo = 'B114';

select *
  from clientes_otros
 where cod_cliente in (
                       '20131823020', '20116225779', '20131867744', '20547999691', '20600180631',
                       '20601226015'
   );

select *
  from clientes_otros
 where cod_cliente = '20100010217';

select *
  from pedido
 where cod_cliente = '20131823020'
   and extract(year from fecha) = 2024
 order by fecha desc;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 21360;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 21360;

select *
  from kardex_g
 where tipo_pguia = '01'
   and serie_pguia = 'F050'
   and numero_pguia = '199757';

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 21360;

select ge.guia_serie, ge.guia_numero
  from kardex_g_guia_remision ge
     , kardex_g kg
 where ge.cod_alm = kg.cod_alm
   and ge.tp_transac = kg.tp_transac
   and ge.serie = kg.serie
   and ge.numero = kg.numero
   and kg.tipo_pguia = '01'
   and kg.serie_pguia = 'F050'
   and kg.numero_pguia = '199757';

select *
  from relacion
 where tipodoc = 'P2'
   and serie = 20
   and numero = '243980';

select distinct tipo
  from relacion;

select *
  from relacion
 where tipo = 'G'
   and tipodoc = '21'
   and serie = 25
   and numero = 21360;

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F050'
   and numero = 199757;

select decode(numero_kardex, null, '',
              lpad(serie_kardex, 4, 0) || '-' || lpad(numero_kardex, 8, 0))
     , decode(tp_transac_kardex, '21', '09', '  ')
  from docuvent d
 where d.tipodoc = '01'
   and d.serie = 'F050'
   and d.numero = 202875;

declare
  function nro_guia_eletronica(
    p_tpodoc varchar2
  , p_serdoc varchar2
  , p_nrodoc varchar2
  ) return varchar2 is
    l_nro_guia varchar2(32767);
    l_row      pls_integer := 0;
  begin
    for r in (
      select ge.guia_serie, ge.guia_numero
        from kardex_g_guia_remision ge
           , kardex_g kg
       where ge.cod_alm = kg.cod_alm
         and ge.tp_transac = kg.tp_transac
         and ge.serie = kg.serie
         and ge.numero = kg.numero
         and kg.tipo_pguia = p_tpodoc
         and kg.serie_pguia = p_serdoc
         and kg.numero_pguia = p_nrodoc
      )
    loop
      l_row := l_row + 1;
      if l_row = 1 then
        l_nro_guia := r.guia_serie || '-' || r.guia_numero;
      else
        l_nro_guia := l_nro_guia || '/' || r.guia_numero;
      end if;
    end loop;
    return l_nro_guia;
  end;
begin
  dbms_output.put_line(nro_guia_eletronica('01', 'F050', '202875'));
end;