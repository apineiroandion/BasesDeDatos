/*
phospital2
procedemento que amose os nomes de todos os hospitais e para ca un deles os nomes dos medicos que prescribiron  hospitalizacions a asegurados de primeira categoria 
*/

create or replace procedure phospital2 () 
language plpgsql as $$

declare 
c record;
j record;
r varchar='';

begin

for c in select * from hospital loop
    r=r||c.nomh||E'\n';

    for j in select * from medico where codm in(select codm from hosp1 where codh=c.codh) loop

    r=r||E'\t'||j.nomm||E'\n';
    end loop;
    
end loop;

raise notice '%',r;
end;$$


