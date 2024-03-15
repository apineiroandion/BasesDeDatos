
/*
parea
procedemento que liste os codigos de todas as areas e para cada codigo de area os nomes dos asegurados de dita area xunto co numero total deles.
Se un area non ten asegurados debe imprimirse a mensaxe: area sen asegurados:

puntuacion:
amosar codigos de area: .5
amosar nomes de asegurados: 1
amosar numero total de asegurados: .25
amosar 'area sen asegurados' : .25 



call parea();

codigo de area: a1
luis
ana
numero de asegurados: 2
codigo de area: a2
pedro
juan
carlos
numero de asegurados: 3
codigo de area: a3
bieito
numero de asegurados: 1
codigo de area: a4
xoan
eva
comba
ainara
numero de asegurados: 4
codigo de area: a5
dorotea
elisa
amalia
dolores
maria
xose
andrea
iria
antia
xana
numero de asegurados: 10
codigo de area: a6
area  sen asegurados
codigo de area: a7
jose
numero de asegurados: 1

*/

create or replace procedure parea () 
language plpgsql as $$

declare 


c record;
i record;
r varchar='';
contador integer;

begin

    for c in select coda from area loop
        contador = 0;
        r=r||'codigo area: '||c.coda||E'\n';
        for i in select nomas from asegurado where coda=c.coda loop
            contador=contador+1;
            r=r||i.nomas||E'\n';
        end loop;
        
        if contador = 0 then 
        r=r||'zona sen asegurados'||E'\n';
        else
        r=r||'numero de asegurados: '||contador||E'\n';
        end if;
    end loop;
    
    raise notice '%',r;

end;$$







