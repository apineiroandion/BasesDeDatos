create or replace function fcomparadousnumerosp (n1 int, n2 int) returns varchar language plpgsql as $$

declare 

r varchar;
begin
if n1=n2 then 
r=' e igual a ';

elsif n1>n2 then 
r=' mayor que ';

elsif n1<n2 then 
r=' menor que ';
end if;
r=n1||r||n2;
return r;
end;$$
