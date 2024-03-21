/*
tclas
*/

drop trigger if exists tclas on non_estructuras;
create or replace function ftclas() returns trigger language plpgsql as $$
declare

comprobador integer;

begin
    comprobador = 0;
    select count(*) into comprobador from estructuras where coda = new.coda;
    if comprobador = 0 then
        raise notice 'aceptada insercion';
        return new;
    else
        raise exception 'rexeitada insecion';
    end if;

end;$$
;
create trigger tclas before insert on non_estructuras for each row execute 
procedure ftclas()

