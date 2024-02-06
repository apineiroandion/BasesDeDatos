/*
crear procedemento plistaequxogp que liste nome e codigo dos esquipos, e para cada un de eles os codigo, nome e salario dos seus xogadores*/

create or replace procedure plistaequxogp () 
language plpgsql as $$

declare 
r varchar='';
c record;
i record;
v int=0;
d varchar='';
begin
    for c in select codequ,nomequ from equipo order by codequ loop
        r=r || ' equipo: '|| c.codequ|| ', nome: '||c.nomequ ||E'\n';
        v=0;
         for i in select * from xogador where codequ=c.codequ loop
             v=1;
          if i.salario is not null then 
             r=r ||E'\t'|| ' xogador: '|| i.codx|| ', nome: '||i.nomx ||' ,salario: '||i.salario||E'\n';
             else
             r=r ||E'\t'|| ' xogador: '|| i.codx|| ', nome: '||i.nomx ||' ,salario: es nulo'||E'\n';
             end if;
        end loop;
        if v=0 then
        r=r||E'\t'||' equipo sen xogadores'||E'\n';
            end if;
        --meto la d para concatenar un salto de pagina despues del NOTICE:
        d=d ||E'\n'||r;
        raise notice '%',d;
        
    end loop;
    raise notice '%',r;
end;$$
