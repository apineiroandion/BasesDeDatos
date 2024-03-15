/*
cada vez que insira un xogador na taboa xogador debe aumentaren 1o numero de xogadores (campo numx) da do seu equipo (taboa equipo)
*/

drop trigger if exists t6_tactualizaequiposp on xogador;
create or replace function ft6_tactualizaequiposp () returns trigger language plpgsql as $$
declare

begin
if(TG_OP='INSERT') then
    update equipo set numx=numx+1 where equipo.codequ=new.codequ;
elsif (TG_OP='UPDATE') then
    update equipo set numx=numx+1 where codequ=new.codequ;
    update equipo set numx=numx-1 where codequ=old.codequ;
elsif (TG_OP='DELETE') then
    update equipo set numx=numx-1 where codequ=old.codequ;
end if;
return null;
end;$$
;
create trigger t6_tactualizaequiposp  after insert or delete or update of codequ on xogador for each row execute 
procedure ft6_tactualizaequiposp ()

--update xogador set salario = salario+3 where codx='x1';--
