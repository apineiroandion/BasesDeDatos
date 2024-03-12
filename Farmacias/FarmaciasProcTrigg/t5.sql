/*
tpresentacion (variante de exercicio 4: trigger tmaxtock) (dificil)
Impedir que se poda rexistrar no stock de unha farmacia un    medicamento do que xa hai mais de tres unidades en stock (independentemente da sua presentacion) se ademais esa farmacia esta nuha cidade onde hai polo menos unha farmacia mais.
*/

drop trigger if exists tmaxstock on stock;
create or replace function ftmaxstock() returns trigger language plpgsql as $$
declare
contador integer;
c record;
begin
    contador = 0;
    select codc into codigo from farmcaias where codf=new.codf;
    for c in select * from farmacias where codc=codigo loop
        contador = contador + 1;
    end loop;
    
    if new.cantidads > 2 and contador > 1 then
        raise exception 'hay mais de tres unidades';
    else
        return new;
    end if;

end;$$
;
create trigger tmaxstock before insert on stock for each row execute 
procedure ftmaxstock()

