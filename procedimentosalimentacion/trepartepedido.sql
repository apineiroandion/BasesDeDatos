/*
trepartepedido
impedir que un repartidor cargue pedidos que sean de clientes que sean de zonas distintas as que el esta asignado

insert into carga values ('p13','z1',1,2,'12/2/2024',18);
este pedido non corresponde repartilo a este repartidor

insert into carga values ('p13','z2',1,2,'12/2/2024',18);
pedido cargado

dime ocodigo da zona do cliente que fixo o pedido 'p13'
*/

/*
Si es disntinto en binario se pone <>
*/

drop trigger if exists trepartepedido on carga;
create or replace function ftrepartepedido() returns trigger language plpgsql as $$
declare
com varchar='';
begin
    
    select codz into com from cliente where nif in(select nif from pedido where codp=new.codp); 
    if com=new.codz then
        raise notice 'pedido cargado';
        return new;
    else 
        raise exception 'este pedido non corresponde repartilo a este repartidor';
    end if;
end;$$
;
create trigger trepartepedido before insert on carga for each row execute 
procedure ftrepartepedido()



