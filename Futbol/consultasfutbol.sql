1) amosar todos os datos de todos os xogadores 
select * from xogador;
2) amosar codigo, nome e salario de todos os xogadores
select codx,nomx,salario from xogador;
3) amosar codigo, nome e salario dos xogadores que cobren mais de 1000
select codx,nomx,salario from xogador where salario>1000;
4) amosar codigo, nome e salario dos xogadores que cobren 1000 ou mais
select codx,nomx,salario from xogador where salario>=1000;
5) amosar codigo, nome e salario dos xogadores que cobren entre 1000 e 1350 ambolos sous valores incluidos 
select codx,nomx,salario from xogador where salario>=1000 and salario<=1350;
6) amosar codigo, nome e salario dos xogadores do equipo 'e1' que cobren entre 1000 e 1350 ambolos dous valores incluidos 
select codx,nomx,salario from xogador where salario>=1000 and salario<=1350 and codequ='e1';
7) amosar codigo, nome e salario dos xogadores do equipo 'e1'
select codx,nomx,salario from xogador where codequ='e1';
Algunhas funcions  de agregacion: sum, avg, count 

8) amosar a suma dos salarios de todos os xogadores
select sum(salario) from xogador;
9)amosar a suma dos salarios dos xogadores do equipo 'e2'
select sum(salario) from xogador where codequ='e2';
10)amosar a suma dos salarios dos xogadores do equipo 'e1'
select sum(salario) from xogador where codequ='e1';
11) amosar o valor medio dos salario de todos os xogadores
select avg(salario) from xogador;
12)amosar o valor medio dos salarios dos xogadores do equipo 'e2'
select avg(salario) from xogador where codequ='e2';
13)amosar o valor medio dos salarios dos xogadores do equipo 'e1'
select avg(salario) from xogador where codequ='e1';
14) amosar cantos xogadores hai 
select count(*) from xogador;
15) amosar cantos xogadores hai no equipo 'e2'
select count(*) from xogador where codequ='e2';
16) amosar cantos xogadores hai no equipo 'e1'
select count(*) from xogador where codequ='e1';
17)amosar o valor medio dos salarios dos xogadores do equipo 'e2' sen usar avg (usando sum e count)
select sum(salario)/count(*) from xogador where codequ='e2';
18)amosar o valor medio dos salarios dos xogadores do equipo 'e1' sen usar avg (usando sum e count)
select sum(salario)/count(*) from xogador where codequ='e1';



consultas con nulos 

19) amosar codigo e  nome dos xogadores con salario nulo
select codx,nomx from xogador where salario is null;
20) amosar codigo e nome dos xogadores con salario ( ou o que  o mesmo : con salario non nulo)
select codx,nomx from xogador where salario is not null;
21) amosar o valor medio dos salarios dos xogadores do equipo 'e2' tendo en conta os salarios nulos 
select sum(salario)/count(*) from xogador where codequ='e2';
22) amosar o valor medio dos salarios dos xogadores do equipo 'e1' tendo en conta os salarios nulos 
select sum(salario)/count(*) from xogador where codequ='e1';
23) amosar o valor medio dos salarios de todos os xogadores tendo en conta os salarios nulos 
select sum(salario)/count(*) from xogador;























