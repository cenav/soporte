insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado, mm)
values
  ('CM', 'cm', 1, 0.01, 1E-5, 0.3937, 0.032, '1', 10);
insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado, mm)
values
  ('M', 'm', 100, 1, 0.001, 39.37, 3.28, '1', 1000);
insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado)
values
  ('KM', 'km', 100000, 100, 1, 3.937E-6, 3280.839, '0');
insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado, mm)
values
  ('PULG', 'in', 2.54, 0.0254, 2.54E-5, 1, 0.08333, '1', 25.4);
insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado, mm)
values
  ('PIE', 'ft', 30.48, 0.3048, 0.0003048, 12, 1, '1', 304.8);
insert into pim_longitud
  (medida, abrev, cm, m, km, pulg, pie, estado, mm)
values
  ('MM', 'mm', 0.1, 0.001, 1E-6, 0.03937, 0.00328084, '1', 1);
commit;
