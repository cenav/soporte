select *
  from expedidos
 where numero = 17165;


select *
  from expedido_d
 where numero = 17165
   and nro in (193);


select *
  from expedido_d
 where numero = 17165
order by nro desc;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and abre01 = '17165'
   and per_env = '193';

-- orden por 35 que si debe ir
select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1184929;


