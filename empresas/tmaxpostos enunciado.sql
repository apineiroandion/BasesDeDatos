/*
tmaxpostos
impedir que un mesmo xestor poda xestionar mais de 7 postos

exemplos:

insert into postos values ('p19', 'disenador web', 3000,365,'pe2','e8','x1');

 este xestor xa xestiona 7 postos

insert into postos values ('p19', 'disenador web', 3000,365,'pe2','e8','x2');

 insercion aceptada
*/
drop trigger if exists tmaxpostos on postos;
create or replace function ftmaxpostos() returns trigger language plpgsql as $$
declare
num integer;
begin

select count(*) into num from postos where cod_xestor=new.cod_xestor;

if num < 7 then
    
    raise notice 'inserccion aceptada';
    return new;
    else
    raise exception 'Este xesto xa xestiona 7 postos';
end if;

end;$$
;
create trigger tmaxpostos before insert on postos for each row execute 
procedure ftmaxpostos()
