/*
tlimite
valor : 2'5 puntos
trigger que rexeite  entrevistar a unha persoa para un posto si xa se lle fixeron 2 ou mais entrevistas para outros postos xestionados polo mesmo  xestor que o do posto o que se presenta. 

ex:  insert into entrevista values('p16',5,'f','f');
ERROR:  non podes entrevistar a esta persoa para dito posto pois xa se lle fixeron 2 entrevistas para outros postos xestionados polo mesmo  xestor que o do posto o que se presenta

insert into entrevista values('p55',12,'f','f');
non existe a persoa ou o posto

insert into entrevista values('p12',55,'f','f');
non existe a persoa ou o posto


ex: insert into entrevista values('p12',5,'f','f');
NOTICE:   entrevista aceptada pois a persoa non tiña todavia duas  entrevistas co mesmo xestor deste posto


*/

drop trigger if exists tlimite on entrevista;
create or replace function ftlimite () returns trigger language plpgsql as $$
declare
numpr integer;
codps varchar='';
codx varchar='';
num integer;
r varchar='';
begin
    numpr=0;
    num=0;
    select num_persoa into STRICT numpr from persoas where num_persoa=new.num_persoa;
    select cod_posto into STRICT codps from postos where cod_posto=new.cod_posto;
    select cod_xestor into codx from postos where cod_posto=new.cod_posto;
    select count(*) into num from entrevista where cod_posto in(select cod_posto from postos where cod_xestor=codx);
    r=''||num;
    
    
    if num = 2 then
        raise exception 'non podes entrevistar a esta persoa para dito posto pois xa se lle fixeron 2 entrevistas para outros postos xestionados polo mesmo  xestor que o do posto o que se presenta';
    else 
        raise notice '%',r;
        raise notice 'entrevista aceptada pois a persoa non tiña todavia duas  entrevistas co mesmo xestor deste posto';
        return new;
    end if;
    
exception
when no_data_found then
raise exception 'non existe a persoa ou o posto';

end;$$
;


create trigger tlimite before insert on entrevista for each row execute 
procedure ftlimite()










