set datestyle = "ISO, DMY";
set datestyle to DMY, SQL;
show datestyle;

drop table if exists compon cascade ;
drop table if exists conservas cascade ;
drop table if exists fiambres cascade ;
drop table if exists froitas cascade ;
drop table if exists lacteos  cascade ;
drop table if exists  produto  cascade ;
drop table if exists marca  cascade ;
drop table if exists carga  cascade ;
drop table if exists furgoneta  cascade ;
drop table if exists pedido  cascade ;
drop table if exists repartidor  cascade ;
drop table if exists cliente  cascade ;
drop table if exists zona  cascade ;



create table zona   (
codz varchar(2),
nomz varchar(10),
primary key(codz)
);

insert into zona values ('z1','centro');
insert into zona values ('z2','radio1');
insert into zona values ('z3','radio2');
insert into zona values ('z4','radio3');

create table   cliente(
nif varchar(9),
nome  varchar(10),
telefono varchar(9),
direcion varchar(15),
email varchar(20),
codz varchar(2),
primary key(nif),
foreign key (codz) references zona (codz)
);

insert into cliente values ('361a','ana','986111111','r/xouba','anax@hotmail.com','z1');
insert into cliente values ('362b','pedro','986222222','r/coruxo','pedroc@gmail.com','z1');
insert into cliente values ('363c','carlos','986333333','r/coruxo','carlosc@hotmail.com',null);
insert into cliente values ('364d','borja','986444444','r/palometa','borjap@gmail.com','z2');
insert into cliente values ('365e','pedro','986555555','r/coruxo','pedroc@hotmail.com',null);
insert into cliente values ('366f','eva','986666666','r/bacalao','evab@gmail.com','z2');
insert into cliente values ('367g','luis','986777777','r/lenguado','luis@yahoo.com','z3');
insert into cliente values ('368h','carlos','986888888','r/rodaballo','carlosr@gmail.com','z1');


create table repartidor  (
codz varchar(2),
n integer,
dni varchar(9),
nomr varchar(10),
primary key(codz,n),
foreign key (codz) references zona(codz)
);

insert into repartidor  values ('z1',1,'369i','celia');
insert into repartidor  values ('z1',2,'3610j','jose');
insert into repartidor  values ('z2',1,'3611k','felipe');
insert into repartidor  values ('z3',1,'3612l','daniel');
insert into repartidor  values ('z1',3,'3655y','eligio');

create table pedido (
codp varchar(3),
data date,
total integer,
nif varchar(9),
primary key(codp),
foreign key (nif) references cliente(nif)
);

insert into pedido  values ('p1','7/7/2020',15,'368h');
insert into pedido  values ('p2','7/7/2020',60,'361a');
insert into pedido  values ('p3','7/7/2020',29,'362b');
insert into pedido  values ('p4','7/7/2020',31,'363c');
insert into pedido  values ('p5','9/7/2020',22,'361a');
insert into pedido  values ('p6','9/7/2020',18,'364d');
insert into pedido  values ('p7','9/7/2020',8,'362b');
insert into pedido  values ('p8','9/7/2020',32,'363c');
insert into pedido  values ('p9','9/7/2020',26,'368h');
insert into pedido  values ('p10','12/7/2020',81,'361a');
insert into pedido  values ('p11','12/7/2020',16,'366f');
insert into pedido  values ('p12','12/7/2020',8,'368h');
insert into pedido  values ('p13','12/7/2020',47,'366f');
insert into pedido  values ('p14','12/7/2020',22,'367g');
insert into pedido  values ('p15','13/7/2020',null,'361a');
insert into pedido  values ('p16','13/7/2020',22,'362b');
insert into pedido  values ('p17','13/7/2020',4,'368h');


create table  furgoneta  (
nf integer,
matricula varchar(10),
capacidade integer,
primary key(nf)
);

