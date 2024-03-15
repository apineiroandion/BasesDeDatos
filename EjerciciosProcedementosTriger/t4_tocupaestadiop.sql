/*
trigger chamado t4_tocupaestadiop que impida que nun mesmo estadio poda adestrar outro equipo
no mesmo ano
E dicir hay que impedir que si un estadio xa esta ocupado nun ano determinado, ningun equipo poda
adestrar nese estadio nese mesmo ano

insert into adestra values('e1',2002,'es1');
mensaxe : ese estadio xa esta ocupado para ese ano

insert into adestra values('e1',2004,'es1');
--mensaxe: registro inserido correctamente
*/

drop trigger if exists t4_tocupaestadiop on adestra;
create or replace function ft4_tocupaestadiop() returns trigger language plpgsql as $$
declare
numero integer;
begin

select count(*) into numero from adestra where ano=new.ano and codest=new.codest;

if numero=1 then
    raise exception 'xa hay un equipo que entrena no estadio % no ano %',new.codest,new.ano;
end if;
    return new;
    raise notice 'aceptada inserccion';
end;$$
;
create trigger t4_tocupaestadiop before insert on adestra for each row execute 
procedure ft4_tocupaestadiop()
