/*
trigger que impida rexistrar dúas cidades co mesmo nome.
*/

drop trigger if exists t1 on cidades;
create or replace function ft1() returns trigger language plpgsql as $$
declare
comprobar integer;
begin
    
    select count(*) into comprobar from cidades where nomc = new.nomc;
    if comprobar <> 0 then 
        raise exception 'Esa cidade xa esta rexistrada';
    else
        return new;
    end if;

end;$$
;
create trigger t1 before insert on cidades for each row execute 
procedure ft1()

