/*
procedemento chamado pfarmacias que liste os nomes de todas as farmacias
*/

create or replace procedure pfarmacias () 
language plpgsql as $$

declare 
c record;
r varchar = '';
begin   
    for c in select * from farmacias loop
        r=r||c.nomf||E'\n';
    end loop;
    raise notice '%',r;
end;$$
