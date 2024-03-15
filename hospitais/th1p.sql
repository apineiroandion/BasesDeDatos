/*
impedir que se poida hospitalizar a un asegurado de 1ª categoría nun hospital concertado si o médico non está adscrito a mesma area que ten asignada dito hospital concertado. En caso contrario debe levarse a cabo a hospitalizacion.
Se o asegurado ( sempre nos referimos ao de 1ª categoria) se hospitaliza nun hospital propio non se ten en conta a restriccion anterir, e decir a hospitalizacion e immediata). 

insert into hosp1 values('h8','p4',2,'m1','1/1/1970','1/2/1970');
 o medico non está adscrito a mesma area que ten asignada dito hospital concertado
insert into hosp1 values('h5','p4',2,'m1','1/1/1980','1/2/1980');
inserción levada a cabo
insert into hosp1 values('h1','p4',2,'m1','1/1/1970','1/2/1970');
realizada insercion en hospital propio
*/

drop trigger if exists th1p on hosp1;
create or replace function fth1p() returns trigger language plpgsql as $$
declare
comprobarMedico integer;
comprbarHospital integer;
begin

    select count(*) into comprobarMedico from adscrito where codm=new.codm and coda in(select coda from concertado where codh=new.codh); 
    select count(*) into comprbarHospital from propio where codh=new.codh; 
    
    if comprbarHospital = 1 then
        raise notice 'realizada insercion en hospital propio';
        return new;
    else 
    
        if comprobarMedico = 0 then 
        raise exception ' o medico non está adscrito a mesma area que ten asignada dito hospital concertado';
        else 
            raise notice 'inserción levada a cabo';
            return new;  
        end if;
    
    end if;        
    
         
end;$$
;
create trigger th1p before insert on hosp1 for each row execute 
procedure fth1p()

