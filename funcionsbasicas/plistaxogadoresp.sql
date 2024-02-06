/*
crear procedemento plistaxogadoresp que liste codigo, nome e salario dos xogadores
*/

create or replace procedure plistaxogadoresp () 
language plpgsql as $$

declare 
r varchar='';
d varchar='';
c record;
begin
    for c in select codx,nomx,salario from xogador loop
        if c.salario is not null then 
        r=r || ' xogador: '|| c.codx|| ', nome: '||c.nomx ||' ,salario: '||c.salario||E'\n';
        else
        r=r || ' xogador: '|| c.codx|| ', nome: '||c.nomx ||' ,salario: es nulo'||E'\n';
        end if;
    end loop;
    --meto la d para concatenar un salto de pagina despues del NOTICE:
    d=d ||E'\n'||r;
    raise notice '%',d;
end;$$
