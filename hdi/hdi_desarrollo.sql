select *
  from nrolibr
 where ano = 2023
   and mes = 6;

select * from pla_control;

insert into pevisa.pla_control ( c_empleador, cia, direccion, numero_dir, localidad, c_ubigeo
                               , telefono, cod_rep, c_cobertura, c_cliente, c_banco, tipo_cta
                               , sucursal, num_cta, moneda, monto, suma_cta, uit, smv, c_quinta
                               , lib_pla, lib_hon)
values ( '20610114041', 'HDI SAC', '-- RENE DESCARTES NRO. 146 URB. SANTA RAQUEL - LIMA LIMA ATE'
       , '311', 'LIMA', '000', '6127900', 'E017', '390', '000390', '02', null, '191', '00676860068'
       , 'S', null, null, 24850.00, 550.00, '3005', '15', '14');

select *
  from pevisa.movglos
 where ano = 2023
   and mes = 4
   and libro = '08';