-- requerimineto_embalaje
select o.numero, o.fecha, o.estado, o.formu_art_cod_art as formula, d.art_cod_art as embalaje
     , d.cant_formula as cant_total
  from pr_ot o
       left join pr_ot_det d
                 on o.numero = d.ot_numero
                   and o.nuot_serie = d.ot_nuot_serie
                   and o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
                   and d.cod_lin = '801'
 where o.nuot_tipoot_codigo = 'AR'
   and o.numero in (
                    1043255, 1043780, 1044280, 1044545, 1043104, 1039192, 1034391, 1044178, 1045698,
                    1047246, 1047388, 1046170, 1045972, 1045335, 1047031, 1047603, 1045437, 1046798,
                    1045193, 1041226, 1045077, 1045438, 1047729, 1045202, 1047575, 1045864, 1046735,
                    1045429, 1047151, 1047742, 1048596, 1048651, 1048680, 1048073, 1047807, 1047640,
                    1045977, 1047690, 1047618, 1045708, 1046741, 1046505, 1047309, 1045892, 1046789,
                    1038265, 1048002, 1048086, 1045931, 1047808, 1048108, 1048597, 1045483, 1045654,
                    1046766, 1046693, 1046369, 1048580, 1045113, 1044911, 1048113, 1047898, 1047255,
                    1045091, 1043113, 1044045, 1048339, 1047730, 1046941, 1047570, 1048035, 1047572,
                    1046686, 1048287, 1047902, 1048690, 1046998, 1048117, 1046329, 1046809, 1044897,
                    1046057, 1044968, 1048765, 1046394, 1048299, 1047101, 1044904, 1045374, 1047333,
                    1044954, 1047311, 1048110, 1047981, 1045618, 1045794, 1047023, 1047907, 1046143,
                    1046729, 1044960, 1046046, 1047977, 1046937, 1048000, 1047321, 1045619, 1045615,
                    1046407, 1046365, 1047787, 1043149, 1048688, 1045898, 1045817, 1045242, 1047953,
                    1048462, 1047795, 1046236, 1045021, 1044995, 1046711, 1046994, 1045572, 1046105,
                    1045949, 1046816, 1047879, 1045031, 1045404, 1047224, 1046845, 1044046, 1047656,
                    1048118, 1048103, 1048070, 1046543, 1048320, 1046902, 1048223, 1048393, 1047918,
                    1047758, 1044933, 1048315, 1048225, 1048148, 1048161, 1048141, 1048144, 1048155,
                    1047755, 1048222, 1046338, 1048150, 1048153, 1045007, 1048163, 1045023, 1048291,
                    1046466, 1046637, 1048142, 1046347, 1048394, 1046818, 1048162, 1047144, 1046411,
                    1045034, 1047330, 1046412, 1046469, 1048298, 1045037, 1047865, 1046396, 1045018,
                    1047624, 1047983, 1048056, 1047968, 1048294, 1046345, 1044992, 1048054, 1048145,
                    1048151, 1048414, 1048215, 1048410, 1048143, 1044931, 1048210, 1044938, 1047844,
                    1047710, 1040548, 1048679, 1038144, 1046869, 1046946, 1044092, 1048723, 1048924,
                    1045832, 1046137, 1045712, 1038401, 1046781, 1046706, 1046291, 1046639, 1046751,
                    1047262, 1046656, 1044967, 1046791, 1046801, 1046128, 1044565, 1046688, 1045958,
                    1048579, 1047051, 1045173, 1047319, 1048471, 1047443, 1047683, 1045831, 1046519,
                    1047291, 1046146, 1046094, 1044824, 1048590, 1045072, 1048259, 1048361, 1048593,
                    1044213, 1047809, 1045903, 1048003, 1045900, 1048697, 1045420, 1047100, 1048734,
                    1045482, 1047223, 1044823, 1045806, 1048305, 1045409, 1047630, 1047829, 1044551,
                    1048036, 1045274, 1048364, 1047946, 1047789, 1046141, 1044884, 1045599, 1047085,
                    1044865, 1048091, 1048345, 1044587, 1047545, 1046278, 1046216, 1044543, 1046969,
                    1048469, 1048122, 1044786, 1047803, 1048248, 1048168, 1048343, 1048311, 1048166,
                    1046915, 1045939, 1047535, 1046282, 1048188, 1047971, 1047431, 1046280, 1047292,
                    1046920, 1046849, 1048337, 1048571, 1046101, 1047109, 1045758, 1048258, 1048169,
                    1048344, 1045568, 1048053, 1048346, 1045617, 1047529, 1046804, 1046220, 1048444,
                    1048445, 1045991, 1045833, 1046853, 1045941, 1047986, 1046963, 1048193, 1047469,
                    1046964, 1048185, 1048190, 1048195, 1047337, 1045899, 1047623, 1046918, 1048179,
                    1044998, 1045940, 1047863, 1046121, 1047814, 1048796, 1048460, 1045220, 1045340,
                    1045942, 1046936, 1045762, 1048160, 1047462, 1048081, 1046928, 1047332, 1048058,
                    1048338, 1043866, 1048335, 1046916, 1038275, 1048191, 1048283, 1046255, 1047552,
                    1047749, 1047776, 1048196, 1048165, 1048052, 1046961, 1048157, 1048206, 1048184,
                    1048186, 1045826, 1046250, 1047117, 1046912, 1048176, 1048284, 1044811, 1048174,
                    1046238, 1046135, 1048008, 1047446, 1048187, 1048306, 1048363, 1046120, 1048428,
                    1048458, 1048285, 1045629, 1048181, 1048353, 1048182, 1048354, 1047922, 1046202,
                    1048470, 1048189, 1048357, 1048251, 1048336, 1047513, 1048427, 1048175, 1048349,
                    1048082, 1046899, 1047869, 1048953, 1048990, 1046344, 1048297, 1047779, 1047142,
                    1047810, 1047451, 1048406, 1044816, 1046917, 1048332, 1044806, 1048046, 1047978,
                    1044994, 1048244, 1048252, 1047121, 1048383, 1048170, 1048205, 1048180, 1048352,
                    1046333, 1044936, 1046827, 1048177, 1048066, 1044932, 1046465, 1048350, 1048355,
                    1048348, 1048159, 1048237, 1046359, 1044990, 1048178, 1046237, 1047465, 1048172,
                    1046472, 1048391, 1048396, 1044935, 1047468, 1048426, 1048397, 1047082, 1045627,
                    1048331, 1045013, 1048334, 1047648, 1044923, 1040592, 1040521, 1046020, 1038861,
                    1044320, 1034387, 1049724, 1038499, 1044333, 1045174, 1048995, 1049778, 1041214,
                    1038814, 1048920, 1043348, 1048997, 1049785, 1046148, 1043747, 1046150, 1048421,
                    1045117, 1048685, 1042977, 1048001, 1038954, 1047112, 1043385, 1042678, 1049738,
                    1046806, 1048097, 1045351, 1047123, 1049739, 1049849, 1049729, 1034222, 1045005,
                    1046846, 1048917, 1046487, 1045071, 1044220, 1048628, 1047601, 1048939, 1038307,
                    1038296, 1043046, 1047588, 1046743, 1046054, 1043653, 1043800, 1043772, 1043303,
                    1043305, 1040288, 1039061, 1046362, 1047096, 1034408, 1047867, 1045721, 1049803,
                    1043732, 1049943, 1040519, 1045168, 1047358, 1040465, 1049901, 1038655, 1040719,
                    1049774, 1049958, 1048745, 1048754, 1043505, 1038741, 1048769, 1049961, 1045206,
                    1046755, 1050018, 1038502, 1043052, 1045508, 1046826, 1050005, 1040293, 1049790,
                    1049978, 1048308, 1050003, 1038650, 1043236, 1049903, 1040273, 1046911, 1047864,
                    1050001, 1050002, 1049984, 1048981, 1048326, 1040520, 1044239, 1038712, 1038864,
                    1049955, 1049869, 1048918, 1043863, 1046484, 1050074, 1041141, 1048631, 1048962,
                    1049967, 1043980, 1046285, 1045076, 1046750, 1040811, 1040289, 1046444, 1038391,
                    1050075, 1049777, 1048627, 1043400, 1045462, 1043975, 1040607, 1049746, 1045764,
                    1049996, 1046959, 1040704, 1044041, 1041283, 1048084, 1038621, 1044050, 1044370,
                    1038514, 1047526, 1045153, 1047541, 1043394, 1040460, 1038604, 1041219, 1043903,
                    1046190, 1045738, 1045250, 1046618, 1047540, 1041136, 1038659, 1040298, 1038559,
                    1046178, 1038563, 1040382, 1047753, 1043315, 1038141, 1044336, 1048594, 1038756,
                    1048927, 1040600, 1043384, 1049987, 1042291, 1041213, 1044094, 1040710, 1044221,
                    1043195, 1044590, 1048682, 1040609, 1049749, 1043861, 1043618, 1043436, 1049723,
                    1047786, 1048649, 1043939, 1043771, 1039692, 1040186, 1040591, 1050150, 1043905,
                    1045843, 1040698, 1040391, 1045316, 1040462, 1042294, 1045273, 1043652, 1040188,
                    1044164, 1043586, 1046400, 1039058, 1043346, 1043309, 1046399, 1043516, 1045022,
                    1043710, 1046106, 1046470
   );

