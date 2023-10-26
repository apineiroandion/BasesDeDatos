drop table if exists compon cascade;
drop table if exists conservas cascade;
drop table if exists fiambres cascade;
drop table if exists froitas cascade;
drop table if exists lacteos cascade;
drop table if exists produto cascade;
drop table if exists marca cascade;
drop table if exists carga cascade;
drop table if exists furgoneta cascade;
drop table if exists pedido cascade;
drop table if exists repartidor cascade;
drop table if exists cliente cascade;
drop table if exists zona cascade;

create table zona(
    codz varchar(2),
    nomz varchar(10),
    primary key (codz)
    );
create table cliente(
    nif varchar(9),
    nome varchar(10),
    telefono varchar(9),
    direccion varchar(15),
    movil varchar(20),
    codz varchar(2),
    primary key (nif),
    foreign key (codz) references zona(codz)
    );
create table repartidor(
    codz varchar(2),
    n integer,
    dni varchar(9),
    nomr varchar(10),
    primary key (codz,n),
    foreign key (codz) references zona (codz)
    );
create table pedido(
    codp varchar(3),
    data date,
    total integer,
    nif varchar(9),
    primary key(codp),
    foreign key(nif) references cliente (nif)
    );
create table furgoneta(
    nf integer,
    matricula varchar(10),
    capacidade integer,
    primary key(nf)
    );
create table carga(
    codp varchar(3),
    codz varchar(2),
    n integer,
    nf integer,
    data date,
    hora integer,
    primary key (codp,codz,n,nf),
    foreign key (codp) references pedido (codp),
    foreign key (codz,n) references repartidor (codz,n),
    foreign key (nf) references furgoneta (nf)
    );
create table marca(
    codm varchar (3),
    nomm varchar (10),
    primary key (codm)
    );
create table producto(
    codm varchar (3),
    n integer,
    nome varchar (10),
    prezo integer,
    primary key (codm,n),
    foreign key (codm) references marca (codm)
    );
create table lacteos(
    codm varchar (3),
    n integer,
    tc integer,
    dur integer,
    primary key (codm,n),
    foreign key (codm,n) references producto (codm,n)
    );
create table froitas(
    codm varchar (3),
    n integer,
    orixe varchar (10),
    primary key (codm,n),
    foreign key (codm,n) references producto (codm,n)
    );
create table fiambres(
    codm varchar (3),
    n integer,
    granxa integer,
    sal integer,
    primary key (codm,n),
    foreign key (codm,n) references producto (codm,n)
    );
create table conservas(
    codm varchar (3),
    n integer,
    peso integer,
    primary key (codm,n),
    foreign key (codm,n) references producto (codm,n)
    );
create table compon(
    codp varchar (3),
    codm varchar (3),
    n integer,
    cantidade integer,
    primary key (codp,codm,n),
    foreign key (codp) references pedido (codp),
    foreign key (codm,n) references producto (codm,n)
    );   
