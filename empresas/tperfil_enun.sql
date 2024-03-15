/*
tperfil:
realizar un trigger  chamado tperfil que comprobe que cando se entrevista a unha persona para un posto , dita persoa ten o mesmo perfil que corresponde o puesto.
Cando o perfil do posto e persona coincidan debe realizarse a insercion lanzandose a mensaje : entrevista insertada perfiles coincidentes. Si o perfil de posto e persona non coinciden a mensaxe debe ser : perfiles de posto e persoa non coincidentes.
insert into entrevista values('p14',14,'f','f');
ERROR:  perfiles de posto e persoa non coincidentes

insert into entrevista values('p14',15,'f','f');
NOTICE:   entrevista insertada perfiles coincidentes

*/
drop trigger if exists tperfil on entrevista;
create or replace function ftperfil() returns trigger language plpgsql as $$
declare
perfilpersoa varchar='';
perfilposto varchar='';
begin

select cod_perfil into perfilpersoa from persoas where num_persoa=new.num_persoa;
select cod_perfil into perfilposto from postos where cod_posto=new.cod_posto;

if perfilpersoa = perfilposto then

 raise notice 'entrevista insertada perfiles coincidentes';
 return new;
 
 else
 
 raise exception 'perfiles de posto e persoa non coincidentes';
 
 end if;


end;$$
;
create trigger tperfil before insert on entrevista for each row execute 
procedure ftperfil()
