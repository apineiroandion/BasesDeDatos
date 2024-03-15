/*
tsospeita
valor : 2.5 puntos
trigger que rexeite  entrevistar a unha persoa para un posto si o xestor de dito posto ten os mesmos apelidos que a persoa entrevistada 

ex: insert into entrevista values('p18',8,'f','f');
ERROR:  non podes entrevistar a esta persoa para dito posto pois o xestor do posto ten os seus apelidos

ex: insert into entrevista values('p9',23,'f','f');
NOTICE:   entrevista aceptada pois a persoa non ten os apelidos do xestor do posto


*/

drop trigger if exists tsospeita on entrevista;
create or replace function ftsospeita() returns trigger language plpgsql as $$
declare
ap1 varchar = '';
ap2 varchar = '';
ap1x varchar = '';
ap2x varchar = '';

begin

    select ap1_persoa, ap2_persoa into ap1, ap2 from persoas where num_persoa = new.num_persoa;
    select ap1_xestor, ap2_xestor into ap1x, ap2x from xestores where cod_xestor in(select cod_xestor from postos where cod_posto = new.cod_posto);
    
    if ap1 = ap1x and ap2 = ap2x then
        raise exception 'non podes entrevistar a esta persoa para dito posto pois o xestor do posto ten os seus apelidos';
    else
        raise notice 'entrevista aceptada pois a persoa non ten os apelidos do xestor do posto';
        return new;
    end if;
end;$$
;
create trigger tsospeita before insert on entrevista for each row execute 
procedure ftsospeita()
