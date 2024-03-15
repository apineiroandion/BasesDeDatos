/*
Desenvolver un trigger que impida que nun mesm partido xoguen mais de cinco xogadores

insert into xoga values ('x14','p1',4,0);
rexeitada insercion porque o partido p1 o xogarian mais de cinco xogadores

insert into xoga values ('x5','p3',4,0);
aceptada insercion porque o partido p3 ainda non tiña cinco xogadores

*/



drop trigger if exists t2_limitexogp on xoga;
create or replace function ft2_limitexogp() returns trigger language plpgsql as $$
declare
contapartidos int;
begin


select count(*) from xoga into contapartidos where codpar=new.codpar;

if contapartidos=5 then
/*raise excepcion rompe el programa y hace que finalize*/
raise exception 'rexeitada insercion porque o partido % o xogarian mais de cinco xogadores',new.codpar;
end if;
return new;
raise notice 'aceptada insercion porque o partido % ainda non tiña cinco xogadores',new.codpar;

end;$$
;
create trigger t2_limitexogp before insert on xoga for each row execute 
procedure ft2_limitexogp()
