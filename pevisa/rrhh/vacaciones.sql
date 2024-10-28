select *
  from vacaciones
 where id_personal = 'E402';

select *
  from vacaciones
 where id_personal = 'E402'
   and ((:p_desde between desde and hasta) or
        (:p_hasta between desde and hasta))
 order by fecha desc;

select *
  from vacaciones
 where numero in (19543, 19319, 19559);

select * from estado_vacaciones order by id_estado;