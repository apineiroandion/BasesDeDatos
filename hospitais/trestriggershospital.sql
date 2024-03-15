
1) trigger timpidep
trigger que impida que un asegurado de 2ª categoria poda rexistrarse tamen como asegurado de 1ª categoría
 
 insert into a1c values('p15',1);
   o asegurado xa o e de 2ª categoria
 insert into a1c values('p15',2);
   realizada insercion de asegurado de 1ª categoria
   
2) trigger tlimitepolizap
trigger que impida que unha mesma poliza teña mais de 2 asegurados

insert into asegurado values ('p15',3,'agapito','2/3/2000','a1');
    a poliza xa ten dos asegurados, rexeitado o terceiro
insert into asegurado values ('p14',3,'agapito','2/3/2000','a1');
    realizada insercion de novo asegurado
    
3) trigger  th1p 
impedir que se poida hospitalizar a un asegurado de 1ª categoría nun hospital concertado si o médico non está adscrito a mesma area que ten asignada dito hospital concertado. En caso contrario debe levarse a cabo a hospitalizacion.
Se o asegurado ( sempre nos referimos ao de 1ª categoria) se hospitaliza nun hospital propio non se ten en conta a restriccion anterir, e decir a hospitalizacion e immediata). 

insert into hosp1 values('h8','p4',2,'m1','1/1/1970','1/2/1970');
 o medico non está adscrito a mesma area que ten asignada dito hospital concertado
insert into hosp1 values('h5','p4',2,'m1','1/1/1980','1/2/1980');
inserción levada a cabo
insert into hosp1 values('h1','p4',2,'m1','1/1/1970','1/2/1970');
realizada insercion en hospital propio
    
    
    
