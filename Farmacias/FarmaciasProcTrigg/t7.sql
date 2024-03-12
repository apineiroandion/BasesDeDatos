/*
15) trigger tfarmaceuticosimple
 que impida que nunha mesma farmacia traballe mais dun farmaceutico
*/

drop trigger if exists tfarmaceuticosimple on traballan;
create or replace function ftfarmaceuticosimple() returns trigger language plpgsql as $$
declare
contador integer;
c record;
begin
    contador = 0;
    for c in select * from traballan where codf = new.codf loop
        contador = contador + 1;
    end loop;
    
    if contador > 0 then
        raise exception 'ya hay un trabajador';
    else
        return new;
    end if;


end;$$
;
create trigger tfarmaceuticosimple before insert on traballan for each row execute 
procedure ftfarmaceuticosimple()

