1)amosar  codigo e nome de xogador e codigo e  nome do equipo no que esta
select nomx,codx,xogador.codequ,nomequ from xogador,equipo where xogador.codequ=equipo.codequ;
2)amosar  codigo e nome de xogador e codigo e  nome do equipo no que esta, se hai xogadores sen equipo asignado debe amosar igualmente o seu codigo e nome de xogador 
select nomx,codx,xogador.codequ,nomequ from xogador,equipo where xogador.codequ=equipo.codequ or xogador.codequ is null;
3)amosar  codigo e nome de xogador e codigo e  nome do equipo no que esta, se hai equipos sen xogadores asignados  debe amosarse igualmente o codigo e o nome do equipo
select equipo.codequ,nomequ,codx,nomx 
from equipo left join xogador 
on xogador.codequ=equipo.codequ or equipo.codequ is null;
4)amosar  codigo e nome de xogador e codigo e  nome do equipo no que esta, se hai xogadores sen equipos asignados ou equipos  sen xogadores asignados  debe amosarse igualmente o codigo e o nome de distos xogadores e o codigo e nome de ditos equipos 
select equipo.codequ,nomequ,codx,nomx 
from equipo left join xogador 
on xogador.codequ=equipo.codequ or equipo.codequ is null or xogador.codequ is null;
5) amosara cantos xogadores ten cada equipo ( amosar codigo de equipo e numero de xogadores) 
select codequ,count(*) from xogador group by codequ;
6) amosar para cada nome de equipo cantos xogadores ten
select equipo.nomequ,count(*) from xogador 
right join equipo 
on xogador.codequ=equipo.codequ group by nomequ;
     //otra forma de hacerlo:
select nomequ,numx from equipo;
7) amosar para cada nome de equipo cantos xogadores ten . se non ten xogadores debe amosarse un cero para o numero de xogadores de dito equipo 
select nomequ,numx from equipo;
update equipo set numx=0 where numx is null;
8) amosar cantos partidos se celebran en cada estadio ( amosar codigo de estadio e numero de partidos celebradosnel )
select estadio.codest,count(*) from partido,estadio where partido.codest=estadio.codest group by estadio.codest;
9) amosar para cada nome de estadio  cantos cantos partidos se celebran nel
select estadio.nomest,count(*) from partido,estadio where partido.codest=estadio.codest group by estadio.codest;
10) amosar para cada nome de estadio  cantos cantos partidos se celebran nel . Se non se celebrou nengun partido en algun estadio debe amosarse un cero para o numero de partidos celebrados en dito estadio.
select estadio.nomest,count(*) 
from partido,estadio 
where partido.codest=estadio.codest 
group by estadio.nomest;

select nomest,count(*) from estadio
right join partido
on partido.codest=estadio.codest
group by nomest;

select nomest,count(partido.*) 
from estadio,partido
where partido.codest=estadio.codest
group by estadio.codest;
