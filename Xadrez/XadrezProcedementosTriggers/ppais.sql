/*

1)procedemento ppais
tal que dado o nome dun pais 
1	amosar o nome dos participantes de dito pais 
0,5	asi como o numero total dos mesmos.
0,5	se un pais non ten participantes debe amosarse a mensaxe 'pais sen participantes rexistrados'
0,25	se un pais non existe debe amosarse a mensaxe 'pais inexistente'



call ppais('holanda');
ainara
isabel
felipe
manuel
amelia
total:5

 execute ppais('italia');
pais sen participante rexistrados

 execute ppais('belxica');
pais inexistente
*/

create or replace procedure ppais (nomePais varchar) 
language plpgsql as $$

declare 
numeroPais integer;
contador integer;
r varchar = '';
c record;
begin   

    select np into STRICT numeroPais from pais where nome = nomePais;
    contador = 0;
    for c in select * from participante where np = numeroPais loop
        contador = contador + 1;
        r=r||c.nomp||E'\n';
    end loop;
    
    if contador = 0 then
        r=r||'pais sen participantes rexistrados';
    else
        r=r||'total: '||contador;
    end if;
    
    raise notice '%',r;
    
exception

    when no_data_found then
    raise exception 'pais inexistente';

end;$$