insert into furgoneta  values ( 1,'ab121',500 );
insert into furgoneta  values ( 2,'ab122',350 );
insert into furgoneta  values ( 3,'ab123',400 );
insert into furgoneta  values ( 4,'ab124',600 );


create table  carga (
codp varchar(3),
codz varchar(2),
n integer,
nf integer,
data date,
hora integer,
primary key(codp,codz,n,nf),
foreign key (codp) references pedido (codp),
foreign key (codz,n) references repartidor (codz,n),
foreign key (nf) references furgoneta(nf)
);

insert into carga  values ('p1','z1',2,1,'7/7/2020',10 );
insert into carga  values ('p2','z1',1,1,'7/7/2020',10 );
insert into carga  values ('p3','z1',2,1,'7/7/2020',11 );
insert into carga  values ('p4','z1',1,1,'7/7/2020',12 );
insert into carga  values ('p5','z1',2,2,'9/7/2020',10 );
insert into carga  values ('p6','z1',1,2,'9/7/2020',11);
insert into carga  values ('p7','z1',2,2,'9/7/2020',10 );
insert into carga  values ('p8','z1',1,2,'9/7/2020',11 );
insert into carga  values ('p9','z1',2,1,'9/7/2020',12 );
insert into carga  values ('p10','z1',2,1,'12/7/2020',10 );
insert into carga  values ('p11','z1',2,1,'12/7/2020',11 );
insert into carga  values ('p12','z1',1,2,'12/7/2020',10 );
insert into carga  values ('p14','z3',1,2,'12/7/2020',10 );
insert into carga  values ('p15','z1',1,2,'13/7/2020',10 );


create table  marca (
codm varchar(3),
nomm varchar(10),
primary key(codm)
);
insert into marca values ('m1','katia');
insert into marca values ('m2','larsa');
insert into marca values ('m3','alfageme');
insert into marca values ('m4','pozo');
insert into marca values ('m5','miau');
insert into marca values ('m6','argal');





create table  produto (
codm varchar(3),
n integer,
nome varchar(10),
prezo integer,
primary key(codm,n),
foreign key (codm) references marca(codm)
);

insert into produto values ('m1',1 ,'platano',2 );
insert into produto values ('m1',2 ,'maza',1 );
insert into produto values ('m1',3 ,'pera',2 );
insert into produto values ('m1',4 ,'laranxa',2);
insert into produto values ('m1',5 ,'kiwi',2);
insert into produto values ('m2',1 ,'enteira', 1);
insert into produto values ('m2',2 ,'desnatada', 1);
insert into produto values ('m2',3 ,'semi', 1);
insert into produto values ('m2',4 ,'iogurnat', 2);
insert into produto values ('m2',5 ,'iogurmues', 3);
insert into produto values ('m3',1 ,'sardinha',3 );
insert into produto values ('m3',2 ,'bonito',2 );
insert into produto values ('m3',3 ,'mexillon',2 );
insert into produto values ('m3',4 ,'choco',3 );
insert into produto values ('m4',1 ,'chourizo',6 );
insert into produto values ('m4',2 ,'xamon',12 );
insert into produto values ('m5',1 ,'sardinha',4);
insert into produto values ('m5',2 ,'bonito',3 );
insert into produto values ('m5',3 ,'mexillon',3 );
insert into produto values ('m6',1 ,'chourizo',5 );
insert into produto values ('m6',2 ,'xamon',10 );
insert into produto values ('m6',3 ,'mortadela',6);
insert into produto values ('m6',4 ,'sardinha',5);
insert into produto values ('m6',5 ,'polvo',7);
insert into produto values ('m6',6 ,'berberecho',6);


create table  lacteos (
codm varchar(3),
n integer,
tc integer,
dur integer,
primary key(codm,n),
foreign key (codm,n) references produto (codm,n)
);
insert into lacteos values ('m2',1 ,20 , 100);
insert into lacteos values ('m2',2 ,19 , 100);
insert into lacteos values ('m2',3 ,20 , 100);
insert into lacteos values ('m2',4 ,10, 9);
insert into lacteos values ('m2',5 ,10 , 8);


