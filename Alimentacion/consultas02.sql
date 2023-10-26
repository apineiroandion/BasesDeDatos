select * from produto where prezo>5;
select * from produto where prezo<5;
select * from produto where prezo=5;
select * from produto where prezo>=5;
select * from produto where prezo>=5 and prezo<=9;
select * from produto where prezo between 4 and 10;
select * from produto where codm='m6' and prezo between 4 and 10;
select avg(prezo) from produto where codm='m6';
select codm, avg(prezo) from produto group by codm;
select codm, avg(prezo) from produto group by codm order by codm;
select codm, avg(prezo) from produto group by codm order by avg;
select codm, count(*) from produto group by codm;
select codm, count(*) from produto group by codm order by codm;
select * from zona;
select * from cliente;
select codz, count(*) from cliente group by codz order by codz;
select nif,nome,codz from cliente;
select nif,nome,codz from cliente where codz='z1';
select * from zona;
select codz from zona where nomz='centro';
select nif,nome,codz from cliente where codz=(select codz from zona where nomz='centro');

31)Amosa o codigo de pedido e data dos que fixo o cliente 368h
select codp,data from pedido where nif=(select nif from cliente where email='carlosr@gmail.com');

32)dni e nome dos reparetidores da zona centro
select dni,nomr from repartidor where codz=(select codz from zona where nomz='centro'); 

33)nombre y precio de los productos de la marca argal
select nome,prezo from produto where codm=(select codm from marca where nomm='argal');

34)media de precio dosproductos da marca argal
select avg(prezo) from produto where codm=(select codm from marca where nomm='argal');

35)amosar codigos dos pedidos cargados na furgoneta de matricula ab121
select codp from carga where nf=(select nf from furgoneta where matricula='ab121');

36)codp delospedidos de los clientes delazona centro
select codp from pedido where nif in (select nif from cliente where codz in(select codz from zona where nomz ='centro'));

37)amosar numero da furgo onde se cargaron poedidos de clientes da zona centro
select nf from carga where codp in (select codp from pedido where nif in (select nif from cliente where codz in(select codz from zona where nomz ='centro')));

40)Amosar nome de cada producto e codigo da sua marca
select nome,codm from produto;

41)Amosar nome de cada producto e nome da sua marca
select nome,nomm from produto,marca where produto.codm=marca.codm;

42)nome do cliente e nome da zona onde vive
select nome,nomz from cliente,zona where cliente.codz=zona.codz;

43)nome do repartidor e nome da zona en que reparte
select nomr,nomz from repartidor,zona where repartidor.codz=zona.codz;

44)amosar codigo de cada pedido e matricula da furgoneta onde se carga
select codp,matricula from carga,furgoneta where carga.nf=furgoneta.nf;

45)amosar nome e orixe de cada froita
select nome,orixe from produto,froitas where produto.codm=froitas.codm and produto.n=froitas.n;

46)mostrar codigos de cada pedido cargado, e nome do rpartidor que o cargou
select codp,nomr from carga,repartidor where carga.codz=repartidor.codz and carga.n=repartidor.n;

47)amosar codigo dos pedidos e o nome dos productos que compñonen
select codp,nome from compon,produto where produto.codm=compon.codm and produto.n=compon.n;

48)amosar para cada pedido que se compon de productos , de cantos productos se compon (group by)
select codp,count(*) from compon group by codp order by count(*);
select codp,count(*) from compon group by codp order by codp;

select substr('olaquetal',2,3);

//('string',posicion,cuantasposiciones)

select substr(codp,2) from pedido;
select substr('p10',2);
select cast(substr('p10',2) as int);
select codp,count(*) from compon group by codp order by cast(substr(codp,2) as int);

49)amosar nif e nome de cada cliente e nome da zona onde vive
select nif,nome,nomz 
from cliente,zona 
where cliente.codz=zona.codz;

50)amosar nif e nome de todos os cliente e nome da zona onde viven
select nif,nome,nomz 
from cliente left join zona 
on cliente.codz=zona.codz;

//left join // right join // full join 























