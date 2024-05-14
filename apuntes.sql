--PERMISOS ACL (Acces Control List)--

create role ventas;
create role contabilidad;
create user alicia with password 'alicia';
create user bob with password 'bob';

grant ventas to alicia; --metemos a alicia en el grupo ventas
grant contabilidad to bob; --bob al grupo contabilidad

create database empresa;

grant select, insert, update, delete on facturas to alicia;
grant select on facturas to contabilidad;
revoke select on facturas from contabilidad;

grant select(id, finalizada, detalles) on facturas to contabilidad;

\c empresa alicia
insert into facturas values(202345, true, 'repitiendo cliente', '{"detalles":"...."}');
insert into facturas values(202346, true, 'descuento en volumen', '{"detalles":"...."}');
insert into facturas values(202347, false, 'llamar al cliente', '{"detalles":"...."}');

\c empresa bob;
select * from facturas; -- no se puede xq solo tiene permisos sobretres columnas
select id, finalizada, detalles from facturas;

--PERMISOS A NIVEL DE FILA RLS(Row Level Security)--

--POLITICAS PERMISIVAS

alter table facturas enable row level security; --como postgres, xq lo tiene que hacer el propietario

create policy solo_finalizada on facturas to contabilidad using (finalizada=TRUE);

\c empresa bob

select id, finalizada, detalles from facturas; -- ahora el grupo contabilidad solo puede ver las facturas finalizadas

\c empresa postgres

create policy todas_las_filas on facturas to ventas using (TRUE); --poner solo TRUE es para todas las filas

\c empresa alicia

select * from facturas;

--POLITICAS RESTRICTIVAS

create policy non_borrar on facturas as restrictive for delete to public using (finalizada = false); --la condicion que pones es lo que te premite borrar

--Postgres aplica primeiro a suma (OR) das politicas permisivas, e logo, sobre as filas que quedan aplica a muliplicacion (AND) das politicas restrictivas.

--BEGIN; // bloque ooperacions // COMMIT; (confirma) || ROLLBACK; (Vuleve al BEGIN)

begin;
delete from facturas;
rollback;

--para poder aplicar una politica restrictiva primero tiene que haber por lo menos unas permisiva

drop policy "todas_las_filas" on facturas;

drop policy "solo_finalizada" on facturas;

select * from facturas ; --no ve nada porque le quitamos los permisos

delete from facturas; -- no puede borrarlas porque no puede ver ninguna

--se los volvemos a dar y ya podemos borrar




