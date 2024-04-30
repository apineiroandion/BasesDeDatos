--salir del psql \q
pg_dump -U postgres -Fp futbol2 > f2.dump --es una aplicacion externa que copia el conido de una db del usuario postgres(-U posgres) en formato de texto plano(-Fp) en(>) (nombre archivo) f2.dump
exemplo de copia de seguridad e restauracion en formato de texto plano (SQL):

11) facer a copia da base futbol2 nun nun ficheiro chamado f2.dump

12) borrar a base futbol2

13)
- crear a base,  e despois  recuperamos as tablas e datos  a partir da copia feita anteriormente

- nos conectamos a ela como usuario postgres ou userfu: 

- e comprobamos que as taboas foron restauradas  dentro do esquema fu


**************
example backup and restore in plain text (SQL) format:

11) make a copy of the futbol2 base in a file called f2.dump using the pg_dump tool

12) delete the futbol2 base

13) 
-create the base, and then we recover the tables and data from the copy made earlier

- we connect to it as user postgres or userfu

- and we check that the tables have been restored within the fu schema
