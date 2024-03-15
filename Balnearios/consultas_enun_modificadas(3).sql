1) amosar nomes de balnearios cuxo coste diario supere os 45 euros
mostrar nombres de balnearios cuyo coste diario supere los 45 euros

banos_de_molgas
mondariz
toxa

select nomb from balnearios where costed>'45';

2)(1 subselect)  amosar nomes de pacientes que vivan na poboacion denominada 'brea'
mostrar nombres de pacientes que vivan en la población denominada 'brea'

pedro
bieito
mario

select nomp from pacientes where codp in(select codp from poboacions where nomp='brea');

3)(2 subselects) indicar os tipos de augas que estarian indicadas para os pacientes que sufren de 'ril'
indicar los tipos de aguas que estarían indicadas para los pacientes que sufren del 'ril'

bicarbonatadas
oligometalicas
sulfatadas

select tipo from augas where coda in(select coda from indicadas where codz in(select codz from zonas_corporais where nomz='ril'));


4)(group by) amosar codigos de poboacions onde viven os pacientes  e o numero de pacientes que ten cada unha desas poboacions
mostar códigos de poblaciones donde viven pacientes y el numero de pacientes que tiene cada una de esas poblaciones 

	     2
p10	     2
p7	     3
p21	     1
p4	     2
p2	     1
p8	     2
p9	     4
p5	     1

9 rows selected.

select codp,count(*) from pacientes group by codp;

5)(group by) amosar de cantos minerais se compon cada tipo de auga
mostrar de cuantos minerales se compone cada tipo de agua

sulfatadas		      1
ferruginosas		      1
bicarbonatadas		      2
sulfuradas		      4
cloradas		      1

select tipo from augas;
select count(*) from compon group by coda;

6)(1 subselect) amosar sen repeticion (distinct) os codigos de medicos que cumplan que asignaron polo menos un balneario a un paciente crónico e prescribiron polo menos un balneario a un enfermo agudo (e dicir, que si asignaron un balneario a un paciente cronico pero non prescribiron ningun a un paciente agudo, ou viceversa,  non deben aparecer no listado)

mostar sin repeticion los códigos de los médicos que cumplan que asignaron por lo menos un balneario a un enfermo agudo (es decir , que si asignaron un balneario a un paciente crónico pero no prescribieron ninguno a un paciente agudo , o viceversa , no deben aparecer en el listado)

select codme from medicos where codme in (select codme from asignan) and codme  in (select codme from prescriben) or codme in(select codme from prescriben) and codme  in(select codme from asignan); 

m4
m1
m5


7) (join) amosar  nif e nome de todos e cada un dos pacientes e ademais a poboacion onde viven
mostar nif y nombre de todos los pacientes y además la población donde viven.

362	  ana		  arteixo
3612	  elisa 	  mondariz
363	  carlos	  mondariz
3618	  iria		  lugo
3613	  mario 	  brea
3610	  bieito	  brea
364	  pedro 	  brea
369	  xoan		  davila
365	  bea		  davila
3617	  antia 	  carballo
3614	  palmira	  carballo
368	  carlos	  carballo
366	  eva		  carballo
3616	  xose		  carballino
3615	  lucia 	  carballino
361	  luis		  moimenta
3611	  carmen
367	  bea

18 rows selected.

select nif,pacientes.nomp,poboacions.nomp from pacientes left join poboacions on pacientes.codp=poboacions.codp;

8) (1 subselect ) amosar o nome do balneario  onde supostamente se atopaba  o paciente agudo  de nif 3615 o 8/7/2020
mostar el nombre del balneario donde supuestamente se encontraba el paciente agudo de nif 3615 el '8/7/2020'

arteixo

select nomb from balnearios where codb in(select codb from prescriben where nif='3615'and '8/7/2020'between dea and dsa);

9)(rara) amosar os nif de todos os pacientes se o numero de pacientes cronicos e igual  ao numero de pacientes agudos
mostar nif de todos los pacientes si el numero de pacientes crónicos es igual al número de pacientes agudos 

361
3610
3611
3612
3613
3614
3615
3616
3617
3618
362
363
364
365
366
367
368
369

18 rows selected.

select nif from pacientes where ((select count(*) from cronicos) = (select count(*) from agudos));


10) (1 subselect) amosar os nomes das poboacions que non posuan balnearios
mostar los nombres de las poblaciones que no posean balnearios

lugo
moimenta
carballo
santiago
carballino
coruna
guitiriz
ourense
cangas
vigo
bueu

11 rows selected.

select nomp from poboacions where codp not in(select codp from balnearios);

