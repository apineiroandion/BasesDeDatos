/*ctrl+l limpiar la pantalla*/
select user; /*Para ver el usuario actual*/
create user u3 with password 'u3';
create schema es3 authorization u3;
drop schema es3;

/*Entrar en la base de datos dam con el ususario u3*/
psql dam u3 
/*Creamos el squema dentro de dam*/
create schema es3 authorization u3;
/*crear esquema es4 para el usuario u3*/
create schema es4 authorization u3;
\dn

/*crear tabla en el equema e3*/ /*/du ver usuarios*/ /*dt busca las tablas del usuario*/
create table es3.t1 (a int);

show search_path; /*BUsca las tablas*/

\dt es3.*
/*lA borramos para crearla en el owner e3*/
drop table es3.t1;
\c dam u3 /*conectarse a la base dam con el usuario u3*/
create table es3.t1 (a int);

/*Hace que la ruta de busqueda del user u3 sea es3*/
alter user u3 in database dam set search_path to es3; 

create table es4.t2 (a int);
alter user u3 in database dam set search_path to es3, es4; 


create table es4.t1 (a int);
create table es4.t3 (a int);

dt e*.*;

select * from pg_tables where tableowner = 'u3';

/*Buscar path*/
show search_path;

/*Crear script creaestpar.sql que conteña drops, create e inserts das taboas esstadio e partido e 

crear usuario u4 con contrasinal 'u4' facendo propietario do esquema es4

lanzalo dentro do esquema es4 como usuario e3*/
create user u4 with password 'u4';
exit
\c dam postgres /*cambiar el usuario de la base dam a postgres*/
alter schema es4 owner to u4;
alter user u4 in database dam set search_path to es4;

/*Crear usuario u5 con pass 'u5'*/
create user u5 with password 'u5';

/*Usuario u3 tiene que dar permiso al usuario u4 para que pueda hacer select en su tabla equipo */

grant select on equipo to u4; /*Desde u3 da permiso al usuario u4 para acceder a la tabla equipo*/

grant usage on schema es3 to u4; /*Desde u3 da permiso al usuario u4 para acceder al esquema es3*/

/*Dar permiso de facer insert na mesma taboa coa posibilidade de administrar dito permiso*/

grant insert on equipo to u4 with grant option;

grant insert on es3.equipo to u5 with grant option;/*ahora u4 se lo puede dar a u5*/

/*u5 ahora tiene permiso para insertar dado por u4, pero no tiene permiso para acceder al esquema, del cual es propietario u3, por lo que tiene que darselo*/

grant usage on schema es3 to u5; /*Desde u3*/

insert into es3.equipo values ('e6', 'novisimo'); /*u5*/

select * from es3.equipo; /*desde u4 porque u5 no tiene permiso de select, solo de insert*/

/*\dp comporbar permisos*/

/*Quitar un permiso*/
/*desde u3*/
revoke insert on equipo from u4;
/*da error porque hay permisos en casca*/
revoke insert on equipo from u4 cascade;
/*\l lista de bases de datos*/

/*toda la informacion de la estructura de la db*/
select * from information_schema.table_privileges where table_name='equipo';

select grantor, grantee, privilege_type from information_schema.table_privileges where table_name='equipo';
select grantor, grantee, privilege_type from information_schema.table_privileges where table_name='equipo' and grantor <> grantee;

select grantor, grantee, privilege_type, table_schema from information_schema.table_privileges where table_name='equipo' and grantor <> grantee;

/*consulta con nombre*/
create view v as select nomx, codequ from xogador;

/*Dar permiso solo sobre campos*/
grant select(codx, nomx) on xogador to u4;

\l /*lista databases*/
C /*create schemas*/
c /*connect*/
\dn /*lista schemas*/
u /*usage*/
C /*create tables*/
a r w d (/*
a insert
r select
w update
d delete
*/)

/*quitar todos los permisos de una base de datos a public (todos) */

revoke all on database dam from public;
/*devolverselos a u3*/
grant connect on database dam to u3;

/*Dar permisos a u3 para crear schemas, no hacer falta especificartlo, porque a nivel de base de datos solo le puede crear schemas, a nivel de schema se pueden crear tablas*/
grant create on database dam to u3;

/*probarlo*/
create schema esproba;

/*desde postgres tambien puede crear un esquema y asignarselo a un ususario que no puede crear esquemas*/
create schema esproba2 authorization u4;


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

/*damos permiso a todos los usuarios para crear tablas en es4, que es propiedad de u4*/
grant create on schema es4 to public;
/*desde u3 lo porbamos y efectivamente podemos crear tablas en es4*/
create table es4.tproba(a int);

/*Damos connect a u5 desde postgres*/

grant connect on database "dam" to u5;

create table es4.tproba5(a int);

/*creamos nuevo usuario*/
create user u6 with password 'u6';
/*damosm posibilidad a todos de conectarse*/
grant connect on database "dam" to public;
/*si revocamos el permiso a u4 se podria segfuir conectando porque ahora el permiso es publico*/

revoke connect on database "dam" from u4;

/*u4 le da a todo el mundo lectura*/

grant select on estadio to public;

/**/
grant update on estadio to u3 with grant option;

grant update (codest) on partido to u3 with grant option;

grant update on partido to u3 with grant option;

/*Si retiras un permiso a nivel de tabla lo pierde a nivel de columna, pero no al reves*/

grant update on es4.tproba to u4 with grant option;

create table public.tx(a int);

/*Hcemos que nedie mas pueda crear tablas en public, hay que entrar desde postgres*/

revoke create on schema public from public;

/**
*   ROLES   
*/

-- Son grupos de permisos

/*Crear rol*/
create role readonly;
/*Dar posibilidad de conectarse*/
grant connect on database dam to readonly;
/*Dar inset en la tabla xoga*/
grant insert on es3.xogador to readonly;
/*Dar el rol de readonly a u4*/
grant readonly to u4;
/*prueba*/
insert into es3.xogador values ('x80','ana','e6',2000,5000,null);

grant insert on all tables in schema es4 to readonly;



















