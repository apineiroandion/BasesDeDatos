/*
trigger chamdo tmaxstock que impida que se poda rexistrar no stock de unha farmacia un    medicamento do que xa hai mais de tres unidades en stock (independentemente da sua presentacion)
*/

drop trigger if exists tmaxstock on stock;
create or replace function ftmaxstock() returns trigger language plpgsql as $$
declare


begin
    
    if new.cantidads > 2 then
        raise exception 'hay mais de tres unidades';
    else
        return new;
    end if;

end;$$
;
create trigger tmaxstock before insert on stock for each row execute 
procedure ftmaxstock()

