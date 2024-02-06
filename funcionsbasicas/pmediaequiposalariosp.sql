/*
crear procedemento pmediaequiposalariosp que liste os codigos e os nomes de todos os equipos y para cada un deles a madia dos salrios dos seus xogadores*/

create or replace procedure pmediaequiposalariosp () 
language plpgsql as $$

declare 
r varchar='';
c record;
sal int;
conta int;
begin

    for c in select codequ, nomequ from equipo loop
        conta=0;
        select count(*) into conta from xogador where codequ=c.codequ;
        r=r || ' codigo: '|| c.codequ||' nome: '||c.nomequ||E'\n';
        select avg(salario) into sal from xogador where xogador.codequ=c.codequ;
        if conta=0 then
             r=r ||E'\t'|| ' o equipo: '||c.codequ||' non ten xogadores'||E'\n';
        else
            if sal is null then
                r=r ||E'\t'|| 'Este equipo ten salario nulo '||E'\n';
            else
                r=r ||E'\t'|| ' salario: '||sal||E'\n';
                end if;
            end if;
    end loop;
    raise notice '%',r;

end;$$
