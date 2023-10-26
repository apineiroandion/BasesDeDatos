DROP TABLE IF EXISTS MASCOTAS;
DROP TABLE IF EXISTS PERSOAS;
CREATE TABLE PERSOAS(
    DNI VARCHAR(9),
    NOME VARCHAR(15),
    AP1 VARCHAR(15),
    AP2 VARCHAR(9),
    TELF INTEGER,
    PRIMARY KEY(DNI)
);
CREATE TABLE MASCOTAS(
    CODM VARCHAR(3),
    NOMM VARCHAR(20),
    TIPO VARCHAR(10),
    EDADE INTEGER,
    DNI VARCHAR(9),
    PRIMARY KEY(CODM),
    FOREIGN KEY(DNI) REFERENCES PERSOAS(DNI)
);
insert into persoas values('36111111h','luis','perez','gonzalez',987987987);
insert into persoas values('36222222w','ana','perez','suarez',986222222);
insert into persoas values('36333333p','eva','suarez','suarez',986333333);

insert into mascotas values('m01','benita','gato',9,'36111111h');
insert into mascotas values('m02','kor','can',3,'36111111h');
insert into mascotas values('m03','luz','gato',2,'36222222w');
insert into mascotas values('m04','kir','gato',4,null);

