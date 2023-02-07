declare
    c_estado constant varchar2(1) := '8';

    cursor cr_ordenes is
        select *
          from orden_de_compra
         where serie = 1
           and num_ped in (
                           81327, 80996
             );
begin
    for r in cr_ordenes loop
        update orden_de_compra
           set estado = c_estado
         where serie = r.serie
           and num_ped = r.num_ped;

        update itemord
           set estado = c_estado
             , saldo  = 0
         where serie = r.serie
           and num_ped = r.num_ped;
    end loop;

    commit;
end;
