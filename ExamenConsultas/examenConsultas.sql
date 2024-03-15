1)
select count(*) from museos;
2)
select noma from achados where datacion>'14000';
3)
select noma from achados where noma like '%e%' and noma like '%o%';
4)
select count(*) from achados where codd is null;
5)
select nommu from museos where codpa in(select codpa from pais where nompa='alemania');
6)
select count(*) from achados where codpa in(select codpa from pais where nompa = 'exipto');
7)
select noma from achados where coda in(select coda from non_estructuras);
8)
select codpa,count(*) from achados group by codpa;
9)
select nomd,count(achados.*) from descubridores,achados where descubridores.codd=achados.codd group by nomd;
10)
select noma,nompa from achados left join pais on achados.codpa=pais.codpa;
