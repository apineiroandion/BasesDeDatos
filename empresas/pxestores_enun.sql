--pxestores 
--valor: 2'5 puntos
--procedimiento que devolva para cada codigo de xestor os postos e a 
--descripcion dos mesmos que xestionou dito xestor, asi como o numero total de postos
-- xestionados por dito xestor.
--si o xestor non xestionou ningun posto debe lanzarse 
--a mensaxe 'este xestor non xestionou ningun posto'
--call pxestores()
/*
resultado:
xestor: x1
p1----direc. dep. informatica
p8----vendedor senora
p11----disenador aplicacions
p14----vendedor caballero
p15----vendedor neno
p16----vendedor viaxes
p17----vendedor plantas
total: 7

xestor: x10
este xestor non xestionou ningun posto

xestor: x2
p2----barrendeiro
p7----xefe iluminacion
p9----xefe xardineiros
p10----instalador software
p12----revisor ascensores
total: 5

xestor: x3
p3----limpador colexios
p6----perforador pozos
p13----coidador parques
total: 3

xestor: x4
p4----instalador ordenadores
total: 1

xestor: x5
p342----empregado biblioteca
total: 1

xestor: x6
p5----limpador instalaciones
total: 1

xestor: x7
este xestor non xestionou ningun posto

xestor: x8
este xestor non xestionou ningun posto

xestor: x9
p18----vendedor plantas
total: 1


*/

create or replace procedure pxestores () 
language plpgsql as $$

declare 
c record;
k record;
r varchar='';
contador integer;
begin

for c in select cod_xestor from xestores loop 
    contador=0;
    r=r||'xestor: '||c.cod_xestor||E'\n';
    for k in select * from postos where cod_xestor=c.cod_xestor loop
    contador=contador+1;
        r=r||E'\t'||k.cod_posto||'----'||k.des_posto||E'\n';
    end loop;
    if contador=0 then 
        r=r||E'\t'||'este xestor non xestionou ningun posto'||E'\n';
    else
        r=r||E'\t'||'total: '||contador||E'\n';
    end if;
end loop;
    
    raise notice '%',r;

end;$$



