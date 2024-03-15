/*
procedemento pclientepedidos
procedemento que amose para un nif de cliente dado os codigos dos pedidos que fixo e para cada
un destes pedidos os nomes dos produtos que forman parte del. Debe amosarse asi mesmo o
número de produtos que fan parte de cada pedido. Se un pedido non ten ainda rexistrados produtos
debe lanzarse a mensaxe 'pedido sen produtos'.
si o nif do cliente non existe debe lanzarse a mensaxe 'cliente inexistente' (con tratamento de
excepcions)
si o nif do cliente existe pero non fixo nengun pedido debe lanzarse a mensaxe ' cliente sen pedidos'.
*/

create or replace procedure pclientepedidos (input varchar) 
language plpgsql as $$

declare 
c record;
j record;
k record;
r varchar='';
n varchar='';
cuentaProdutos integer;
cuentaPedidos integer;
begin
    select nif into STRICT n from cliente where nif=input;
    cuentaPedidos=0;
    for c in select codp from pedido where nif=n loop
        r=r||'pedido: '||c.codp||E'\n';
        cuentaPedidos=cuentaPedidos+1;
        cuentaProdutos=0;
        for j in select * from compon where c.codp=compon.codp loop
            
            for k in select nome from produto where j.codm= produto.codm and j.n=produto.n loop
                cuentaProdutos=cuentaProdutos+1;
                r=r||E'\t'||'produto: '||k.nome||E'\n';
            end loop;
            
        end loop;
            if cuentaProdutos=0 then
                r=r||E'\t'||'pedido sen produtos'||E'\n';
            else 
                r=r||E'\t'||'numero de produtos: '||cuentaProdutos||E'\n';
            end if;        
    end loop;
        if cuentaPedidos=0 then
           r=r||E'\t'||'Cliente sin pedidos'||E'\n';
        end if;  
    
    raise notice '%',r;
exception
when no_data_found then
raise notice 'Cliente non existe';
end;$$
