/*
Desenvolver un trigger que impida que un novo xogador cobre mais que o xogador que xa esta cobrando mais que todos os xogadores que xa ha na base
*/
drop trigger if exists t1_salariomaxp on xogador;
create or replace function ft1_salariomaxp() returns trigger language plpgsql as $$
declare
salariomaximo integer;
begin


select max(salario) into salariomaximo from xogador;
raise notice '% %',salariomaximo , new.salario;
if new.salario>salariomaximo then
/*raise excepcion rompe el programa y hace que finalize*/
raise exception 'insercion rexeitada porque o salario do novo xogador pasaria a ser maios do maximo que se cobra actualmente';
end if;
return new;

end;$$
;
create trigger t1_salariomaxp before insert on xogador for each row execute 
procedure ft1_salariomaxp()
