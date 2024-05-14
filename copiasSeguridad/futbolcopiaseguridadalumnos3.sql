
exemplo de copia de seguridad e restauracion en formato restaurable con pg_restore:

14)facer a copia:
pg_dump -U postgres -Fc futbol2 > fc2.dump
15)borrar a base futbol2
dropdb -U postgres futbol2
16)recuperamos a base futbol2:
pg_restore -U postgres -C -d postgres fc2.dump
17)Recargar o que se atopa na copia nunha nova base (futbolrestaurada):
createdb -U postgres -T template0 futbolrestaurada
pg_restore -U postgres -d futbolrestaurada fc2.dump
