
/* th10 
impedir que se poida hospitalizar a un asegurado de 2 categoría si o médico que realiza a hospitalización non esta adscrito a mesma area da que procede o paciente

insert into hosp2 values('h1','p11',1,'m1','1/1/1970','1/2/1970');
-- o medico  non esta adscrito a mesma area da que procede o paciente
insert into hosp2 values('h1','p1',1,'m1','1/1/1970','1/2/1970');
--asegurado non existente ou non de 2 categoria
insert into hosp2 values('h1','p1',2,'m1','1/1/1970','1/2/1970');
-- insercion levada a cabo
*/

drop trigger if exists th10 on hosp2;
create or replace function fth10() returns trigger language plpgsql as $$
declare
comprobarMedico integer;
comprobarAsegurado integer;
begin
    select count(*) into comprobarAsegurado from a2c where codp=new.codp and numas=new.numas;
    select count(*) into comprobarMedico from adscrito where codm=new.codm and coda in(select coda from asegurado where codp=new.codp and numas=new.numas);
    if comprobarAsegurado=0 then 
        raise exception 'asegurado non existente ou non de 2 categoria';
    elsif comprobarAsegurado<>0 and comprobarMedico=0 then
        raise exception 'o medico  non esta adscrito a mesma area da que procede o paciente';
    else
        raise notice 'insercion levada a cabo';
        return new;
    end if;
         
end;$$
;
create trigger th10 before insert on hosp2 for each row execute 
procedure fth10()

