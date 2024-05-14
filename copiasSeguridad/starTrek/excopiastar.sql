primeira parte :
1) conectar a base postgres con usuario postgres
\c postgres postgres
2) crear usuario star con password star
create user star with password 'star';
3) crear unha nova base chamada startrek
create database startrek
4) conectarse a base startrek co usuario star
\c startrek star
5) crear un novo esquema chamado st
create schema st authorization star;
6) por como propietario do esquema st ao usuario star
alter schema st owner to star;
7) por como esquema de busqueda por defecto para as taboa futuras do usuario
star ao esquema st
alter user star in database startrek set search_path to st; 
8)lanzar o script startrek.sql dentro da base startrek esquema st , conectado
como usuario star.
\c startrek star
\i...
9)comprobar que as taboas foron creadas dentro do esquema st dentro da base
startrek e que o propietario de ditas taboas e o usuario star.
\dt
segunda parte
10) facer unha copia e seguridade chamada ze.dump en formato comprimido das
estructuras das taboas interpretespel, interpretesser e visitas

pg_dump -s -t st.interpretespel -t st.interpretesser -t st.visitas -U postgres -Fc -d startrek > ze.dump

11) facer unha copia e seguridade chamada zd.dump en formato comprimido dos
datos das taboas interpretespel, interpretesser e visitas

pg_dump -a -t st.interpretespel -t st.interpretesser -t st.visitas -U postgres -Fc -d startrek > zd.dump

12) borrar a estructura e datos da taboa interpretespel
\c startrek star
drop table interpretespel;
13) borrar os datos da taboa interpreteser
delete from interpretesser;
14)busca o xeito de restaurar a estructura e datos da taboa interpretespel e os
datos da taboa interpretesser a partir das copias anteriores
pg_restore -l ze.dump
pg_restore -l zd.dump

pg_restore -d startrek -t interpretespel ze.dump
pg_restore -d startrek -t interpretesser -a zd.dump

pg_restore -d startrek -t interpretespel -a zd.dump



