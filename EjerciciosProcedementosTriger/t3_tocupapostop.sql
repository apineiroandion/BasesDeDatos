/*
trigger chamado t3_tocupapostop que impida que un xogador poda xogar un partido nun posto (o
posto o seu numero de camiseta) que xa esta ocupado por outro xogador no mesmo partido.
E decir non podo haber mais dun xogador ocupando o mesmo posto( ou o que o mesmo xogando
co mesmo numero de mesma camiseta no mesmo partido)
insert into xoga values('x1','p3',1,0);
-- rexeitada insercion, o posto 1 xa esta ocupado por outro xogador no partido p3
insert into xoga values('x1','p3',2,0);
--rexistro insertado correctamente
*/

drop trigger if exists t3_tocupapostop on xoga;
create or replace function ft3_tocupapostop() returns trigger language plpgsql as $$
declare
numero integer;
begin

select count(*) into numero from xoga where posto=new.posto and codpar=new.codpar;

if numero=1 then
    raise exception 'xa hay un xogador no posto % no partido %',new.posto,new.codpar;
end if;
    return new;
    raise notice 'aceptada inserccion';
end;$$
;
create trigger t3_tocupapostop before insert on xoga for each row execute 
procedure ft3_tocupapostop()
