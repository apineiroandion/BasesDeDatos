/*
Desenvolver un trigger tfroitasp que impida que un lacteo poda clasificarse tamen como froita
*/



drop trigger if exists tfroitasp on froitas;
create or replace function ftfroitasp() returns trigger language plpgsql as $$
declare
contal integer;
contac integer;
contaf integer;

begin
    --new.codm,new.n,new.orixe
    select count(*) into contal from lacteos where codm=new.codm and n=new.n;
    select count(*) into contac from conservas where codm=new.codm and n=new.n;
    select count(*) into contaf from fiambres where codm=new.codm and n=new.n;
    if contal = 1 or contac = 1 or contaf = 1 then
    raise exception 'rexeitada insercion, xa esta en outro grupo';
    else
    raise notice 'Aceptada';
    end if;
    return new;
end;$$
;
create trigger tfroitasp before insert on froitas for each row execute 
procedure ftfroitasp()



