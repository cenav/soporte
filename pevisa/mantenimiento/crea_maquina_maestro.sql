declare
  cursor cr_activos is
    select *
      from activo_fijo
     where (cod_activo_fijo like 'MQ1PJEB-038-1%'
       or cod_activo_fijo like 'MQ1PJEB-039-2%'
       or cod_activo_fijo like 'MQ1PJEB-040-3%'
       or cod_activo_fijo like 'MQ1PJEB-041-4%'
       or cod_activo_fijo like 'MQ1PJEB-042-5%'
       or cod_activo_fijo like 'MQ1PJEB-050-6%'
       or cod_activo_fijo like 'MQ1PJEB-051-7%'
       or cod_activo_fijo like 'MQ1PJEB-052-8%')
       and length(cod_activo_fijo) > 13;
begin
  for r in cr_activos loop
    insert into pr_tabmaq ( codigo, descripcion, fecha_fabricacion, numero_serie, id_tipo, estado
                          , centro_costo, id_seccion, id_modelo, id_marca, local
                          , fecha_adquisicion, id_pais, consumo_energia, consumo_energia_unidad
                          , capacidad, alto, largo, ancho, peso, num_importa, linea_maquina
                          , abreviatura, cod_padre, id_seccion_prod, id_prioridad, observaciones)
    values ( r.cod_activo_fijo, r.descripcion, date '2024-05-21', null, null, null
           , '9002', 'C1', null, null, 'SEP', date '2024-05-21', null, null, 'kW', null, null, null
           , null, null, null, null, r.abreviatura, null, '01', 'S', null);
  end loop;
end;

select *
  from pr_tabmaq
 where codigo = 'MQ1PJEB-038-1A';