/*
ppersoa
procedemento chamdo ppersoa que amose para unha persoa cuxo dni se pasa por parámetro o seu nome e os postos para os que se lle fixeron entrevistas e o nome e apelidos do xestor que llas fixo 


call ppersoa('36555555');

persoa: elisa,bermudez,bastos
postos e xestor que o xestionou:
p1 : ricardo,leiro,suarez
p342 : eva,bastos,boullosa
p14 : ricardo,leiro,suarez
*/

create or replace procedure ppersoa (input varchar) 
language plpgsql as $$

declare 
c record;
nome varchar='';
ap1 varchar='';
ap2 varchar='';
cod integer;
r varchar='';
codXestor varchar='';
nomXestor varchar='';
ap1Xestor varchar='';
ap2Xestor varchar='';

begin

select nom_persoa, ap1_persoa, ap2_persoa, num_persoa from persoas into nome, ap1, ap2, cod where dni=input;

    r=r||'persoa: '||nome||','||ap1||','||ap2||E'\n';
    r=r||'postos e xestor que o xestionou: '||E'\n';
    
for c in select * from entrevista where num_persoa=cod loop
    select cod_xestor into codXestor from postos where cod_posto=c.cod_posto;
    select nom_xestor, ap1_xestor, ap2_xestor into nomXestor, ap1Xestor, ap2Xestor from xestores where cod_xestor=codXestor;
    r=r||c.cod_posto||' : '||nomXestor||','||ap1Xestor||' '||ap2Xestor||E'\n';
end loop;
    
    raise notice '%',r;

end;$$
