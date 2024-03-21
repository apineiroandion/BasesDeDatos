/*
pdescubridores
*/

create or replace procedure pdescubridores () 
language plpgsql as $$

declare 

c record;
r varchar = '';
k record;
contador integer;

begin   
    
    for c in select * from descubridores loop
        r=r||c.nomd||','||c.especialidade||E'\n';
        contador = 0;
        for k in select * from achados where codd = c.codd loop
            contador = contador + 1;
            r=r||E'\t'||k.noma||','||k.datacion||E'\n';
        end loop;
        if contador = 0 then 
            r=r||E'\t'||'descubridor sen achados'||E'\n';
        else
            r=r||E'\t'||'o numero de achados de este descubridor e: '||contador||E'\n';
        end if;
    end loop;
    
    raise notice '%',r;
end;$$
