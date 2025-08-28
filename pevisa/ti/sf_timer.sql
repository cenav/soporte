create or replace package sf_timer
/*
   Elapsed Time Calculator Utility

   Author: Steven Feuerstein, steven@stevenfeuerstein.com

   Enhanced to use SYSTIMESTAMP by Elic.
*/
is
  subtype t_elapsed_time is varchar2(32767);

  procedure start_timer;

  function elapsed_time(
    p_message_in in varchar2 := null
  ) return t_elapsed_time;

  procedure show_elapsed_time(
    p_message_in in varchar2 := null
  );

end sf_timer;
/

create or replace package body sf_timer
is
  g_last_timing timestamp := null;

  procedure start_timer is
  begin
    g_last_timing := systimestamp;
  end;

  function elapsed_time(
    p_message_in in varchar2 := null
  ) return t_elapsed_time is
    l_current_time timestamp := systimestamp;
    l_elapsed_time t_elapsed_time;
  begin
    l_elapsed_time :=
        case
          when p_message_in is null then 'Completed in:'
          else '"' || p_message_in || '" completed in: '
        end
          || regexp_substr(l_current_time - g_last_timing, '([1-9][0-9:]*|0)\.\d{3}') || ' seconds';

    /* Reset timer */
    start_timer;
    return l_elapsed_time;
  end;

  procedure show_elapsed_time(
    p_message_in in varchar2 := null
  ) is
  begin
    dbms_output.put_line(elapsed_time(p_message_in));
  end;

/*
Explanation of regular expression provided by Vitaliy Lyanchevskiy (Elic):

This RE (I extended it a bit for generality) is intended
to remove insignificant digits (and punctuations) from
both the left (a sign, zeroes and separators) and the right:

( match non zero digit followed by any number of digits or separators
    (colon between time parts or space after days)
  or
  match just the zero (if interval is less than a second, because I dislike
    numbers starting with a point :) )
) followed by decimal point and exactly 3 digits.

As result we have string representation of an interval in compact form.
I ignore a sign since we know that our intervals could not be negative.

And I use only 3 digits after decimal point since on Windows, where I do
most of testing, it is highest possible precision.


SQL> col i for a30
SQL> select i, lpad(regexp_substr(i, '([1-9][0-9: ]*|0)\.\d{3}'), 20) as ii
  2    from
  3    ( select interval '12345' second * power(9, level - 7) as i
  4        from dual
  5        connect by level <= 10
  6    );

I                              II
------------------------------ --------------------
+000000000 00:00:00.023229295                 0.023
+000000000 00:00:00.209063659                 0.209
+000000000 00:00:01.881572931                 1.881
+000000000 00:00:16.934156379                16.934
+000000000 00:02:32.407407407              2:32.407
+000000000 00:22:51.666666667             22:51.666
+000000000 03:25:45.000000000           3:25:45.000
+000000001 06:51:45.000000000        1 06:51:45.000
+000000011 13:45:45.000000000       11 13:45:45.000
+000000104 03:51:45.000000000      104 03:51:45.000
*/
end sf_timer;
/
