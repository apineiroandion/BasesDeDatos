create or replace function fcontadorp() returns int language plpgsql as $$

declare 
c int;

begin
c=0;
c=c+1; --0+1=1
c=c+1; --1+1=2
c=c+1; --2+1=3
return c;
end;$$
