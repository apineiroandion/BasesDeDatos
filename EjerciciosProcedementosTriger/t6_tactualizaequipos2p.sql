/*
cada vez que insira un xogador na taboa xogador debe aumentaren 1o numero de xogadores (campo numx) da do seu equipo (taboa equipo)
update xogador set codequ='e4' where codx='x2';
e3=2
e4=6
*/

drop trigger if exists t6_tactualizaequipos2p on xogador;
create or replace function ft6_tactualizaequipos2p () returns trigger language plpgsql as $$
declare

begin

    update equipo set numx=numx+1 where codequ=new.codequ;
    update equipo set numx=numx-1 where codequ=old.codequ;
    return new;
end;$$
;
create trigger t6_tactualizaequipos2p after update of codequ on xogador for each row execute 
procedure ft6_tactualizaequipos2p ()

--update xogador set salario = salario+3 where codx='x1';--
