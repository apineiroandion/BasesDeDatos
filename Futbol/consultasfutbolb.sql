Consultas  con mais dunha taboa :
temos dous tipos de consultas basicas :

a) Cando os datos a amosar atopanse somentes nunha das taboas.

Neste caso  usar subselects (non sempre se pode usar subselects puros).
Un subselect e unha consulta que me devolve un resultado que podo usar como referencia para facer outra consulta. 
Exemplo (progresivo):

a1) amosar  codigo do xogador nome do xogador e codigo do equipo dos xogadores do equipo 'e1';
select codx,nomx,codequ from xogador where codequ='e1';

x1  luis		e1
x5  juan		e1
x6  luis		e1
x14 federico	e1
x15 leon		e1 

a2) amosar nome do equipo que ten por codigo   'e1';
select nomequ from equipo where codequ='e1';

cuspedrinos

a3) amosar codigo do equipo que ten por nome 'cuspedrinos'
select codequ from equipo where nomequ='cuspedrinos';

e1

a4) amosar  codigo do xogador, nome do xogador, e codigo do equipo dos xogadores do equipo 'cuspedrinos';
select codx,nomx,codequ from xogador where codequ in(select codequ from equipo where nomequ='cuspedrinos');

x1  luis	e1
x5  juan	e1
x6  luis	e1
x14 federico	e1
x15 leon		e1

a5)amosar nomes dos equipos nos que hai xogadores
select nomequ from equipo where numx is not null;

cuspedrinos
croques
reboludos
gambusinos


a6) amosar nomes dos equipos nos que non hai xogadores:
select nomequ from equipo where numx is null;

novo







b) Cando os datos a amosar atopanse en varias das taboas.

Neste caso e aconsellable usar consultas cruzadas 

unha consulta cruzada e aquela que pon os nomes das taboas e as relacions necesarias que hai entre elas na clausula where 

Exemplo: 

b1)amosar  codigo do xogador, nome do xogador, e nome do equipo de todos os xogadores;
select codx,nomx,nomequ from xogador,equipo where xogador.codequ=equipo.codequ;

x1  luis		cuspedrinos
x2  juan		croques
x3  pedro	reboludos
x4  alberto	gambusinos
x5  juan	c	uspedrinos
x6  luis		cuspedrinos
x7  carlo	s	croques
x8  pedro	reboludos
x9  bent		reboludos
x10 manuel	reboludos
x11 antonio	croques
x12 eliseo	reboludos
x13 juan		gambusinos
x14 federico	cuspedrinos
x15 leon	  	cuspedrinos

nota IMPORTANTE: observar que debemos  por o nome da taboa antes do campo a seleccionar cando  un campo que se chama igual en duas taboas que forman parte da consulta , por iso na cunsulta anterior como queremos comparar o codigo do equipo da taboa xogador co codigo do equipo na taboa equipo tivemos que por : .... where xogador.codequ=equipo.codequ;

b2) amosar  codigo do xogador, nome do xogador, e nome do equipo dos xogadores do equipo 'cuspedrinos' . (Non pode facerse con subselects porque  quero amosar datos de duas taboas distintas  e  non existe nome de equipo na primeira taboa). 
select codx,nomx,nomequ from xogador,equipo where xogador.codequ=equipo.codequ and nomequ='cuspedrinos';


x1  luis	cuspedrinos
x5  juan	cuspedrinos
x6  luis	cuspedrinos
x14 federico	cuspedrinos
x15 leon	cuspedrinos

1)amosar codigos,nomes e data dos partidos que se xogaron no estadio de codigo 'es1' 

select codpar,nompar,data from partido where codest='es1'; 

p1  cuspedrinoscroques	  02.03.2010 00:00:00
p2  croquesreboludos	  02.06.2010 00:00:00
p6  croquesreboludos	  07.09.2010 00:00:00

2)amosar codigos,nomes e data dos partidos que se xogaron no estadio de nome 'playero' 
select codpar,nompar,data from partido where codest=(select codest from estadio where nomest='playero'); 

p1  cuspedrinoscroques	  02.03.2010 00:00:00
p2  croquesreboludos	  02.06.2010 00:00:00
p6  croquesreboludos	  07.09.2010 00:00:00

3)amosar codigo ,nomes, datas e nomes dos estadios onde se celebraron os partidos con data posterior ao '13/6/2010'
select codpar,nompar,data,nomest from partido,estadio where partido.codest=estadio.codest and data>'13/06/2010'; 

p6  croquesreboludos	  07.09.2010 00:00:00 playero
p5  gambusinoscuspedrinos 07.07.2010 00:00:00 plano
p7  cuspedrinoscroques	  07.10.2010 00:00:00 aereo
p4  croquesreboludos	  17.07.2010 00:00:00 aereo


4)amosar codigo ,nomes , datas e nome dos estadios   onde se celebraron os partidos con data posterior ao '13/6/2010' no estadio de nome 'aereo'.
select codpar,nompar,data,nomest from partido,estadio where partido.codest=estadio.codest and data>'13/06/2010' and nomest='aereo';
p4  croquesreboludos	  17.07.2010 00:00:00 aereo
p7  cuspedrinoscroques	  07.10.2010 00:00:00 aereo


5) cantos partidos se xogaron no estadio 'es1'
select count(*) from partido where partido.codest='es1';

3

6) cantos partidos se xogaron no estadio 'playero'
select count(*) from partido where codest in(select codest from estadio where nomest='playero');

3

7) de cantos xogadores que posuen unha letra 'a' no seu nome non se sabe o seu salario 
select count(*) from xogador where nomx like '%a%' and salario is null;

	 2

8) Amosar codigo e nome dos xogadores que posuan unha letra 'n' no seu nome ou pertencen ao equipo 'cuspedrinos'.
select codx,nomx from xogador where nomx like '%n%' or codequ in(select codequ from equipo where nomequ='cuspedrinos');
x1  luis
x2  juan
x5  juan
x6  luis
x9  bent
x10 manuel
x11 antonio
x13 juan
x14 federico
x15 leon


9) Amosar  nomes de equipo que adestraran no estadio 'es1'
select nomequ from equipo where codequ in(select codequ from adestra where codest='es1') ;
cuspedrinos
gambusinos

9) Amosar  nomes de equipo que adestraron no estadio de nome 'playero'
select nomequ from equipo where codequ in(select codequ from adestra where codest in(select codest from estadio where nomest='playero')) ;
cuspedrinos
gambusinos

10) amosar para cada codigo e nome xogador o codigo e nome dos partidos que xogou asi como con que posto xogou en cada partido  
select xogador.codx,nomx,partido.codpar,nompar,posto from xogador,xoga,partido where xoga.codx=xogador.codx and partido.codpar in(select codpar from partido where partido.codpar=xoga.codpar); 

x1  	luis		p1	     1
x3  	pedro		p1	     5
x5  	juan		p2	     1
x6 	 luis		p2	     2
x6  	luis		p1	     3
x8  	pedro		p1	     6
x9  	bent		p2	     3
x10 	manuel		p3	     1
x10 	manuel		p2	     4
x11 	antonio		p2	     6
x15 	leon		p1	     2




