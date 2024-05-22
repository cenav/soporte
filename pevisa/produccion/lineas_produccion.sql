select *
  from tab_lineas
 where linea between '1930' and '1939'
   and length(linea) = 4;

select * from tipo_linea;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 4;

insert into tab_lineas_tipo_linea(cod_linea, cod_tipo)
select linea, 4
  from tab_lineas
 where linea between '1930' and '1939'
   and length(linea) = 4;

declare
  subtype t_blank is boolean;
  subtype t_linea is varchar2(30);
  type t_lineas is table of t_blank index by t_linea;
  l_lineas t_lineas;
  l_idx    pls_integer := 0;
begin
  for r in (
    select cod_linea
      from tab_lineas_tipo_linea
     where cod_tipo = 4
    )
  loop
    l_lineas(r.cod_linea) := false;
  end loop;

  l_idx := l_lineas.first;
  while l_idx is not null loop
    dbms_output.put_line(l_idx);
    l_idx := l_lineas.next(l_idx);
  end loop;

  if l_lineas.exists('1938xxxx') then
    dbms_output.put_line('Existe linea');
    else
    dbms_output.put_line('No existe');
  end if;
end;