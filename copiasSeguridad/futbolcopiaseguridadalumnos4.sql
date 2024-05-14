18)exportar da base futbol2 esquema fu so as taboas cuxo nome comece por x  ( en formato de texto plano) nun ficheiro chamdo fup.dump
pg_dump -U postgres --table='fu.x*' -Fp futbol2 > fup.dump

19)exportar da base futbol2 esquema fu so as taboas cuxo nome comece por x e ademais as taboas adestra e interven  en formato de texto plano (fup2.dump) e tamén en formato de restaurable con pg_restore (fuc2.dump)

pg_dump -U postgres --table='fu.x*' --table='fu.interven' --table='fu.adestra' -Fp futbol2 > fup2.dump
pg_dump -U postgres --table='fu.x*' --table='fu.interven' --table='fu.adestra' -Fc futbol2 > fup2c.dump

20)exportar da base futbol2 esquema fu so o contido das taboas cuxo nome comece por x e ademais o contido das taboas adestra e interven ( en formato de texto plano (fup2.dump) e tamén en formato de restaurable con pg_restore (fuc2.dump)

pg_dump -U postgres -a --table='fu.x*' --table='fu.interven' --table='fu.adestra' -Fp futbol2 > fup2a.dump
pg_dump -U postgres -a --table='fu.x*' --table='fu.interven' --table='fu.adestra' -Fc futbol2 > fup2ac.dump

21) eliminar estructura e contido da taboa xoga e elimino o contido da taboa adestra
drop table fu.xoga;
delete from adestra;

22) recuperar con pg_restore a taboa xoga e o contido da taboa adestra
pg_restore -l fup2c.dump > l.txt
pg_restore -U postgres -d futbol2 -L l.txt fup2c.dump


