\dp y \dp+ -- Son lo mismo muestran los priviliegios
\dn -- muestra tablas y propietarios
\dn+ -- muestra tablas, propietarios y privilegios
/*\l lista de bases de datos*/
\dt --muestra las tablas





--Creacion de Usuarios--

create user <nombreUsuario> with password '<contraseña>';

select user; --para ver el usuario actual

create schema <nombreEsquema> authorization <nombreUsuario>;

show search_path; -- ver ruta de busqueda actual

alter user <nombreUsuario> in database <dbname> set search_path to <nombreEsquema>; --cambiar ruta de busqueda

alter schema <nombreEsquema> owner to <nombreUusario>; --cambiar propietario de un schema

--Permisos--

grant insert, select, update, delete on <table> to <usuario>; -- da los permisos de tabla a un usuario

grant usage on schema <schema> to <usuario>; --da permiso de uso a un esquema al usuario

grant insert, select, update, delete on <table> to <usuario> with grant option; -- da permisos con opcion de administrarlos 

revoke insert, select, update, delete on <table> from <usuario>; --quita permisos de tabal a u usuario

revoke insert, select, update, delete on <table> from <usuario> cascade; --quuita permisos en cascada

select * from information_schema.table_privileges where table_name='<tabla>'; --sleeccioan toda la info de privilegios

grant select(codx, nomx) on <tabla> to <usuario>; --da permisos solo sobre x columnas de una tabla a un usuario

grant connect on database <dbname> to <usuario>; --da permiso de conexion a una db a un usuario

grant create on database <dbname> to <usuario>; --da permiso de creacion de schemas a un usuario


/**
*   DATABASES \l
*       CcT -> C (Create schemas)
*           -> c (connect)
*           -> T (esquemas temporales)
*   SCHEMAS \dn+
*       UC -> U usage
*          -> C create table
*   LISTA PRIVILEGIOS \dp
*       arwd-> a insert
*           -> r select
*           -> w update
*           -> d delete
*/

create role <rolename>; --crea un rol

grant <permisos> on <table> to <rolename>; -- asigna permisos al rol

grante <rolename> to <user>; -- da el rol a un usuario


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











