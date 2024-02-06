/*
desenvolver unha funcion chamada fcontaxogadores tal que  pasandolle o nome dun equipo devolte o numero de xogadores que ten usando exception con no_data_found
*/
create or replace function fcontaxogadoresp2 (c varchar) returns varchar language plpgsql as $$

declare 
r int;
t varchar='';
v varchar;

begin
select codequ into STRICT v from equipo where nomequ=c;
select count(*) into r from xogador where codequ=v;


return t||r;
exception
when no_data_found then
return 'equipo inexistente';
end;$$
