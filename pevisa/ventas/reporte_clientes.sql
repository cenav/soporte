create or replace view vw_cliente as
select c.cod_cliente, c.nombre, c.ruc, c.fecha_ing, c.limite_cred, c.cred_usado, c.pais
     , z.descripcion as nom_pais, c.cod_ubc, u.nom_dpt, u.nom_pvc, u.nom_dtt, c.email, c.telefono
     , c.direccion, c.zona, z.descripcion as nom_zona, c.prinom, c.segnom, c.apepat, c.apemat
     , c.dociden, o.fch_inicio_empresa, o.id_medio_ecc, m.dsc_medio_ecc, c.grupo, s.observaciones
  from clientes c
       left join clientes_otros o on c.cod_cliente = o.cod_cliente
       left join cliente_observacion s on c.cod_cliente = s.cod_cliente
       left join ubigeo u on c.cod_ubc = u.cod_ubc
       left join tablas_auxiliares p on c.pais = p.codigo and p.tipo = 25
       left join tablas_auxiliares z on c.zona = z.codigo and z.tipo = 20
       left join medio_ecc m on o.id_medio_ecc = m.id_medio_ecc;

select cod_cliente, nombre, ruc, fecha_ing, limite_cred, cred_usado, pais, nom_pais, cod_ubc
     , nom_dpt, nom_pvc, nom_dtt, email, telefono, direccion, zona, nom_zona, prinom, segnom, apepat
     , apemat, dociden, fch_inicio_empresa, id_medio_ecc, dsc_medio_ecc, grupo, observaciones
  from vw_cliente;

select codigo, descripcion, indicador1 from tablas_auxiliares where tipo = 25 and codigo <> '....';

select codigo, descripcion from tablas_auxiliares where tipo = 20 and codigo != '....';