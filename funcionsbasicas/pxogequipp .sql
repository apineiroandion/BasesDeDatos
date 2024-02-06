/*
crear procedemento pxogequip que liste codigo, nome e salario dos xogadores do equipo que coxo cdoigo se pasa por parametro
*/

create or replace procedure pxogequipp (vcodequ varchar) 
language plpgsql as $$

declare 
r varchar='';
d varchar='';
c record;
v int=0;
vnomequ varchar;
begin
    select nomequ into STRICT vnomequ from equipo where codequ=vcodequ;
    raise notice 'equipo: %',vnomequ;
    for c in select * from xogador where codequ=vcodequ loop
    v=1;
        if c.salario is not null then 
        r=r || ' xogador: '|| c.codx|| ', nome: '||c.nomx ||' ,salario: '||c.salario||E'\n';
        else
        r=r || ' xogador: '|| c.codx|| ', nome: '||c.nomx ||' ,salario: es nulo'||E'\n';
        end if;
    end loop;
    if v=0 then
    r=' equipo sen xogadores';
    end if;
    --meto la d para concatenar un salto de pagina despues del NOTICE:
    d=d ||E'\n'||r;
    raise notice '%',d;
exception
when no_data_found then
raise notice 'EQUIPO INEXISTENTE';
end;$$
