create or replace function foperadousnumerosp(operando varchar, n1 int, n2 int) returns numeric(12,2) language plpgsql as $$

declare 

r numeric(12,2);
begin
if operando='suma' then 
r=n1+n2;

elsif operando='resta' then 
r=n1-n2;

elsif operando='multiplicacion' then 
r=n1*n2;

elsif operando='division' then 
r=n1/n2;
end if;
return r;
end;$$
