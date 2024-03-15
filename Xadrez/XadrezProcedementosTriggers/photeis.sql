/*
1)procedemento photeis

Amosar os nomes de todos os hoteis (0,75p)
e para cada un deles as datas de entrada e saida de aloxamento nos hoteis (0,75p)
e o nome dos participantes que se aloxaron nesas datas (0,5p)
asi como o numero total dos mesmos (0,25)
*/

create or replace procedure photeis () 
language plpgsql as $$

declare 
r varchar = '';
c record;
k record;
j record;
contador integer;
begin   

    for c in select * from hotel loop
        contador = 0;
        r=r||c.nomh||E'\n';
        for k in select * from aloxa where nomh = c.nomh loop
            
            r=r||E'\t'||k.den||' '||k.dsa;
            for j in select * from participante where codp = k.codp loop
                r=r||E'\t'||j.nomp||E'\n';
                contador = contador + 1;
            end loop;
            
        end loop;
        r=r||E'\t'||contador||E'\n';
    end loop;
    
    raise notice '%',r;

end;$$
