/*
procedemento pcidadefarmacias tal que pasandolle como parametro o código dunha cidade me diga os nomes das farmacias que se atopan nela 
*/

create or replace procedure pcidadefarmacias (codigo integer) 
language plpgsql as $$

declare 
c record;
r varchar = '';
begin   
    for c in select * from  farmacias where codc = codigo loop
        r=r||c.nomf||E'\n';
    end loop;
    raise notice '%',r;
end;$$
