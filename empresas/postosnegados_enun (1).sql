
/*
procedemento postosnegados  que dado o dni dunha persoa devolte a lista dos postos de traballo para os que non  poderia  ser entrevistada debido a que algunhas empresas rexeitan a dita persoa.
call postosnegados('36202020');
p2
p9
p13
p8
p14
p15
p16
p17
esta persoa e rexeitada para un total de 8 postos

execute postosnegados('36222222');
esta persoa e entrevistable para calquera posto de calqueira empresa
*/

create or replace procedure postosnegados (input varchar) 
language plpgsql as $$

declare 
c record;
k record;
r varchar='';
contador integer;
codigo integer;
posto record;
begin
select num_persoa into codigo from persoas where dni=input;
contador=0;
for c in select * from rexeita where num_persoa=codigo loop

    for k in select * from postos where cod_empresa=c.cod_empresa loop
    r=r||k.cod_posto||E'\n';
    contador=contador+1;
    end loop;

end loop;
    if contador=0 then
        r=r||'esta persoa e entrevistable para calquera posto de calqueira empresa'||E'\n';
    else
        r=r||'esta persoa e rexeitada para un total de '||contador||' postos'||E'\n';
    end if;
    raise notice '%',r;

end;$$






