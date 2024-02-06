/*
crear procedemento plistacolparp que liste nome de todos os coneliaxos e para eles codigo e data de todos os partidos en que interveñen. se algun non interviu en ningun partido, este colexiado, "Este colexiado non interviuen ningun partido"*/

create or replace procedure plistacolparp () 
language plpgsql as $$

declare 
r varchar='';
c record;
i record;
d varchar='';
e date;
g varchar='';
f int;
begin

    for c in select * from colexiado loop
        select nomc into d from colexiado where colexiado.codc=c.codc;
        r=r || ' nome: '|| d||E'\n';
            f=0;
         for i in select * from interven where codc=c.codc loop
            f=f+1;
             select data into e from partido where partido.codpar=i.codpar;
             select nompar into g from partido where partido.codpar=i.codpar;
             r=r ||E'\t'|| ' Nome Partido: '|| g||' ,data: '||e||E'\n';
           end loop;
        if f=0 then
            r=r ||E'\t'||'Este colexiado non interviuen ningun partido'||E'\n';
            end if;

        --meto la d para concatenar un salto de pagina despues del NOTICE:
        d=d ||E'\n'||r;
    end loop;
    raise notice '%',d;

end;$$
