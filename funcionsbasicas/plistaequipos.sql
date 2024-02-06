/*
crear procedemento plistaequiposp que liste nome e codigo dos esquipos*/

create or replace procedure plistaequiposp () 
language plpgsql as $$

declare 
r varchar='';
c record;
begin
    for c in select codequ,nomequ from equipo loop
        r=r || ' equipo: '|| c.codequ|| ', nome: '||c.nomequ ||E'\n';
    end loop;
    raise notice '%',r;
end;$$
