create or replace function fforloopp(n int) returns varchar language plpgsql as $$

declare 
c int;

begin
c=0;

for i in 1 .. n loop
    c=c+i;
end loop;

return c;
end;$$
