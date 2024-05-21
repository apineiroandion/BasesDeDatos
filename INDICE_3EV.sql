crear: bases, usuarios, esquemas, vistas, tablas, roles (de privilexios, de usuarios)
privilexios para todo o anterior
privilexios sobre obxectos a nivel de table y de coluna: ACL (acces control list)
    a nivel de tabla: insert, delte, update, select
    a nivel de columna: select. update
    con posibilidade de darllo a outros : with grant option
privilexios a nivel fila: RLS (ropw level security)
    permisivas
    restrictivas
diccionario de datos:
    comandos abreviados
    vistas
    vistas con informacion del sistema
copias de seguridad e restauracion:
    pg_dump
    pg_restore
transacciones:
begin;
insert, updates ...
commit;/ rollback;

    
    
APUNTES:
\dp y \dp+ -- Son lo mismo muestran los priviliegios
\dn -- muestra tablas y propietarios
\dn+ -- muestra tablas, propietarios y privilegios

1) escribe quen lanzou o comando e que comando foi lanzado para que apareza o que se ve marcado en negrita na imaxen superior:

=C/userfu

userfu lanzo: "grant create on schema fu to public"
--es a public porque no hay nadie a la izquierda del igual, entonces es a public.
-- no se especifica lo que tiene que crear porque lo unico que puede crear son tables.

--QUITAR DICHO PERMISO...--

revoke create on schema fu from public
------                     ----

--Volver a dar a todos los usuarios sobre el schema fu ca posibilidade de administralo--

grant create on schema fu to ...... with grant option; --Hay que darselo a un rol, no a un usuario

\du --ver usuarios

grant create on schema fu to u4 with grant option;


---------------------------------------------------------------------

u3=Cc/postgres

grant create, connect on database dam to u3;

revoke create, connect on database dam from u3;

grant create on database dam to u3 with grant option; --hay que dar la opciond e administrar por separado para que no le de a los dos a la vez

--u3 debe dar permiso a u4 para creae equemas esobre la base

\c futbol2 u3
grant create on database dam to u4;

-- nos conectamos a dam

\dn 
\dp es3.*

u4=r/u3

u3 dio a u4 el privilegio read(select)

grant select(nomx) on es3.xogador to u4; 

-- tam,bien se pueden poner varias:

grant select(nomx, codx) on es3.xogador to u4; 

revoke select(nomx, codx) on es3.xogador from u4; 

grant insert(nomx, codx) on es3.xogador to u4; 

revoke insert(codx) on es3.xogador from u4; 



















