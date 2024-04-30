drop table if exists mensaje cascade;
drop table if exists conversacion cascade;
drop table if exists usuario cascade;

create table usuario(
    idu serial primary key,
    userName varchar(12),
    firstName varchar(22),
    surname varchar(50),
    password varchar(20)
);

create table conversacion(
    idc serial primary key,
    idu1 int,
    idu2 int,
    foreign key (idu1) references usuario(idu),
    foreign key (idu2) references usuario(idu)
);

create table mensaje(
    idm serial primary key,
    idc int,
    idu int,
    foreign key (idc) references conversacion(idc),
    foreign key (idu) references usuario(idu)
);