11) (1 subselect) amosar nomes de balnearios que se chamen exactamente igual que nomes de poboacions
mostar los nombres de los balnearios que se llamen exactamente igual que los nombres de las poblaciones

arnoia
arteixo
mondariz
toxa

select nomb from balnearios where codb in(select codb from poboacions where balnearios.nomb=poboacions.nomp);

12) (1 subselect) amosar nomes de pacientes distintos aos nomes de calquera medico
mostrar los nombres de pacientes distintos a los nombres de cualquier medico

ana
antia
bea
bieito
carlos
carmen
elisa
eva
iria
lucia
luis
palmira
pedro
xoan
xose

15 rows selected.

select distinct nomp from pacientes where nomp not in(select nomp from pacientes,medicos where pacientes.nomp=medicos.nomme);


13) (distinct) amosar os nomes de pacientes sen que se repitan
mostar nombres de pacientes sin que se repitan

carlos
bieito
elisa
xoan
iria
antia
mario
palmira
ana
bea
carmen
xose
lucia
luis
pedro
eva

16 rows selected.

select distinct nomp from pacientes;

14)(like) amosar os nomes de pacientes que posuan polo menos unha letra -a- e polo menos unha letra -o- no seu  nome
mostar nombres de pacientes que posean por lo menos una letra 'a' y por lo menos una letra 'o' en su nombre 

carlos
carlos
xoan
mario

select nomp from pacientes where nomp like '%a%' and nomp like '%o%';

 15) NON FACER (NOVEDADE) amosar os nomes de todos e cada un dos medicos e os  nomes dos seus xefes
mostar los nombres de todos y cada uno de los medicos y los nombres de sus jefes 

francisco	federico
rosa		federico
manuel		anabel
elena		anabel
mario		elena
anabel
federico

7 rows selected.


16) (1 subselect) amosar os nomes dos hoteis que posuan  algunha habitacion con interede
mostrar los nombres de los hoteles que posean alguna habitaion con internet

mexico
andurina
solpor
melia

select nomh from hoteis where codh in(select codh from habitacions where interede='s');


17)(1 subselect) amosar cales son os ingresos mensuais  dos pacientes cronicos
mostrar cuales son los ingresos mensuales de los pacientes crónicos 

      1000
      1200
      1300
       900
       850
      1400
      1600
      1250
      1100

9 rows selected.

select ingm from pacientes where nif in(select nif from cronicos);

18)(1 subselect) amosar os nomes dos balnearios que posuan  fisioterapeuta
mostrar los nombres de los balnearios que posean fisioterapeuta

banos_de_molgas
termas_de_cuntis
caldas_de_partovia

select nomb from balnearios where codb in(select codb from cat1 where fisioterapeuta='s');

19)NON FACER (max , moi DIFICIL) amosar o tipo de auga en que o mineral sodio existe en maior cantidade
mostar el piselect tipo from augato de agua en el cual el mineral 'sodio' existe en mayor cantidad

sulfatadas
select tipo from augas where coda in(select coda from compon where codm in(select codm from minerais where nomm = 'sodio')and mg =(select max(mg)from compon));

20)amosar os nomes dos pacientes cuxa estancia no hotel -melia- trancurriu en parte ou totalmente entres os dias  15/7/2020   e   20/7/2020 . E dicir que si un paciente aloxouse no hotel -melia- o dia 10/7/2020  e  deixou o hotel o dia 15/7/2020 , deberia aparecer neste listado pois transcurriu parte da sua estancia entres as datas referidas , ainda que so fose so un dia  . Pasaria o mesmo para un paciente que entrase neste hotel o dia 17/7/2020 e marchase o 24/7/2020. Ou o mesmo para un paciente que entrase o 11/7/2020 e saise o 15/7/2020';

mostar los nombres de los pacientes cuya estancia en el hotel 'melia' trancurrio en parte o totalmente  entre los dias 15/7/2020 y 20/7/2020 .
Es decir que si un paciente se alojo en el hotelmelia el dia 10/7/2020 y dejo el hotel el dia 15/7/2020 , deberia aparecer en este listado ( pues transcurri parte de su estancia entre las fechas referidas , aunque solo fuese un dia ). Pasar�a lo mismo para un paciente que entrase en ese hotel el dia 11/7/2020 y lo dejase el 15/7/2020 

resposta: 

ana
elisa
'



            
select nomp from pacientes where nif in(select nif from aloxan where codh in(select codh from habitacions where codh in(select codh from hoteis where nomh ='melia'))) and nif in(select nif from aloxan where de<='20/7/2020' and ds>='15/7/2020');

insert into aloxan values('361','h4',1,'14/7/2020','21/07/2020');

de <= 20/7/2020 && ds >= 15/7/2020






 


