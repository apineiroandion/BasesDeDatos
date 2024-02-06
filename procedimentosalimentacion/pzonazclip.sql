/*
procedimento pzonasclip que liste o codigo e nome de todas as zonas e para cada unha de elas o nif nome e telefono dos clientes que viven nelas
*/

create or replace procedure pzonasclip () 
language plpgsql as $$

declare 

i record;
c record;
r varchar='';
contador int;
contadorTotal int;
begin
contadorTotal=0;
for i in select codz, nomz from zona loop
contador=0;

    r=r||'codigo: '||i.codz||' zona: '||i.nomz||E'\n';
    for c in select nif, nome from cliente where cliente.codz=i.codz loop
        contador=contador+1;
        contadorTotal=contadorTotal+1;
        r=r||E'\t'||'nif: '||c.nif||' nome: '||c.nome||E'\n';
    end loop;
        if contador=0 then
        r=r||E'\t'||'nzona sen clientes '||E'\n';
        else
        r=r||E'\t'||'numero de clientes: '||contador||E'\n';
        end if;
end loop;
    r=r||E'\n'||'numero TOTAL de clientes: '||contadorTotal||E'\n';

    raise notice '%',r;

end;$$
