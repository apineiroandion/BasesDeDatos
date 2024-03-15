/*
trigger txpais que impida que un mesmo pais represente a mais dous paises

insert into pais values ('8','hungria',12,3);
'rexeitada insercion'
insert into pais values ('9','luxemburgo',12,2);
'aceptada insercion'
*/

drop trigger if exists txpais on pais;
create or replace function ftxpais() returns trigger language plpgsql as $$
declare

begin
    
    if new.npr > 2 then
        raise exception 'rexeitada insercion';
    else
        raise notice 'aceptada insercion';
        return new;
    end if;

end;$$
;
create trigger txpais before insert on pais for each row execute 
procedure ftxpais()

