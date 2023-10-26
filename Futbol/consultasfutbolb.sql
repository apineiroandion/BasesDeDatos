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



