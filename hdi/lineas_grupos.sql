-- Hola en la tabla lpred_fam hay que poner lista de precios  indicar a que grupo y línea y que descuento va a tener al momento de cotizar
-- Luego hay que enviar un correo a contabilidad para que ponga la cuenta contable que corresponde a esa línea ese dato se graba en la tabla tfamlin esto sirve al momento que uno genera el registro de venta y se graba en el itemdocu

select *
  from lpred_fam;

select distinct nro_lista
  from lpred_fam;

select *
  from lpred_fam
 where cod_lin = 'D530';

select *
  from lpred_fam
 where cod_grupo = '154';

select *
  from lpred_fam
 where cod_lin in (
                   'D281', 'D341', 'D371', 'D451', 'F402'
   );

select *
  from lpred_fam
 where cod_lin like 'D4%'
   and length(cod_lin) = 4;

select *
  from lpred_fam
 where cod_lin = 'D257';

select *
  from tab_lineas
 where grupo = 111;