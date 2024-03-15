/*
trigger timpidep
trigger que impida que un asegurado de 2ª categoria poda rexistrarse tamen como asegurado de 1ª categoría
 
 insert into a1c values('p15',1);
   o asegurado xa o e de 2ª categoria
 insert into a1c values('p15',2);
   realizada insercion de asegurado de 1ª categoria
*/

drop trigger if exists timpidep on a1c;
create or replace function ftimpidep() returns trigger language plpgsql as $$
declare
comprobar integer;
begin
    comprobar = 0;
    
    select count(*) into comprobar from a2c where new.codp = a2c.codp and new.numas=a2c.numas;
    
    if comprobar = 0 then 
        raise notice 'realizada insercion de asegurado de 1ª categoria';
        return new;
    else 
        raise exception 'o asegurado xa o e de 2ª categoria';
    end if;
         
end;$$
;
create trigger timpidep before insert on a1c for each row execute 
procedure ftimpidep()

