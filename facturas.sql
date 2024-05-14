create table facturas (
id int primary key,
finalizada bool not null default false,
ventas_notas text,
detalles jsonb
);
