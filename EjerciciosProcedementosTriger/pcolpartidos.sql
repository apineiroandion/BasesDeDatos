/*
Procedemento pcolpartidos que amose para cada colexiago codigo e nome, o nome e as datas dos partidos nos que inteven.
Tamen amisar o total de partidos en que interven cada colexiado, si non interven en ningun partido amosar a mensaxe -colexiado sen partidos arbitrados-
 
*/

create or replace procedure pcolpartidos () 
language plpgsql as $$

declare 
c record;
i record;
r varchar='';
f integer;
e date;
g varchar='';
conta integer;
begin   

    for c in select codc, nomc from colexiado loop
    f=0;
    conta=0;
        r=r||'codigo: '||c.codc||' nome: '||c.nomc||E'\n'; 
            for i in select * from interven where codc=c.codc loop
                f=f+1;
                conta=conta+1;
                select data into e from partido where partido.codpar=i.codpar;
                select nompar into g from partido where partido.codpar=i.codpar;
                r=r ||E'\t'|| ' Nome Partido: '|| g||' ,data: '||e||E'\n';

            end loop;
          if f=0 then
          r=r ||E'\t'||'Este colexiado non interviuen ningun partido'||E'\n';
          else
          r=r ||E'\t'|| ' Conta: '||conta||E'\n';
          end if;
    end loop;
    
    raise notice '%',r;
end;$$
