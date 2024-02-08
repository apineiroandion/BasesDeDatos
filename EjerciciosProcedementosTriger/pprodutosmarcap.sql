/*
procedimento pprodutosmarcap que dado NOME dunha marca liste o nome e o prezo dos productos lacteos de dita marca
    -tamen cantos ten
    -sen lacteos
    -inexistente
*/

/*select nome, prezo from produto where codm in(select codm from lacteos where codm in(select codm from marca where nomm='larsa'));*/

-- SIN ACABAR

create or replace procedure pprodutosmarcap (input varchar) 
language plpgsql as $$

declare 
c record;
r varchar='';

codMarca varchar='';
contal integer;
begin   
    contal=0;
    for c in select produto.nome, prezo from produto where codm in(select codm from lacteos where codm in(select codm from marca where nomm=input)) loop
    contal=contal+1;
            r=r||'nome: '||c.nome||'prezo: '||c.prezo||E'\n';

    end loop;  
    if contal=0 then
        raise notice 'non ten lacteos';
    end if; 
    raise notice '%',r;
end;$$
