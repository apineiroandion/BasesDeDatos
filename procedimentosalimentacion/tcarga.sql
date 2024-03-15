/*
tcarga
impedir cargar un pedido realizado nunha data distinta a data de carga

insert into carga values('p17', 'z1',1,2,'14/07/2020',18);
este pedido no pode cargarse nesta data

insert into carga values('p17', 'z1',1,2,'13/07/2020',18);
pedido cargado


*/

drop trigger if exists tcarga on carga;
create or replace function ftcarga() returns trigger language plpgsql as $$
declare
dataPedido date;
begin
    select data into dataPedido from pedido where codp=new.codp; 
    if dataPedido=new.data then
        raise notice 'pedido cargado';
        return new;
    else 
        raise exception 'este pedido no pode cargarse nesta data';
    end if;
end;$$
;
create trigger tcarga before insert on carga for each row execute 
procedure ftcarga()



