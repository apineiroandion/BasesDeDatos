/*
tmuseos
*/

drop trigger if exists tmuseos on museos;
create or replace function ftmuseos() returns trigger language plpgsql as $$
declare

comprobador varchar = '';

begin
    select codpa into comprobador from museos where codmu = new.codmu2;
    if new.codpa = comprobador then
        raise notice 'insercion aceptada';
    else
        raise exception 'insercion rexeitada';
    end if;

end;$$
;
create trigger tmuseos before insert on museos for each row execute 
procedure ftmuseos()

