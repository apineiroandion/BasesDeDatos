/*
triggers que impidan que unha persoa sexa rexistrada    ao mesmo tempo na tabla    'farmaceuticos' e na taboa 'propios'. (so pode estar rexistrada nunha das taboas).
Antes de nada borrar do script 'farmacias.sql'    a linea que pon : insert into farmaceuticos values('3681',5,134); e voltalo a lanzar
*/

drop trigger if exists t2 on farmaceuticos, propios;
create or replace function ft2() returns trigger language plpgsql as $$
declare

begin
    

end;$$
;
create trigger t2 before insert on farmaceuticos, propios for each row execute 
procedure ft2()

