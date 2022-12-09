USE superheroe;

# insertar en la tabla creador 
insert into creador values (1, 'Marvel');
insert into creador values (2, 'DC Comics');

# insertar registros en la tabla personaje
#                             int, varchar,      varchar, int, varchar, int, int, int, varchar, int
insert into personaje values (1, 'Bruce Banner', 'Hulk', 160, '600 mil', 75, 98, 1962, 'Físico Nuclear', 1);
insert into personaje values (2, 'Tony Stark', 'Iron Man', 170, '200 mil', 70, 123, 1963, 'Inventor Industrial', 1);
insert into personaje values (3, 'Thor Odinson', 'Thor', 145, 'infinita', 100, 235, 1962, 'Rey de Asgard', 1);
insert into personaje values (4, 'Wanda Maximoff', 'Bruja Escarlata', 170, '100 mil', 90, 345, 1964, 'Bruja', 1);
insert into personaje values (5, 'Carol Danvers', 'Capitana Marvel', 157, '250 mil', 85, 128, 1968, 'Oficial de Inteligencia', 1);
insert into personaje values (6, 'Thanos', 'Thanos', 170, 'infinita', 40, 306, 1973, 'Adorador de la muerte', 1);
insert into personaje values (7, 'Peter Parker', 'Spiderman', 165, '25 mil', 80, 74, 1962, 'Fotógrafo', 1);
insert into personaje values (8, 'Steve Rogers', 'Capitan America', 145, '600 mil', 45, 60, 1941, 'Oficial Federal', 1);
insert into personaje values (9, 'Bobby Drake', 'Ice Man', 140, '2 mil', 64, 122, 1963, 'Contador', 1);
insert into personaje values (10, 'Barry Allen', 'Flash', 160, '10 mil', 120, 168, 1956, 'Científico forense', 2);
insert into personaje values (11, 'Bruce Wayne', 'Batman', 170, '500', 32, 47, 1939, 'Hombre de negocios', 2);
insert into personaje values (12, 'Clarck Kent', 'Superman', 165, 'infinita', 120, 182, 1948, 'Reportero', 2);
insert into personaje values (13, 'Diana Prince', 'Mujer Maravilla', 160, 'infinita', 95, 127, 1949, 'Princesa guerrera', 2);

# Consultas para verificar que está todo insertado
select * from creador;
select * from personaje;

# Cambiar registro
update personaje -- tabla que estamos cambiando
set aparicion = 1938 -- columna que vamos a actualizar con su nuevo dato
where id_personaje = 12; -- el criterio que usamos para cambiar

# Eliminar personaje del registro
delete from personaje
where id_personaje = 10;

# Devolver todos los valores de la columna nombre_real
select nombre_real 'Nombre del paisano' from personaje;

# nombres reales que empiezan con 'B'
select nombre_real from personaje
where nombre_real like 'b%';

# registros ordenados por 'inteligencia' con order by
select * from personaje
order by inteligencia asc;

# Tuve que actualizar porque habia manqueado y le mande 1160
update personaje
set inteligencia = 160
where id_personaje = 13;