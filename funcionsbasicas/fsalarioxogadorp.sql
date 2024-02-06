/*
crear fsalarioxogadorp tal que dado o codigo dun xogador imprima o seu salario.
Se o codigo de xogador non existe debe imprimirse a mensaxe 'xogador inexistente' 
*/

/*select fsalarioxogador('x1');
2000
select fsalarioxogador('x17');
'xogador inexistente'
select fsalarioxogador('x15');
'ten un salario nulo'*/

create or replace function fsalarioxogadorp (c varchar) returns varchar language plpgsql as $$

declare 
r varchar='';

begin
select salario into STRICT r from xogador where codx=c;
if r is null then
    return 'o salario do xogador e nulo';
end if;

return r;
exception
when no_data_found then
return 'xogador inexistente';
end;$$