-- detalle surtimiento orden de armado
  with detalle as (
    select j.id_pedido, j.nombre_cliente, j.numero_de_ordenes, o.numero, o.formu_art_cod_art
         , o.fecha, o.cant_prog, d.art_cod_art, d.cant_formula, nvl(a.stock, 0) as stock
      from view_ordenes_jaba_completa j
         , pr_ot o
         , pr_ot_det d
         , almacen a
     where j.id_pedido = o.abre01
       and o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
       and o.nuot_serie = d.ot_nuot_serie
       and o.numero = d.ot_numero
       and o.nuot_tipoot_codigo = 'AR'
       and d.art_cod_art = a.cod_art(+)
       and a.cod_alm(+) = '06'
       and o.estado = 3
       and (
             select count(*)
               from pr_ot_det d
              where numero = d.ot_numero
                and nuot_serie = d.ot_nuot_serie
                and nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
                and d.estado < 9
                and d.cod_lin between '800' and '899'
                and d.cod_lin not in
                    ('840', '855', '856', '860', '861', '862', '863', '864', '865', '870', '871',
                     '880',
                     '890')
                and length(d.cod_lin) = 3
              group by d.ot_numero
             ) > 0
       and d.cod_lin between '800' and '899'
       and d.cod_lin not in
           ('840', '852', '860', '861', '862', '863', '864', '865', '870', '871', '880', '890')
       and length(d.cod_lin) = 3 and d.estado < 9
    )
select d.art_cod_art as codigo, sum(d.cant_formula) as cantidad, d.stock
     , sum(d.cant_formula) - d.stock as faltante
  from detalle d
having sum(d.cant_formula) > d.stock
 group by d.art_cod_art, d.stock;
