create or replace function facumuladorp() returns int language plpgsql as $$

declare 
c int;
a int;
begin
c=0;
a=0;
c=c+2; -- c=0+2=2
a=a+c; -- a=0+2
c=c+2; -- c=2+2=4
a=a+c; -- a=2+4=6
c=c+2; -- c=4+2=6
a=a+c; -- a=6+6=12
return a;
end;$$
