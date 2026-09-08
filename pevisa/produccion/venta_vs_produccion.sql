select *
  from (
    select id_grupo, dsc_grupo, to_char(fch_transac, 'MM') as mes, cantidad
      from pr_detalle_fechas
     where usuario = 'PEVISA'
       and fch_transac between
       to_date('01/01/2022', 'DD/MM/YYYY')
       and to_date('31/12/2022', 'DD/MM/YYYY')
    )
    pivot (
    sum(cantidad)
    for mes in (
      '01' as enero,
      '02' as febrero,
      '03' as marzo,
      '04' as abril,
      '05' as mayo,
      '06' as junio,
      '08' as agosto,
      '09' as setiembre,
      '10' as octubre,
      '11' as noviembre,
      '12' as diciembre
      )
    )
 order by id_grupo;


select *
  from prod_grupo
 where programa_produccion = 'SI'
