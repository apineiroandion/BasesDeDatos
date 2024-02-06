create or replace function frepitepalabrap (n int, palabra varchar) returns varchar language plpgsql as $$

declare 
c varchar;

begin
c='';

for i in 1 .. n loop
    c=c||palabra;
end loop;

return c;
end;$$
