
set datestyle = "ISO, DMY";
set datestyle to DMY, SQL;
show datestyle;

drop table if exists pais cascade ;
drop table if exists descubridores  cascade;
drop table if exists achados  cascade;
drop table if exists estructuras  cascade;
drop table if exists non_estructuras  cascade;
drop table if exists materiais  cascade;
drop table if exists compon cascade;
drop table if exists museos  cascade;
drop table if exists gardan  cascade;
drop table if exists visitantes  cascade;
drop table if exists visitan  cascade;



create table pais (
codpa varchar(4),
nompa varchar(13),
primary key (codpa)
);
insert into pais values('pa0','austria');
insert into pais values('pa1','mexico');
insert into pais values('pa2','exipto');
insert into pais values('pa3','grecia');
insert into pais values('pa4','turquia');
insert into pais values('pa5','malta');
insert into pais values('pa6','camboya');
insert into pais values('pa7','colombia');
insert into pais values('pa8','inglaterra');
insert into pais values('pa9','alemania');
insert into pais values ('pa10','portugal');

create table descubridores (
codd varchar(3),
nomd varchar(25),
especialidade varchar(20),
primary key (codd)
);
insert into descubridores values ('d0','luis breckt','arqueologo');
insert into descubridores values ('d1','pierre-francois bouchard','arqueologo');
insert into descubridores values ('d2','howard carter','egiptologo');
insert into descubridores values ('d3','otto volzing','arqueologo');
insert into descubridores values ('d4','josef szombathy','arqueologo');




create table achados (
coda varchar(3),
noma varchar(30),
datacion integer,
estado varchar(10),
codd varchar(3),
codpa varchar(4),
primary key (coda),
foreign key (codd) references descubridores(codd),
foreign key (codpa) references pais(codpa)
);


insert into achados values ('a1','gobekli tepe',12000,'medio',null,'pa4');
insert into achados values ('a2','templos de angkor',0000,'bo',null,'pa6');
insert into achados values ('a3','hipogeum',null,'bo',null,'pa5');
insert into achados values ('a4','tumba de nefertiti',0000,'bo',null,'pa2');
insert into achados values('a5','balsa muisca',null,'bo',null,'pa7');
insert into achados values('a6','busto de nefertiti',0000,'bo',null,'pa2');
insert into achados values('a7','piedra del sol',642,'bo',null ,'pa1');
insert into achados values('a8','dama durminte',0000,'bo',null,'pa5');
insert into achados values('a9','mascara de tutankamon',0000,'bo','d2','pa2');
insert into achados values('a10','ser leon de Hadel',32000,'bo','d3','pa9');
insert into achados values('a11','venus de willendorf',25000,'bo','d4','pa0');
insert into achados values('a12','pedra de rosseta',0000,'medio','d1','pa2');
insert into achados values('a13','cabeza nur',0000,'medio','d1',null);

create table estructuras (
coda varchar(3),
superficie integer,
coda2 varchar(3),
primary key (coda),
foreign key (coda) references achados(coda),
foreign key (coda2) references estructuras(coda)
);
insert into estructuras values ('a1',10500,null);
insert into estructuras values ('a2',110000,null);
insert into estructuras values ('a3',1200,null);
insert into estructuras values ('a4',150,null);




create table non_estructuras (
coda varchar(3),
gravuras varchar(1),
primary key (coda),
foreign key (coda) references achados(coda)
);

insert into non_estructuras values('a5','s');
insert into non_estructuras values('a6','n');
insert into non_estructuras values('a7','s');
insert into non_estructuras values('a8','n');
insert into non_estructuras values('a9','n');
insert into non_estructuras values('a10','s');
insert into non_estructuras values('a11','n');
insert into non_estructuras values('a12','s');


create table materiais (
codm varchar(3),
nomm varchar(15),
primary key (codm)
);

insert into materiais values('m1','arxila');
insert into materiais values('m2','madeira');
insert into materiais values('m3','vidrio');
insert into materiais values('m4','lapislazuli');
insert into materiais values('m5','ouro');
insert into materiais values('m6','prata');
insert into materiais values('m7','ferro');
insert into materiais values('m8','obsidiana');
insert into materiais values('m10','marfil');
insert into materiais values('m11','caliza');
insert into materiais values('m12','estuco');
insert into materiais values('m13','basalto');
insert into materiais values('m14','granito');

