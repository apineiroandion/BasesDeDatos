/*
trexeita
valor : 2'5 puntos
trigger que impida entrevistar a unha persoa para un posto si dita persoa e rexeitada 
pola empresa a  que corresponde dito posto.

insert into entrevista values('p9',20,'f','f');
insert into entrevista values('p9',20,'f','f');
'non podes entrevistar a esta persoa para dito posto pois e rexeitada por a empresa que lle corresponde a dito posto'

insert into entrevista values('p90',7,'f','f');
 non existe a persoa ou o posto

insert into entrevista values('p9',70,'f','f');
 non existe a persoa ou o posto

insert into entrevista values('p9',6,'f','f');
entrevista aceptada

*/

drop trigger if exists trexeita on entrevista;
create or replace function ftrexeita() returns trigger language plpgsql as $$
declare

codigoEmpresa varchar = '';
numeroPersoa integer;
codigoPosto varchar = '';
contador integer;
c record;

begin

    select cod_empresa into STRICT codigoEmpresa from postos where cod_posto = new.cod_posto;
    select cod_posto into codigoPosto from postos where cod_empresa = codigoEmpresa;
    select num_persoa into STRICT numeroPersoa from persoas where num_persoa = new.num_persoa;
    
    contador = 0;
    for c in select * from entrevista where new.cod_posto = cod_posto and new.num_persoa = num_persoa and seleccionado = 'f' loop
    contador = contador + 1;
    end loop;
    raise notice '%',contador;
    if contador = 1 then
        
        raise exception 'non podes entrevistar a esta persoa para dito posto pois e rexeitada por a empresa que lle corresponde a dito posto';
        
    else 
        
        raise notice 'entrevista aceptada';
        return new;
        
    end if;
    
exception

    when no_data_found then
    raise exception 'non existe a persoa ou o posto';

end;$$
;
create trigger trexeita before insert on entrevista for each row execute 
procedure ftrexeita()
