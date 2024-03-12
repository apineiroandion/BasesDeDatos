/*
procedemento chamado pfarmaciascidades que liste os nomes de todasa as farmacias e o nome da cidade onde se atopan
*/

create or replace procedure pfarmaciascidades () 
language plpgsql as $$

declare 
c record;
r varchar = '';
k record;
begin   
    for c in select * from farmacias loop
        r=r||c.nomf;
        for k in select * from  cidades where codc = c.codc loop
            r=r||' '||k.nomc||E'\n';
        end loop;
    end loop;
    raise notice '%',r;
end;$$