create table froitas  (
codm varchar(3),
n integer,
orixe varchar(10),
primary key(codm,n),
foreign key (codm,n) references produto (codm,n)
);
insert into froitas values ('m1',1 ,'tenerife');
insert into froitas values ('m1',2 ,'murcia');
insert into froitas values ('m1',3 ,'pontevedra');
insert into froitas values ('m1',4 ,'valencia');



create table   fiambres(
codm varchar(3),
n integer,
graxa integer,
sal integer,
primary key(codm,n),
foreign key (codm,n) references produto (codm,n)
);
insert into fiambres values ('m4',1 , 3,2 );
insert into fiambres values ('m4',2 , 2,3 );
insert into fiambres values ('m6',1 ,4 ,5 );
insert into fiambres values ('m6',2 , 5, 3);
insert into fiambres values ('m6',3 ,4 , 3);


create table  conservas (
codm varchar(3),
n integer,
peso integer,
primary key(codm,n),
foreign key (codm,n) references produto (codm,n)
);

insert into conservas values ('m3',1 , 2);
insert into conservas values ('m3',2 , 3);
insert into conservas values ('m3',3 , 2);
insert into conservas values ('m3',4 , 3);
insert into conservas values ('m5',1 , 4);
insert into conservas values ('m5',2 , 3);
insert into conservas values ('m5',3 , 2);
insert into conservas values ('m6',4 , 2);
insert into conservas values ('m6',5 , 3);
insert into conservas values ('m6',6 , 2);



create table compon  (
codp varchar(3),
codm varchar(3),
n integer,
cantidade integer,
primary key(codp,codm,n),
foreign key (codp) references pedido(codp),
foreign key (codm,n) references  produto(codm,n)
);

insert into compon values ('p1','m1',1,2 );
insert into compon values ('p1','m1',2,3 );
insert into compon values ('p1','m2',1,4 );
insert into compon values ('p1','m3',2,2 );
insert into compon values ('p2','m4',1,1 );
insert into compon values ('p2','m1',1,3 );
insert into compon values ('p2','m4',2,4 );
insert into compon values ('p3','m3',1,3 );
insert into compon values ('p3','m5',1,5 );
insert into compon values ('p4','m5',2,2 );
insert into compon values ('p4','m3',3,5 );
insert into compon values ('p4','m3',4,5 );
insert into compon values ('p5','m3',4,6 );
insert into compon values ('p5','m2',2,4 );
insert into compon values ('p6','m4',1,3 );
insert into compon values ('p7','m3',3,3 );
insert into compon values ('p7','m2',2,2 );
insert into compon values ('p8','m4',2,2 );
insert into compon values ('p8','m1',4,2 );
insert into compon values ('p8','m5',1,1 );
insert into compon values ('p9','m3',3,4 );
insert into compon values ('p9','m2',1,3 );
insert into compon values ('p9','m5',3,5 );
insert into compon values ('p10','m4',2,6 );
insert into compon values ('p10','m3',3,3 );
insert into compon values ('p10','m2',2,3 );
insert into compon values ('p11','m5',2,2 );
insert into compon values ('p11','m4',1,1 );
insert into compon values ('p12','m3',3,3 );
insert into compon values ('p12','m2',2,2 );
insert into compon values ('p13','m2',1,1 );
insert into compon values ('p13','m4',2,2 );
insert into compon values ('p13','m3',3,3 );
insert into compon values ('p13','m5',1,4 );
insert into compon values ('p14','m1',3,3 );
insert into compon values ('p14','m3',1,2 );
insert into compon values ('p14','m4',1,1 );
insert into compon values ('p14','m3',2,2 );
insert into compon values ('p16','m1',3,3 );
insert into compon values ('p16','m2',2,4 );
insert into compon values ('p16','m5',1,3 );
insert into compon values ('p17','m5',1,1 );




