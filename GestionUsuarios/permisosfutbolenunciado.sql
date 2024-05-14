1)lanzar como contra base de datos empresas,  usuario postgres o script futboltodoxuntov1p
\i...
2)dar os permisos select ,update,insert e delete ao grupo ventas
grant select, update, insert, delete on all tables in schema public to ventas;
revoke select, update, insert, delete on public.facturas from ventas;
3)permitir acceder a  las filas de la tabla xogador cuxo equipo sexa ='e1' a os usuarios del grupo ventas (alicia) 
alter table xogador enable row level security;
create policy equipoe1 on xogador to ventas using (codequ='e1');
/* OTRAS PRUEBAS
alter table xogador disable row level security;
grant select on xogador to ventas;
revoke select on xogador from ventas;
*/

4) so permitir actualizar as filas da taboa xogador  cuxo salario sexa maior que 1000 a os usuarios do grupo ventas 

create policy actualizarSalaraio1000 on xogador as restrictive for update to public using (salario > 1000);

5) facer as probas pertinentes  paa comprobar que se cumplen as politicas anteriores
\d xogador
select * from xogador;

update xogador SET salario = 900 where codx = 'x6'; -- NO PASA NADA
update xogador SET salario = 3000 where codx = 'x1'; -- SE ACTUALIZA

