/*
procedemento chamdo pcidadefarmaciastodas tal que liste os nomes de todas as cidades e para cada unha delas os nomes de todas as farmacias que se atopan nela
*/

create or replace procedure pcidadefarmaciastodas () 
language plpgsql as $$

declare 
c record;
k record;
r varchar = '';
begin   

   for c in select * from  cidades loop
        r=r||c.nomc||E'\n';
        for k in select * from farmacias where codc = c.codc loop
            r=r||E'\t'||k.nomf||E'\n';
        end loop;
   end loop;
   
   raise notice '%',r;

end;$$
