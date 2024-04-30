1) conectar a base postgres con usuario postgres
psql
2) crear usuario userfu con password userfu
create user userfu with password 'userfu';
3) crear unha nova base chamada futbol2
create database futbol2;
4)conectarse a base futbol2 con o usuario postgres
\c futbol2 postgres
5) crear un novo esquema chamado fu
create schema fu authorization userfu;
6) por como propietario do esquema fu ao usuario userfu
alter schema fu owner to userfu;
7) por como esquema de busqueda  por defecto para as taboa futuras do usuario userfu ao esquema fu ( alter user ....  set search_path ...)
alter user userfu in database futbol2 set search_path to fu;
8)conectarse a base futbol2 con o usuario userfu
\c futbol2 userfu
9)lanzar script futboltodoxuntov1p.sql
ok
10)comprobar que as taboas foron creadas dentro do esquema fu
\d
