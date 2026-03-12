declare
  xcantidad number(16, 4);
  --RUTA DE ARCHIVOS
  carpeta_archivos
            varchar2(100) := 'X:\Archivos\';


  procedure valida_proceso
    is
    v_valida number;
  begin

    select count(*)
      into v_valida
      from pevisa.pr_parte_produccion
     where ot_tipo = :pr_ot.nuot_tipoot_codigo
       and ot_serie = :pr_ot.nuot_serie
       and estado = 1
       and numero_op = :pr_ot.numero;

    if
      v_valida > 0 then
      mal('La Orden que quiere cerrar tiene ' || v_valida ||
          ' procesos sin completar, Revisar Procesos');
    end if;

  end;

  procedure valida_herramental
    is
    v_valida number;
  begin

    select count(*)
      into v_valida
      from pevisa.pcherramental
     where cod_for = :pr_ot.formula;


    if
      v_valida = 0 then
      mal('La Pieza ' || :PR_OT.formula ||
          ' No tiene ningun herramental enlazado, Se necesita al menos un herramental para poder Cerrar!');
    end if;

  end;


begin

  --VALIDA SI TIENE  ALGUN PROCESO DE PRODUCCION ABIERTO.
  valida_proceso
  ();

  --VALIDA SI TIENE AL MENOS UN HERRAMENTAL ENLAZADO A LA PIEZA
--	valida_herramental();


  if
    (:PR_OT.estado < 8)
  then
    :PR_OT.cant_merma := :PR_OT_CIERRES.x_sum_total_merma;

    xcantidad
      := (:PR_OT.cant_merma + :PR_OT.cant_ingresado);

    if
      xcantidad <> :PR_OT.cant_resul then

      mensaje('Cantidad Habilitado no es igual a suma de ingresado + merma');
    end if;


    if
      xcantidad = :PR_OT.cant_resul
    then
      --VALIDACION SI EXISTE EL ARCHIVO
      if f_archivo_existe_all(:PR_OT.numero) = 0
      then
        mensaje('Documento no tiene PDF;  primero debe generar el PDF');
      else
        :PR_OT.saldo := 0;
        cierra_orden;
        mensaje
        ('Proceso finalizado !!!!');
      end if;
    end if;
  end if;


end;