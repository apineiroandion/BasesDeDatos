/*
desenvolver unha funcion chamada fcontaxogadores tal que  pasandolle o nome dun equipo devolte o numero de xogadores que ten dito equipo
*/
create or replace function fcontaxogadoresp (c varchar) returns varchar language plpgsql as $$

declare 
r int;
t varchar;
v varchar;

begin
t='';
select codequ into v from equipo where nomequ=c;
if not found then 
    return 'equipo inexistente';
    end if;
select count(*) into r from xogador where codequ=v;


-- select count(*) into r from xogador where codequ in(select codequ from equipo where nomequ=c);

return t||r;
end;$$
