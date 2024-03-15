select count(*) from zona where codz not in(select codz from cliente where codz is not null);
