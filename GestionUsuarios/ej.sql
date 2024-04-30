/*u4 debe dar permiso a u3 para facer select e insert na sua taboa estadio e ao mesmo tempo darlle permiso a u3 para administrar ditos privilexios*/
grant insert,select on estadio to u3 with grant option;
grant usage on schema es4 to u3;
grant usage on schema es4 to u5;
/*O u3 debe dar permiso a u5 para poder faccer select e insert na taboa estadio de u4 ca posibilidade de administralo*/
grant insert,select on es4.estadio to u5 with grant option;
/*Proba:
me conecto como u5 de podo facer:
insert into es4.estadio values('es5','terraqueo');
select * from es4.estadio;
*/



/*quitar permiso de lectura a u3 de estadios*/
revoke select on estadio from u3 cascade;
