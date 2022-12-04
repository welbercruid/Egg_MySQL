# Realizar las siguientes consultas sobre la base de datos personal
USE personal;

# 1. Obtener los datos completos de los empleados.
select * from empleado;

# 2. Obtener los datos completos de los departamentos.
select * from departamento;

# 3. Listar el nombre de los departamentos.
select distinct nombre_depto from departamento;

# 4. Obtener el nombre y salario de todos los empleados.
select nombre, salario from empleado;

# 5. Listar todas las comisiones.
select comision from empleado;

# 6. Obtener los datos de los empleados cuyo cargo sea 'Secretaria'.
select * from empleado where cargo = 'Secretaria'; 

# 7. Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
select * from empleado
where cargo = 'Vendedor'
order by nombre asc;

# 8. Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
select nombre, cargo, salario from empleado
order by salario asc;

# 9. Elabore un listado donde para cada fila, figure el alias 'Nombre' y 'Cargo' para las respectivas tablas de empleados.
select nombre as 'Nombre', cargo as 'Cargo' from empleado;

# 10. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
select salario, comision from empleado
where id_depto = 2000
order by comision asc;

# 11. Obtener el valor total a pagar que resulta de sumar el salario y la comisión de los empleados del departamento 3000 una bonificación de 500, en orden alfabético del empleado.
select *, salario + comision + 500 as 'Valor total' from empleado
where id_depto = 3000
order by nombre asc;

# 12. Muestra los empleados cuyo nombre empiece con la letra J.
select * from empleado
where nombre like 'J%';
		
# 13. Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000
select salario, comision, salario + comision as 'Salario Total', nombre from empleado
where comision > 1000;

# 14. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
select salario, comision, salario + comision as 'Salario Total', nombre from empleado
where comision = 0;

# 15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select nombre, salario, comision, salario + comision as 'Salario total' from empleado
where comision > salario;

# 16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
select nombre, salario, comision, salario * 0.3 as '30% del sueldo' from empleado
where comision <= salario * 0.3;

# 17. Hallar los empleados cuyo nombre no contiene la cadena 'MA'
select * from empleado
where nombre not like '%MA%';

# 18. Obtener los nombres de los departamentos que sean "Ventas", "Investigación", "Mantenimiento".
select * from departamento
where nombre_depto in ('Ventas', 'Investigación', 'Mantenimiento');
#where nombre_depto like 'Ventas' or nombre_depto like 'Investigación' or nombre_depto like 'Mantenimiento';

# 19. Ahora obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.
select * from departamento
where nombre_depto not in ('Ventas', 'Investigación', 'Mantenimiento');

# 20. Mostrar el salario más alto de la empresa.
select nombre, salario as 'Salario mayor' from empleado where salario = (select max(salario) from empleado);
#select * from empleado where salario = (select max(salario) from empleado);
 
# 21. Mostrar el nombre del último empleado de la lista por orden alfabético.
#select * from empleado order by nombre desc limit 1; # muestra todos sus datos
select max(nombre) as 'Utlimo alfabeticamente' from empleado; #solo muestra su nombre

# 22. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
select max(salario) as 'Salario más alto', min(salario) as 'Salario más bajo', max(salario) - min(salario) as Diferencia from empleado;

# 23. Hallar el salario promedio por departamento.
select d.nombre_depto as Departamento, avg(e.salario) as 'Salario promedio' from empleado e
join departamento d
on e.id_depto = d.id_depto
group by d.nombre_depto;

# Consultas con Having
# 24. Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
select count(id_empleado) as 'Número empleados', d.id_depto as 'Departamento', d.nombre_depto from empleado e, departamento d
where d.id_depto = e.id_depto
group by d.id_depto
having count(id_empleado) > 3;

# 25. Mostrar el código y nombre de cada jefe, junto al número de empleados que dirige. Solo los que tengan más de dos empleados (2 incluido).
select d.id_empleado, d.nombre, count(d.id_empleado) as 'Número empleados' from empleado d, empleado e
where  e.cod_jefe = d.id_empleado
group by d.id_empleado, d.nombre
having count(d.id_empleado)>= 2
order by count(d.id_empleado) desc;
#no funca, seguir revisando!

# 26. Hallar los departamentos que no tienen empleados 
# Podemos insertar un campo en null para mostrar algo
#INSERT INTO `departamento` VALUES (4600,'AREA NULA','MURCIA','NULL');
SELECT d.id_depto, d.nombre_depto 
from departamento d, departamento e
where d.id_depto = e.id_depto
GROUP BY d.id_depto
HAVING count(*) = 0;

# Consulta con Subconsulta
# 27. Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
select id_empleado, salario, nombre from empleado
where salario >= (select avg(salario) from empleado);

#