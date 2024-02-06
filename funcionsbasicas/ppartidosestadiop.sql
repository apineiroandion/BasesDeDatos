/*
crear procedemento ppartidosestadiop que pasandolle o nome dun estadio: 'montana' 
me devolte o codigo, nome e data dos partidos que se xogaron nel.
*/

create or replace procedure ppartidosestadiop (vnomest varchar) 
language plpgsql as $$

declare 
c record;
r varchar='';
a int=0;
cod varchar;

begin
    select codest into STRICT cod from estadio where nomest=vnomest;
    for c in select codpar,nompar,data from partido where codest=cod loop
        a=a+1;
        r=r||'codigo: '||c.codpar||' nome: '||c.nompar||' data: '||c.data||E'\n';
    end loop;
    if a=0 then
        raise notice 'No se jugadon partidos en el estadio %',vnomest;
    else 
        raise notice '% El numero total de partidos jugados en ese estado es: %',r,a;
        end if;
exception
when no_data_found then
    raise notice 'El estadio % no esxite',vnomest;

end;$$
