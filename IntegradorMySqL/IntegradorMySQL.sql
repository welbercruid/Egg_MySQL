# Integrador MySQL 
use nba;

# CANDADO A
# Posicion A: Teniendo el máximo de asistencias por partido, muestre cuantas veces se logró dicho máximo.
select count(asistencias_por_partido) from estadistica
where asistencias_por_partido = (select max(asistencias_por_partido) from estadistica);

# Clave A: Muestre la suma total del peso de los jugadores, donde la conferencia sea Este y la posición sea centro o esté comprendida en otras posiciones.
select sum(peso) from jugador j 
join equipo e on j.nombre_equipo = e.nombre
where e.conferencia like 'east' and j.posicion like '%c%';

# CANDADO B
# Posición B: Muestre la cantidad de jugadores que poseen más asistencias por partidos, que el numero de jugadores que tiene el equipo Heat.
select count(codigo) from jugador j 
join estadistica e on j.codigo = e.jugador
where e.asistencias_por_partido > (select count(codigo) from jugador where nombre_equipo like 'Heat');

# Clave B: La clave será igual al conteo de partidos jugados durante las temporadas del año 1999.
select count(codigo) from partido
where temporada like '%99%';

# CANDADO C
# Posición C: La posición del código será igual a la cantidad de jugadores que proceden de Michigan y forman parte de equipos de la conferencia oeste.
# Al resultado obtenido lo dividiremos por la cantidad de jugadores cuyo peso es mayor o igual a 195, y a eso le vamos a sumar 0.9945.
select (select count(codigo) from jugador j 
join equipo e on j.nombre_equipo = e.nombre
where procedencia like 'Michigan' and e.conferencia like 'west') /
(select count(codigo) from jugador
where peso >= 195) + 0.9945;

# Clave C: Para obtener el siguiente código deberás redondear hacia abajo el resultado que se devuelve de sumar: el promedio de puntos por partido, 
#el conteo de asistencias por partido, y la suma de tapones por partido. Además, este resultado debe ser, donde la división sea central.
select floor(avg(puntos_por_partido) + count(asistencias_por_partido) + sum(tapones_por_partido)) from estadistica e
join jugador j on e.jugador = j.codigo
join equipo team on j.nombre_equipo = team.nombre
where team.division like 'Central';

# CANDADO D
# Posición D: Muestre los tapones por partido del jugador Corey Maggette durante la temporada 00/01. Este resultado debe ser redondeado.
select round(tapones_por_partido) from estadistica
where jugador = (select codigo from jugador where nombre like 'Corey Maggette') and temporada like '00/01';

# Clave D: Para obtener el siguiente código deberás redondear hacia abajo, la suma de puntos por partido de todos los jugadores de procedencia argentina.
select floor(sum(puntos_por_partido)) from estadistica e
join jugador j on e.jugador = j.codigo
where j.procedencia like 'Argentina';

#