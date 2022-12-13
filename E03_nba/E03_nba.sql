# Uso de la base de datos
use nba;

# 1. Mostrar el nombre de todos los jugadores ordenados alfabéticamente.
select nombre from jugador
order by nombre;

# 2. Mostrar el nombre de los jugadores que sean pivots (‘C’) y que pesen más de 200 libras, ordenados por nombre alfabéticamente.
select nombre 'pivots "C" \npeso > 200 libras' from jugador
where posicion like 'C' and peso > 200
order by nombre;

# 3. Mostrar el nombre de todos los equipos ordenados alfabéticamente.
select nombre from equipo
order by nombre; #por defecto ordena alfebeticamente de manera ascendente

# 4. Mostrar el nombre de los equipos del este (East).
select nombre 'Equipos de la conferencia Este' from equipo
where conferencia like 'East';

# 5. Mostrar los equipos donde su ciudad empieza con la letra ‘c’, ordenados por nombre.
select * from equipo
where ciudad like 'C%'
order by nombre;

# 6. Mostrar todos los jugadores y su equipo ordenados por nombre del equipo.
select nombre 'Jugador', nombre_equipo 'Equipo' from jugador
order by nombre_equipo;

# 7. Mostrar todos los jugadores del equipo “Raptors” ordenados por nombre.
select * from jugador
where nombre_equipo like 'Raptors'
order by nombre_equipo;

# 8. Mostrar los puntos por partido del jugador ‘Pau Gasol’.
select puntos_por_partido 'Puntos por partido \nde Pau Gasol' from estadistica
where jugador = (select codigo from jugador where nombre like 'Pau Gasol');

# 9. Mostrar los puntos por partido del jugador ‘Pau Gasol’ en la temporada ’04/05′.
select puntos_por_partido 'Puntos por partido \nde Pau Gasol. \nTemporada 04/05' from estadistica
where jugador = (select codigo from jugador where nombre like 'pau Gasol') and temporada like '04/05';

# 10. Mostrar el número de puntos de cada jugador en toda su carrera.
select jugador, round(sum(puntos_por_partido)) 'Total puntos en carrera' from estadistica
group by jugador;

# 11. Mostrar el número de jugadores de cada equipo.
select nombre_equipo 'Equipo', count(codigo) 'Cantidad de jugadores' from jugador
group by nombre_equipo;

# 12. Mostrar el jugador que más puntos ha realizado en toda su carrera.
select *, (select puntos_por_partido from estadistica order by puntos_por_partido desc limit 1) 'Total Puntos' from jugador
where codigo = (select jugador from estadistica order by puntos_por_partido desc limit 1);

# 13. Mostrar el nombre del equipo, conferencia y división del jugador más alto de la NBA.
select nombre 'Equipo' , Conferencia, division from equipo
where nombre = (select nombre_equipo from jugador order by altura desc limit 1);

# 14. Mostrar la media de puntos en partidos de los equipos de la división Pacific.
select team.division, avg(puntos_por_partido) from estadistica e
join jugador j on e.jugador = j.codigo
join equipo team on j.nombre_equipo = team.nombre
group by team.division
having division like 'Pacific';

# 15. Mostrar el partido o partidos (equipo_local, equipo_visitante y diferencia) con mayor diferencia de puntos.
select equipo_local 'Local', puntos_local 'Puntos', equipo_visitante 'Visitante', puntos_visitante 'Puntos', abs(puntos_local - puntos_visitante) 'Diferencia' from partido
where abs(puntos_local - puntos_visitante) = (select max(abs(puntos_local - puntos_visitante)) from partido);

# 16 (consigna repetida del 14)

# 17. Mostrar los puntos de cada equipo en los partidos, tanto de local como de visitante.
select codigo, equipo_local 'Local', puntos_local 'Puntos', equipo_visitante 'Visitante', puntos_visitante 'Puntos' from partido;

# 18. Mostrar quien gana en cada partido (codigo, equipo_local, equipo_visitante, equipo_ganador), en caso de empate sera null.
select codigo, equipo_local, puntos_local, equipo_visitante, puntos_visitante, 
if (puntos_local = puntos_visitante, null, if(puntos_local > puntos_visitante, equipo_local, equipo_visitante)) 'Equipo ganador' from partido;

select * from partido;
-- 