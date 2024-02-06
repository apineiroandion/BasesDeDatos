create or replace function fimparesp(n int) returns int language plpgsql as $$

declare 
c int;

begin
c=0;

for i in 1 .. n loop
    c=c+((2*i)-1);
end loop;

return c;
end;$$
