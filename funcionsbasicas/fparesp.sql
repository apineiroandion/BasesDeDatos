/*
funcion que devolta os n primeiros numeros pares
*/
create or replace function fparesp(n int) returns varchar language plpgsql as $$

declare 
c int;

begin
c=0;

for i in 1 .. n loop
    c=c+(2*i);
end loop;

return c;
end;$$
