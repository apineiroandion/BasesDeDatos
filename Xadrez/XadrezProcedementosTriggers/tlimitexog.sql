/*
tlimitexog
trigger que impida que unha mesma partida a podan xogar mais de dous xogadores

insert into xoga values('p2','pa1','negras');
insercion rexeitada: a partida xa a xogan dous xogadores 
insert into xoga values('p17','pa16','negras');
insert into xoga values('p9','pa16','brancas');

*/

drop trigger if exists tlimitexog on xoga;
create or replace function ftlimitexog() returns trigger language plpgsql as $$
declare
cuenta integer;
begin

    select count(*) into cuenta from xoga where codpa = new.codpa;
    
    if cuenta = 2 then 
        raise exception 'insercion rexeitada: a partida xa a xogan dous xogadores ';
    else
        return new;
    end if;

end;$$
;
create trigger tlimitexog before insert on xoga for each row execute 
procedure ftlimitexog()

