/*
crear funcion fmastresjp tal que pasandolle o nome dun equipo devolte a mensaxe seguinte:
se o equipo ten tres xogadores: 'ten tres xogadores'
se o equipo ten mais de tres xogadores: 'ten mais de tres xogadores'
se equipo ten menos de tres xogadores: 'ten menos de tres xogadores'
se o equipo non existe: 'equipo inexistente'
*/
create or replace function fmastresjp (c varchar) returns varchar language plpgsql as $$

declare 
r int;
t varchar='';
v varchar;

begin
select codequ into STRICT v from equipo where nomequ=c;
select count(*) into r from xogador where codequ=v;
if r=3 then
    return 'ten tres xogadores';

elsif r>3 then
    return 'ten mais de tres xogadores';

elsif r<3 then
    return 'ten menos de tres xogadores';
    end if;

return t||r;
exception
when no_data_found then
return 'equipo inexistente';
end;$$
