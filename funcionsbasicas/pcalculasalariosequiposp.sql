/*
crear procedemento pcalculasalariosequiposp que calcule a media dos salarios de cada equipo e que actualize o campo mediasalaraios da taboa equipo con ditos valores
*/

create or replace procedure pcalculasalariosequiposp () 
language plpgsql as $$

declare 

i record;
r varchar='';

begin

for i in select codequ, avg(salario) m from xogador group by codequ loop
    update equipo set mediasalarios=i.m where equipo.codequ=i.codequ;
end loop;


end;$$
