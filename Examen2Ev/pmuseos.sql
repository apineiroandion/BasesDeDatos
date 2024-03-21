/*
pmuseos
*/

create or replace procedure pmuseos (nome varchar) 
language plpgsql as $$

declare 

c record;
r varchar = '';
contador integer;
nombreVisitante varchar = '';

begin   
    contador = 0;
    for c in select * from visitan where codmu in(select codmu from museos where nommu = nome) loop
    select nomv into nombreVisitante from visitantes where codpa = c.codpa and n = c.n;
    contador = contador + 1;
    r=r||c.datavi||','||nombreVisitante||E'\n';
    end loop;
    if contador = 0 then
        r=r||'museo sen visitantes';
    else
        r=r||'o numero de visitantes e: '||contador;
    end if;
    raise notice '%',r;
end;$$
