/*
procedimento pprodutosmarcap que dado NOME dunha marca liste o nome e o prezo dos productos lacteos de dita marca
    -tamen cantos ten
    -sen lacteos
    -inexistente
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
select codz, nomz from zona where codz=input;
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

    r=r||E'\n'||'numero TOTAL de clientes: '||contadorTotal||E'\n';

    raise notice '%',r;

end;$$
