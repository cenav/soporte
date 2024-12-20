create or replace package rol_pago_det is
  type t_letra_descuento is record (
    tipodoc           varchar2(30),
    nombre_doc        varchar2(100),
    banco             varchar2(30),
    nombre_bco        varchar2(100),
    cod_cliente       varchar2(100),
    serie_num         number(5),
    numero            number(10),
    moneda            varchar2(5),
    importe           number(14, 2),
    importex          number(14, 2),
    tcam_sal          number(14, 2),
    fecha             date,
    vencimiento       date,
    importe_dolar     number(14, 2),
    cancelacion       number(14, 2),
    cancelacion_dolar number(14, 2),
    saldo_a_fecha     number(14, 2)
  );

  type t_letras_descuento is table of t_letra_descuento index by binary_integer;

  function letras_en_descuento(
    p_fch_ini date
  , p_fch_fin date
  ) return t_letras_descuento;
end;

create or replace package body rol_pago_det as
  c_meses_hacia_adelante constant pls_integer := 3;

  function letras_en_descuento(
    p_fch_ini date
  , p_fch_fin date
  ) return t_letras_descuento is
    l_rep t_letras_descuento;
  begin
    for r in (
      -- reporte letras en descuento detalle
      select f.tipdoc as tipdoc, auxdoc.descripcion as nombre_doc, b.banco as banco
           , pro.nombre as nombre_bco, f.cod_cliente, f.serie_num, f.numero, f.moneda, f.importe
           , f.importex, f.tcam_sal, f.fecha, f.f_vencto
           , nvl(decode(f.moneda, 'D', f.importe, f.importe / f.tcam_sal), 0) as importe_dolar
           , sum(cob.importe) as cancelacion
           , nvl(sum(decode(cob.moneda, 'D', cob.importe, cob.importe_x)), 0) as cancelacion_dolar
           , nvl(f.importe + nvl(sum(cob.importe), 0), 0) as saldo_a_fecha
        from factcob f
             left join ctabnco b on (f.banco = b.codigo)
             left join plancta p on (b.cuenta = p.cuenta)
             left join clientes c on (f.cod_cliente = c.cod_cliente)
             left join tablas_auxiliares auxdoc
                       on (f.tipdoc = auxdoc.codigo
                         and auxdoc.tipo = 2)
             left join tablas_auxiliares auxbco
                       on (b.banco = auxbco.codigo
                         and auxbco.tipo = 11)
             left join proveed pro on (auxbco.obs = pro.cod_proveed)
             left join cabfcob cob
                       on (f.tipdoc = cob.tipdoc
                         and f.serie_num = cob.serie_num
                         and f.numero = cob.numero
                         and cob.fecha <= p_fch_fin)
       where f.tipdoc = 'LD'
         and f.estado != '9'
         and f.fecha between p_fch_ini and last_day(add_months(p_fch_ini, c_meses_hacia_adelante))
       group by f.tipdoc, auxdoc.descripcion, b.banco, pro.nombre, f.cod_cliente, f.serie_num
              , f.numero
              , f.moneda, f.importe, f.importex, f.tcam_sal, f.f_vencto, f.fecha
      having nvl(f.importe + nvl(sum(cob.importe), 0), 0) != 0
       order by numero
      )
    loop
      l_rep(l_rep.count + 1).tipodoc := r.tipdoc;
      l_rep(l_rep.count).nombre_doc := r.nombre_doc;
      l_rep(l_rep.count).banco := r.banco;
      l_rep(l_rep.count).nombre_bco := r.nombre_bco;
      l_rep(l_rep.count).cod_cliente := r.cod_cliente;
      l_rep(l_rep.count).serie_num := r.serie_num;
      l_rep(l_rep.count).numero := r.numero;
      l_rep(l_rep.count).moneda := r.moneda;
      l_rep(l_rep.count).importe := r.importe;
      l_rep(l_rep.count).importex := r.importex;
      l_rep(l_rep.count).tcam_sal := r.tcam_sal;
      l_rep(l_rep.count).fecha := r.fecha;
      l_rep(l_rep.count).vencimiento := r.f_vencto;
      l_rep(l_rep.count).importe_dolar := r.importe_dolar;
      l_rep(l_rep.count).cancelacion := r.cancelacion;
      l_rep(l_rep.count).cancelacion_dolar := r.cancelacion_dolar;
      l_rep(l_rep.count).saldo_a_fecha := r.saldo_a_fecha;
    end loop;

    return l_rep;
  end;

end;

declare
  l_rep rol_pago_det.t_letras_descuento;
  l_idx pls_integer := 0;
begin
  l_rep := rol_pago_det.letras_en_descuento('01/05/2024', '31/05/2024');
  l_idx := l_rep.first;
  while l_idx is not null loop
    l_idx := l_rep.next(l_idx);
  end loop;
  dbms_output.put_line(l_rep.count);
  dbms_output.put_line(l_rep.first);
  dbms_output.put_line(l_rep.last);
end;