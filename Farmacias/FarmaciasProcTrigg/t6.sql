/*
14) trigger tfarmaceutico 
impedir que nunha mesma farmacia traballe mais dun farmaceutico, a menos que o novo farmaceutico sexa da mesma cidade na que esta a a farmacia
*/

drop trigger if exists tfarmaceutico on traballan;
create or replace function ftfarmaceutico() returns trigger language plpgsql as $$
declare
codigoCidade integer;
codigoFarm integer;
begin
    select codc into codigoCidade from farmacias where  codf = new.codf;
    select codc into codigoFarm from farmaceuticos where dnip = new.dnip;

    if codigoCidade = codigoFarm then
        return new;
    else
        raise exception 'non e da mesa cidade';
    end if;

end;$$
;
create trigger tfarmaceutico before insert on traballan for each row execute 
procedure ftfarmaceutico()

