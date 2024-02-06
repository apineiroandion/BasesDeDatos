/*
crear procedemento plistaestparp que liste nome e codigo dos estadios, e para cada un de eles os codigo, nome dos seus partidos*/

create or replace procedure plistaestparp () 
language plpgsql as $$

declare 
r varchar='';
c record;
i record;
v int;
w int;
d varchar='';
begin
    w=0;
    for c in select codest,nomest from estadio loop
        r=r || ' equipo: '|| c.codest|| ', nome: '||c.nomest ||E'\n';
        v=0;
         for i in select * from partido where codest=c.codest loop
             v=v+1;
             w=w+1;    
             r=r ||E'\t'|| ' codigo Partido: '|| i.codpar|| ', nome: '||i.nompar ||' ,data: '||i.data||E'\n';
        end loop;

        if v=0 then
        r=r||E'\t'||' estadio sen partidos'||E'\n';
            end if;
        --meto la d para concatenar un salto de pagina despues del NOTICE:
        d=d ||E'\n'||r;
        r=r||'El numero de partidos en este estadio es: '||v||E'\n';
    end loop;
    raise notice '%',r;
    raise notice 'El numero total de partidos es:%',w;
end;$$