create table compon (
coda varchar(3),
codm varchar(3),
peso integer,
primary key (coda,codm),
foreign key (coda) references non_estructuras(coda),
foreign key (codm) references materiais(codm)
);
insert into compon values('a5','m5',12); 
insert into compon values('a6','m11',1);
insert into compon values('a6','m12',1);
insert into compon values('a7','m13',24000);
insert into compon values('a8', 'm1',null);
insert into compon values('a9', 'm3',null);
insert into compon values('a9', 'm4',1);
insert into compon values('a9', 'm8',null);
insert into compon values('a9', 'm5',11);
insert into compon values('a10','m10',null) ;
insert into compon values('a11', 'm11',null);
insert into compon values('a12', 'm11',548);

create table museos (
codmu varchar(3),
nommu varchar(40),
codpa varchar(4),
codmu2 varchar(3),
primary key (codmu),
foreign key (codpa) references pais(codpa),
foreign key (codmu2) references museos(codmu)
);
insert into museos values ('m0','louvre','pa7',null);
insert into museos values ('m6','museo exipcio de el cairo ','pa2',null);
insert into museos values ('m1','museo do ouro' , 'pa7',null);
insert into museos values ('m3','museo nacional de antropoloxia' , 'pa1',null);
insert into museos values ('m2','museo arqueoloxico de valleta' , 'pa5',null);
insert into museos values ('m4','museo exipcio de berlin ','pa9','m6');
insert into museos values ('m5','museo de historia natural de viena ','pa0',null);
insert into museos values ('m7','museo ulm','pa9',null);
insert into museos values ('m8','museo britanico de londres','pa8',null);


create table gardan  (
coda varchar(3),
codmu varchar(3),
datae date,
datas date,
primary key (coda,codmu,datae),
foreign key (coda) references non_estructuras(coda),
foreign key (codmu) references museos(codmu)
);
insert into gardan values ('a5','m1', '7/2/1965', null);
insert into gardan values ('a6','m4', '7/2/1955', null);
insert into gardan values ('a7','m3', '17/2/1975', null);
insert into gardan values ('a8','m2', '25/4/1999', null);
insert into gardan values ('a9','m6', '14/11/1988', null);
insert into gardan values ('a10','m7', '4/12/1980', null);
insert into gardan values ('a11','m5', '2/6/1975', null);
insert into gardan values ('a12','m8', '2/6/1802', null);

create table visitantes (
codpa varchar(4),
n integer,
nomv varchar(20),
primary key (codpa,n),
foreign key (codpa) references pais(codpa)
);



insert into visitantes values ('pa10',1,'luis');
insert into visitantes values ('pa10',2,'ana');
insert into visitantes values ('pa10',3,'silvia');
insert into visitantes values ('pa1',1,'juan');
insert into visitantes values ('pa1',2,'pedro');
insert into visitantes values ('pa0',1,'beatriz');
insert into visitantes values ('pa0',2,'carlos');
insert into visitantes values ('pa0',3,'manuel');
insert into visitantes values ('pa2',1,'nuria');
insert into visitantes values ('pa2',2,'amanda');
insert into visitantes values ('pa2',3,'lua');
insert into visitantes values ('pa2',4,'jose');
insert into visitantes values ('pa3',1,'benito');
insert into visitantes values ('pa3',2,'josefa');
insert into visitantes values ('pa4',1,'altea');

create table visitan (
codpa varchar(4),
n integer,
codmu varchar(3),
datavi date,
prezo integer,
primary key (codpa,n,codmu,datavi),
foreign key (codpa,n) references visitantes(codpa,n),
foreign key (codmu) references museos(codmu)
);

insert into visitan values ('pa10',1,'m1','7/3/2016', 10);
insert into visitan values ('pa10',1,'m2','6/5/2016', 5);
insert into visitan values ('pa10',2,'m1','4/3/2017', 5);
insert into visitan values ('pa1',1,'m1','15/12/2018', 20);
insert into visitan values ('pa1',1,'m4','21/8/2019', 5);
insert into visitan values ('pa0',1,'m1','17/9/2019', 5);
insert into visitan values ('pa10',1,'m1','12/4/2018', 5);
insert into visitan values ('pa0',2,'m1','3/7/2016', 20);
insert into visitan values ('pa2',1,'m1','19/10/2015', 15);
insert into visitan values ('pa0',2,'m1','25/9/2014', 20);
insert into visitan values ('pa3',1,'m6','24/11/2012', 15);
insert into visitan values ('pa0',3,'m6','11/8/2011', 15);
insert into visitan values ('pa1',1,'m6','8/7/2014', 5);
insert into visitan values ('pa3',1,'m4','13/1/2010', 5);
insert into visitan values ('pa2',1,'m6','9/3/2020', 5);

