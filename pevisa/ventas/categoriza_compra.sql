select *
  from clientes
 where grupo_bateria is not null;

select cod_proveedor, detalle, cod_alm from tmp_carga_data;

update tmp_carga_data
   set cod_alm = case detalle
                   when 'LATA' then '10'
                   when 'BRONCE' then '20'
                   when 'PLATA' then '25'
                   when 'ORO' then '30'
                   when 'SAFIRO' then '35'
                   when 'DIAMANTE' then '40'
                 end;

merge into clientes c
using tmp_carga_data t
on (c.cod_cliente = t.cod_proveedor)
when matched then
  update set c.grupo_bateria = t.cod_alm;