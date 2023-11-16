 
d1-c1)
amosar nomes de personaxes que teñan unha letra 'a'  e unha letra 'n' no seu nome
karnas
lian
tagana

select nomper from personaxes where nomper like '%a%n%' or nomper like '%n%a%';

d1-c1)
amosar nomes de actores  que teñan unha letra 'y'  ou unha letra 'j' no seu nome
nimoy
kelley
yuan
julia
gray
brandy

select noma from actores where noma like '%y%' or noma like '%j%';

d1-c3)
de cantos actores non se coñece a data de nacemento?
Resultado:  5

select count(*) from actores where datan is null;

d1-c3)
de cantos interpretes de series  non se coñece as horas que levan traballadas?
Resultado: 8

select count(*) from interpretesser where horas is null;

d1-c4)
cantas horas de rodaxe empregou o actor de codigo 'a1' en todas as series nas que interviu.
Resultado: 800

select sum(horas) from interpretesser where coda='a1';

d1-c4)
canto cobran de media por hora os actores de nacionalidade 'espanha' ( nota o que cobra por hora un actor e o que se denomina cachehora)
resultado: 233.333333

select avg(cachehora) from actores where nacionalidade='espanha';

d1-c5) amosar os nomes  dos naves que se usan para visitar planetas na serie de codigo 's1'
enterprise
voyager

select nomen from naves where codn in(select codn from visitas where cods='s1');

d1-c6)
amosar os nomes dos planetas da galaxia  'via_lactea'

terra
mart
xupiter
saturno
neptuno
vulcano

select nompla from planetas where galaxia='via_lactea';

d1-c6)amosar os nomes dos personaxes que teñan de graduación 'oficial'

chekov
ear
prak
tomalak
ronin
sissy
kira

select nomper from personaxes where graduacion='oficial';

d2-c0) amosar os nomes dos personaxes que estando na base de datos non están relacionados todavía con ninguna película

select nomper from personaxes where codper not in(select codper from interpretespel);

sovak
kor
ronin
devour
letek
ardor
solok
lag
kurn
comic
karnas
lian
lures
kamala
maccoy
tagana
gilora
kraal
grilka
morn
garak
nog
rom
tiron
brunt
scott
ducat
boogie
gull
quark
dax
sissy
kira


d2-c0) amosar nomes de planetas que non foron visitados:
lobar
gork
neptuno
vulcano

select nompla from planetas where codpla not in(select codpla from visitas);

d2-c3)
amosar nomes de actores que participan  polo menos unha vez nunha serie e polo menos unha vez  nunha pelicula (as duas cousas a vez)
shatner
nimoy
kelley
doohan
luis
pedro
yuan

select noma from actores where coda in(select coda from interpretesser) and coda in(select coda from interpretespel);

d2-c3) amosar nomes de personaxes que non  participan  en series nen en peliculas

select nomper from personaxes where codper not in(select codper from interpretesser) and codper not in(select codper from interpretespel);

lures
tagana
gilora
lian
solok
brunt
ducat
lag
sissy
devour
comic
kraal
letek
nog
ardor
tiron
dax
karnas
garak
rom
grilka
gull
quark
kira
morn
boogie
kamala
kurn


d2-c4)
amosar os nomes dos personaxes que son soldados e non dependen de ningun outro personaxe.
vekor
lag
kamala
garak

select nomper from personaxes where graduacion='soldado' and codper2 is null;

d2-c4) amosar os nomes dos actores que cobren 200 de cachehora dos que non se sepa a data de nacemento:

select noma from actores where cachehora=200 and datan is null;

koenig
ana

 d2-c5)
amosa o numero de  personaxes que interpreta o actor de codigo 'a18'  na serie de nome 'deep_space_nine';
resultado : 2

select count(*) from interpretesser where coda='a18' and cods in(select cods from series where titulo='deep_space_nine');

 d2-c6)
amosar nomes de naves que non  teñen lanzaderas
resultado:  speedo

select nomen from naves where codn not in(select codn from lanzaderas);

d3-c7)  NON FACER
 cantos klingon proceden de planetas visitados na serie que ten por titulo 'enterprise'
resultado: 14


d3-c8)
canto cobran de media por hora os actores tendo en conta os nulos:
192.592593

select sum(cachehora)/count(*) from actores;

d3- c10 ) NON FACER amosar codigos de lanzaderas que se usaron para visitar o planeta 'mart' na serie 'next_generation'.
n4          11
n4          10
n4           9
n4           8
n4           7
n4           6
n4           5
n4           4
n2           3
n2           2
n2           1

d3-c12)
amosar nomes de actores de series que interpreten personaxes que teñen una letra 'y' no seu nome de personaxe:

select noma from actores where coda in(select coda from interpretesser where codper in(select codper from personaxes where nomper like '%y%'));

beatriz
kelley
luis


d3-c13)DIFICIL . amosar nomes de actores que teñan polo menos unha letra ' a' ,  de series  interpretadas por  personaxes que teñen una letra 'a' no seu nome de personaxe
yuan
beatriz
veronica
gray

select noma from actores where noma like '%a%' and coda in(select coda from interpretesser where codper in(select codper from personaxes where nomper like '%a%'));

d3-c14) DIFICIL
amosar os nomes dos personaxes dos que dependen directamente soldados
word
letek
ardor
solok

select p.nomper 
from personaxes p,personaxes d 
where d.codper2=p.codper 
and d.graduacion='soldado'
group by p.nomper;















