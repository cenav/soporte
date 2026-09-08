create package reporte_almacen_observados as

  procedure genera_excel;

  procedure envia_correo;

  procedure listado;

end reporte_almacen_observados;


create or replace package body reporte_almacen_observados as
  c_directory constant varchar2(32767) := 'ARCHIVO_PAGOS_DIR';
  c_filename constant varchar2(32767) := 'reporte_almacen_observados.xlsx';

  function html_excel return clob is
  begin
    return q'[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
            "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="viewport" content="width=device-width"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Pevisa Auto Parts</title>
        <style type="text/css">
            body {
                margin: 0;
                padding: 0;
                min-width: 100%;
                font-family: sans-serif;
                background-color: #FFFFFF;
            }

            table {
                margin: 0 0 10px 0;
                padding: 0;
                width: 100%;
            }

            div {
                margin: 0;
                padding: 0;
            }

            .header {
                height: 20px;
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                color: #808080;
                text-decoration: underline;
            }

            .content {
                height: 10px;
                font-size: 16px;
                line-height: 30px;
            }

            .footer {
                height: 40px;
                text-align: center;
                font-size: 12px;
                color: #999999;
            }

            .footer a {
                color: #000000;
                text-decoration: none;
                font-style: normal;
            }

            .logo {
                text-align: center;
                font-style: italic;
                color: #999999;
            }

            .myTable {
                background-color: #eee;
                border-collapse: collapse;
                margin: 5px 0;
            }

            .myTable th {
                background-color: #004899;
                color: white;
            }

            .myTable td, .myTable th {
                padding: 5px;
                border: 1px solid #b3b3b3;
            }

            .etiqueta {
                font-weight: bold;
            }
        </style>
    </head>
    <body bgcolor="#FFFFFF">
    <div>
        <table bgcolor="#FFFFFF" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" style="padding: 0 80px;">
                    <div style="background-color: #eee;">
                        <img src="https://drive.google.com/uc?id=1MBaDH_v72vVoaI-o9Ghbk18foq9wTQpt"
                             alt="logo pevisa">
                    </div>
                </td>
            </tr>
            <tr class="header">
                <td style="padding: 1px 0 0 0;">
                    <h4>SEGUIMIENTO ALMACEN OBSERVADOS</h4>
                </td>
            </tr>
            <tr class="content">
                <td style="padding: 0 80px;">
                    <p>A la fecha: <strong><%= to_char(sysdate,
                        'dd/mm/yyyy')
                        %></strong></p>
                </td>
            </tr>
            <tr class="content">
                <td style="padding: 0 80px;">
                    <table class="myTable">
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                        <tr>
                            <th>CODIGOS MES ANTERIOR</th>
                            <th>CODIGOS ACTUALES</th>
                            <th>CODIGOS REGULARIZADOS</th>
                            <th>AVANCE %</th>
                        </tr>
                        <%
                        for r in (
                        with stock_cierre_ant as (
                        select d.cod_alm, d.cod_art
                        , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_ant
                        from kardex_d d
                        where d.estado <> '9'
                        and d.cod_alm = '48'
                        and trunc(d.fch_transac) <= last_day(add_months(trunc(sysdate), -1))
                        and d.cod_art not in (
                        '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                        '8.97066.196.0 MLS 1.60'
                        )
                        group by d.cod_alm, d.cod_art
                        having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
                        )
                        , stock_actual as (
                        select d.cod_alm, d.cod_art
                        , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_act
                        from kardex_d d
                        where d.estado <> '9'
                        and d.cod_alm = '48'
                        and trunc(d.fch_transac) <= trunc(sysdate)
                        and d.cod_art not in (
                        '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                        '8.97066.196.0 MLS 1.60'
                        )
                        group by d.cod_alm, d.cod_art
                        having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
                        )
                        select count(a.cod_art) as codigos_mes_anterior
                        , count(b.cod_art) as codigos_actuales
                        , case
                        when count(a.cod_art) = 0 then 0
                        when count(a.cod_art) - count(b.cod_art) < 0 then 0
                        else count(a.cod_art) - count(b.cod_art)
                        end as codigos_regularizados
                        , case
                        when count(a.cod_art) = 0 then 0
                        else round(
                        (
                        case
                        when count(a.cod_art) - count(b.cod_art) < 0 then 0
                        else count(a.cod_art) - count(b.cod_art)
                        end / count(a.cod_art)
                        ) * 100,
                        2
                        )
                        end as porcentaje_avance
                        from stock_cierre_ant a
                        full outer join stock_actual b
                        on b.cod_alm = a.cod_alm
                        and b.cod_art = a.cod_art
                        ) loop
                        %>
                        <tr>
                            <td class="etiqueta"><%= r.codigos_mes_anterior %></td>
                            <td><%= r.codigos_actuales %></td>
                            <td><%= r.codigos_regularizados %></td>
                            <td><%= r.porcentaje_avance %></td>
                        </tr>
                        <%
                        end loop;
                        %>
                    </table>
                </td>
            </tr>
            <tr class="footer">
                <td style="padding: 40px;">
                    <p>Usuario: ${usuario}</p>
                    Envio de Correo Automático<br>
                    Area de Sistemas
                </td>
            </tr>
        </table>
    </div>
    </body>
    </html>]';

  end;


  procedure genera_excel as
    sqlquery varchar2(32767);
    ctxid    excelgen.ctxhandle;
  begin

    ctxid := excelgen.createcontext();
    sqlquery :=
        q'[
        with stock_cierre_ant as (
          select d.cod_alm, d.cod_art
            , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_ant
          from kardex_d d
          where d.estado <> '9'
            and d.cod_alm = '48'
            and trunc(d.fch_transac) <= last_day(add_months(trunc(sysdate), -1))
            and d.cod_art not in (
            '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
            '8.97066.196.0 MLS 1.60'
            )
          group by d.cod_alm, d.cod_art
          having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
          )
          , stock_actual as (
          select d.cod_alm, d.cod_art
            , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_act
          from kardex_d d
          where d.estado <> '9'
            and d.cod_alm = '48'
            and trunc(d.fch_transac) <= trunc(sysdate)
            and d.cod_art not in (
            '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
            '8.97066.196.0 MLS 1.60'
            )
          group by d.cod_alm, d.cod_art
          having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
          )
        select nvl(a.cod_alm, b.cod_alm) as cod_alm, nvl(a.cod_art, b.cod_art) as cod_art
          , to_char(nvl(a.stock_ant, 0), '999999990.00') as stock_mes_anterior
          , to_char(nvl(b.stock_act, 0),'999999990.00') as stock_actual
          , case
          when a.cod_art is not null and b.cod_art is null
            then 'REGULARIZADO'
          when a.cod_art is not null and b.cod_art is not null
            then 'PENDIENTE'
          when a.cod_art is null and b.cod_art is not null
            then 'NUEVO OBSERVADO'
          end as estado_avance
        from stock_cierre_ant a
          full outer join stock_actual b
            on b.cod_alm = a.cod_alm
              and b.cod_art = a.cod_art
        order by estado_avance, cod_art
        ]';

    excelgen.addsheetfromquery(ctxid, 'REPORTE_ALMACEN_OBSERVADOS', sqlquery);
    excelgen.setheader(ctxid, 'REPORTE_ALMACEN_OBSERVADOS', p_autofilter => true);
    excelgen.settableformat(ctxid, 'REPORTE_ALMACEN_OBSERVADOS', 'TableStyleLight9');

    excelgen.createfile(ctxid, c_directory, c_filename);
    excelgen.closecontext(ctxid);
  end;


  procedure envia_correo as
    l_html         clob;
    l_vars         teplsql.t_assoc_array;
    l_fecha        date := trunc(sysdate);
    l_blob         blob;
    l_destinatario varchar2(400);
    l_copia        varchar2(400);
  begin

    l_html := html_excel();
    l_vars('fecha') := l_fecha;
    l_html := teplsql.render(l_vars, l_html);

    genera_excel; --> para el adjunto
    l_blob := mail.load_blob(c_directory, c_filename);

    ----seleccionar destinatario---
    l_destinatario := 'cnavarro@pevisa.com.pe';

    --para pruebas
    --l_destinatario := 'NICK.YABAR@PEVISA.COM.PE';


    mail.send_html_attach(
        p_to => l_destinatario
      , p_from => 'avisos_sistemas@pevisa.com.pe'
      , p_subject => 'Reporte almacen observados' || l_fecha
      , p_html_msg => l_html
      , p_attach_name => c_filename
      , p_attach_mime => 'application/vnd.ms-excel'
      , p_attach_blob => l_blob
    );
  end;

  procedure listado as
  begin
    envia_correo;
  end;
end;
/

