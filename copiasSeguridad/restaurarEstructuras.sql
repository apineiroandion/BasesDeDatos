pg_dump -s -t fu.interven -t fu.xoga -U postgres -Fc -d futbol2 > estructuraFutbol2c.sql
pg_restore -U postgres -d futbol2 -t interven estructuraFutbol2c.sql
