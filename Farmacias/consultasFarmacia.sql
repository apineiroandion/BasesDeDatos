c1 )código e nome dos compoñentes do medicamento denominado 'flumil';
select codc,nomc from componentes where codc in(select codc from componen where codm in(select codm from medicamentos where nomm='flumil'));
c2) amosar nomes de ciddes onde traballan as persoas de nome 'antia'
select nomc from cidades where codc in(
    select codc from farmacias where codf in(
            select codf from traballan where dnip in(
                select dnip from persoas where nomp='antia'
        )
    )
);
c3)amosar nomes dos compoñentes dos medicamentos cuxo nome de medicamento comeze por 'o'.
select nomm from medicamentos where nomm like 'o%';
c4)amosar nomes de persoas que traballen.
select nomp from persoas where dnip in(select dnip from traballan);
c5)amodar dnis e nomes de persoas e nome das farmacias onde traballan.
select persoas.dnip,persoas.nomp,farmacias.nomf from persoas,farmacias,traballan where traballan.dnip=persoas.dnip and farmacias.codf=traballan.codf;
c6)amosar nomes de farmaceuticos que traballen en farmacias de vigo
select nomp from persoas where dnip in(select dnip from farmaceuticos where codc in(select codc from cidades where nomc='vigo'));
c7)amosar cantidade total en stock de medoicamentos de acción 'antiacida'
select sum(cantidads) from stock where codm in(select codm from medicamentos where coda in(select coda from accions where noma='antiacida'));
c8)amosar codigo e nome de farmacias da cidade de ferrol
select codf,nomf from farmacias where codc in(select codc from cidades where nomc='ferrol');
c9) amosar os nomes de todas as persoas e ademais o seu nº de colexiado se é que é farmaceutico_a
select persoas.nomp,farmaceuticos.ncolexiado from persoas left join farmaceuticos on persoas.dnip=farmaceuticos.dnip;
c10) amosar nomes de farmacias nas que haxa mais de 3 unidades de medicamentos de accion antiacida
select nomf from farmacias where codf in(select codf from stock where cantidads>'3' and codm in(select codm from medicamentos where coda in(select coda from accions where noma='antiacida')));
c11)amosar o nome dos medicamentos do laboratório 'esteve' de accion 'antiacida'
select nomm from medicamentos where cif in(select cif from laboratorios where noml='esteve') and coda in(select coda from accions where noma='antiacida');
c12) amosar código de cada acción e nº de diferentes medicamenteos que teñen dita acción
select accions.coda,count(*) from accions,medicamentos where accions.coda=medicamentos.coda group by accions.coda;
c13) idéntica a anterior pero amosando en vez de código nome da acción
select accions.noma,count(*) from accions,medicamentos where accions.coda=medicamentos.coda group by accions.coda;
c14)amosar nº de medicamentos diferentes  por laboratorio e acción
select count(medicamentos.*),laboratorios.noml,accions.noma from medicamentos,laboratorios,accions where medicamentos.cif=laboratorios.cif and medicamentos.coda=accions.coda group by medicamentos.codm,laboratorios.noml,accions.noma; 
c15)amosar nomes de medicamentos que teñan mais dun componente
select nomm from medicamentos where codm in(select codm from componen group by codm having count(*)>1);
c16)amosar os nomes dos componente que non forman parte de ningún medicamento.
select nomc from componentes where codc not in(select codc from componen);



