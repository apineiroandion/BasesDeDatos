/*
3) trigger que impida que nunha mesma farmacia traballen mais de duas personas.
insert into traballan values(codf, dnip);
*/

drop trigger if exists t3 on traballan;
create or replace function ft3() returns trigger language plpgsql as $$
declare

contador integer;
c record;
begin
    
    contador=0;
    for c in select * from traballan where codf=new.codf loop
        contador=contador+1;
    end loop;    
    if contador  > 1 then
        raise exception 'a farmacia xa ten dous empleados';
    else
        return new;
    end if;

end;$$
;
create trigger t3 before insert on traballan for each row execute 
procedure ft3()

