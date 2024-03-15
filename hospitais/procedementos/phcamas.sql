/*
phcamas:

procedimento que, pasandolle o numero de camas como parametro, devolte os nomes dos hospitais propios que as superan asi como os nomes dos hospitalizados de 1 categoria que estiveron neles, e o seu total. Se ningun hospital propio supera o numero de camas a mensaxe debe ser: 'ningun hospital propio supera ese numero de camas'
Si agun dos hospitais non ten hospitalizados de 1 categoria a mensaxe debe ser : 'hospital sen hospitalizados'.

Ex:
call phcamas(150);
hospital: canalejo
dolores
dolores
o numero de hospitalizados e : 2

hospital: meixoeiro
hospital sen hospitalizados

hospital: paz
andrea
o numero de hospitalizados e : 1
Ex:
call  phcamas(3000);
ningun hospital propio supera ese numero de camas
*/

create or replace procedure phcamas (input integer) 
language plpgsql as $$

declare 

contador integer;
contadorH integer;
c record;
i record;
r varchar='';
nombre varchar='';

begin
contadorH=0;
for c in select * from hospital where codh in(select codh from propio) and numc > input loop
    contadorH=contadorH+1;
    contador=0;
    r=r||'hospital: '||c.nomh||E'\n';
        for i in select * from hosp1 where codh=c.codh loop
        contador=contador+1;
            select nomas into nombre from asegurado where codp=i.codp and numas=i.numas;
                r=r||nombre||E'\n';
        end loop;
        if contador = 0 then
            r=r||'hospital sen hospitalizados'||E'\n';
        else
            r=r||'o numero de hospitalizados e : '||contador||E'\n';
        end if;
end loop;
    
    if contadorH=0 then 
        raise notice 'ningun hospital propio supera ese numero de camas';
    else
        raise notice '%',r;    
    end if;

end;$$









