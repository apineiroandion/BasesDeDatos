/*
Desenvolver un trigger tlacteosp que impida que unha froita poda clasificarse tamen como lacteo
*/



drop trigger if exists tlacteosp on lacteos;
create or replace function ftlacteosp() returns trigger language plpgsql as $$
declare
conta integer;

begin
    --new.codm,new.n,new.orixe
    select count(*) into conta from froitas where codm=new.codm and n=new.n;
    if conta = 1 then
    raise exception 'rexeitada insercion, xa esta en froitas';
    else
    raise notice 'Aceptada';
    end if;
    return new;
end;$$
;
create trigger tlacteosp before insert on lacteos for each row execute 
procedure ftlacteosp()



