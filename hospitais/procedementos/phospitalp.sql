/*
phospitalp
procedimento que, pasandolle o nome dun hospital, imprima os nomes dos asegurados de 1 categoria que foron hospitalizados nel .
 Se non ten asegurados de primeira categoria hospitalizados debe imprimirse a mensaxe 'este hospital non ten asegurados de 1 categoria hospitalizados'  
 Se o hospital non existe debe imprimirse a mensaxe adecuada (mediante tratamento de excepcions) .

call phospitalp ('povisa');
andrea
dorotea

call phospitalp ('sonic');
este hospital non ten asegurados de 1 categoria hospitalizados


execute phospital ('roma');
este hospital non existe
*/
create or replace procedure phospitalp (input varchar) 
language plpgsql as $$

declare 
codigo varchar='';
r varchar='';
nombre varchar='';
c record;
conta integer;
begin
conta=0;
select codh into STRICT codigo from hospital where nomh=input;
for c in select * from hosp1 where codh=codigo loop
    conta=conta+1;
    select nomas into nombre from asegurado where numas=c.numas and codp=c.codp;
    r=r||nombre||E'\n';
end loop;
if conta=0 then 
    raise notice 'este hospital non ten asegurados de 1 categoria hospitalizados ';
else
raise notice '%',r;
end if;
exception
when no_data_found then
raise notice 'este hospital non existe';

end;$$

