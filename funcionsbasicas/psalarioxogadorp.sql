/*
crear psalarioxogadorp tal que dado o codigo dun xogador imprima o seu salario.
Se o codigo de xogador non existe debe imprimirse a mensaxe 'xogador inexistente' 
*/

/*select psalarioxogador('x1');
2000
select psalarioxogador('x17');
'xogador inexistente'
select psalarioxogador('x15');
'ten un salario nulo'*/

create or replace procedure psalarioxogadorp (c varchar) 
language plpgsql as $$

declare 
r varchar='';
nom varchar='';
begin
select nomx,salario into STRICT nom,r from xogador where codx=c;
if r is null then
    raise notice 'o xogador de codigo % e nome % ten salario nulo',c,nom;
else raise notice 'o xogador de codigo % e nome % ten salario de %',c,nom,r;
end if;
    
exception
when no_data_found then
 raise notice 'o codigo de xogador % inexistente ',c;
end;$$
