-- Si se tiene seleccionada la tabla "empresa" no hace falta especificarlo en el from (empresa.centrostrabajo).
-- Se pueden usar alias, poniendo "AS" y dándole un nombre.
SELECT 
	direccionCentroTrabajo AS 'Dirección',
    nombreCentroTrabajo AS 'Nombre',
    idCentroTrabajo AS 'Código Centro'
FROM 
	centrostrabajo;

-- Listado de empleados
-- SELECT * FROM empresa.empleados; se puede poner más simplificado.
SELECT * FROM empleados;
SELECT * FROM empresa.departamentos;

-- CHULETA:
/*
SELECT 
	* | campos AS 'alias'
FROM tabla_origen
	WHERE
condiciones
	ORDER BY 
campo ASC | DESC;
*/

-- EJERCICIOS:
-- Ejercicio 1.1: Obtener los nombres de todos los centros de trabajo de la empresa clasificados por orden alfabético.
SELECT 
	nombreCentroTrabajo AS 'Centro de Trabajo'
FROM centrostrabajo
	ORDER BY 
	nombreCentroTrabajo ASC;
    
-- Ejercicio 1.2: Obtener los nombres de los empleados que trabajan en el departamento 121.
SELECT 
	*
FROM departamentos
	WHERE
idDepartamentoFK = 121;

-- Ejercicio 1.3: Extraer todos los datos del departamento 121.
SELECT 
	*
FROM departamentos
	WHERE
idDepartamento = 121;

-- Ejercicio 1.4: Obtener los nombres y salarios de los empleados con más de tres hijos por orden alfabético.
SELECT 
    nombreEmpleado AS 'Empleado', salarioEmpleado AS 'Salario'
FROM
    empleados
WHERE
    hijosEmpleado > 3
ORDER BY 
	nombreEmpleado ASC;
    
-- Ejercicio 1.5: Obtener la comisión, departamento y nombre, de los empleados cuyo salarioes inferior a 1900 €, clasificándolos por departamento en orden creciente, y por comisión en orden decreciente dentro de cada departamento.
SELECT 
    comisionEmpleado AS 'Comisión', idDepartamentoFK AS 'Departamento', nombreEmpleado AS 'Empleado'
FROM
    empleados
WHERE
    salarioEmpleado < 1900
ORDER BY 
	idDepartamentoFK ASC, comisionEmpleado DESC;
    
-- Ejercicio 1.6: Obtener por orden alfabético los nombres de los departamentos cuyo presupuesto sea superior a 10.000.000 €.
SELECT 
    nombreDepartamento AS 'Departamento'
FROM
    departamentos
WHERE
    presupuestoDepartamento > 10;
    
-- Ejercicio 1.7: Obtener de manera ordenada los números de los departamentos (sin repetir) donde trabajan empleados cuyo salario sea inferior a 2.000 €.
SELECT DISTINCT
    idDepartamentoFK AS 'Departamento'
FROM
    empleados
WHERE
    salarioEmpleado < 2000
ORDER BY 
idDepartamentoFK ASC;

-- Ejercicio 1.8: Obtener los valores diferentes (y sin repetir) de comisiones que hay en el departamento 110.
SELECT DISTINCT
    comisionEmpleado AS 'Comisión'
FROM
    empleados
WHERE
    idDepartamentoFK = 110;

-- Ejercicio 1.9: Hallar, por orden alfabético, los nombres de los departamentos cuyo director lo es en funciones y no en propiedad
SELECT
    nombreDepartamento AS 'Departamento'
FROM
    departamentos
WHERE
    tipoDirectorDepartamento = 'F'
ORDER BY
	nombreDepartamento ASC;

-- Ejercicio 1.10: Obtener un listín telefónico de los empleados del departamento 121 incluyendo nombre del empleado, número de empleado y extensión telefónica. Por orden alfabético.
SELECT
    nombreEmpleado AS 'Empleado', idEmpleado AS '#', extensionEmpleado AS 'Extensión'
FROM
    empleados
WHERE
    idDepartamentoFK = '121'
ORDER BY
	nombreEmpleado ASC;
    
-- Ejercicio 1.11: Obtener por orden creciente una relación de todos los números de extensiones telefónicas de los empleados.
SELECT
   DISTINCT extensionEmpleado AS 'Extensión'
FROM
    empleados
ORDER BY 1;

-- Ejercicio 1.12: Hallar la comisión, nombre y salario de los empleados con más de tres hijos, clasificados por comisión, y dentro de comisión por orden alfabético.
SELECT
    comisionEmpleado AS 'Comisión', nombreEmpleado AS 'Empleado', salarioEmpleado AS 'Salario'
FROM
    empleados
WHERE
    hijosEmpleado > 3
ORDER BY 1, 2;
    
-- Ejercicio 1.13: Obtener salario y nombre de los empleados sin hijos por orden decreciente de salario y por orden alfabético dentro de salario.
SELECT
    salarioEmpleado AS 'Salario', nombreEmpleado AS 'Empleado'
FROM
    empleados
WHERE
    hijosEmpleado = 0
ORDER BY
	salarioEmpleado DESC, nombreEmpleado ASC; 
    -- se podría poner salarioEmpleado DESC, 2; 
    
-- Ejercicio 1.14: Obtener por orden alfabético los nombres de los empleados cuyo primer apellido es Mora o empieza por Mora.
SELECT
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    nombreEmpleado like 'MORA%, %'
ORDER BY
	nombreEmpleado ASC;
    
-- Ejercicio 1.15: Obtener los nombres de empleados cuyo nombre de pila empieza por Valeriana.
  SELECT
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    nombreEmpleado like '%, Valeriana%'
ORDER BY
	nombreEmpleado ASC;
    
-- 1.16: Obtener por orden alfabético los nombres de empleados que tengan un apellido de siete letras.
  SELECT
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    nombreEmpleado like '_______, %'
ORDER BY
	nombreEmpleado ASC;
    
-- 1.17: Obtener por orden alfabético los nombres de empleados cuyo apellido tenga seis o más letras.

  SELECT
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    nombreEmpleado like '______%, %'  
ORDER BY
	nombreEmpleado ASC;
    
-- 1.18: Obtener los nombres de empleados cuyo apellido tenga tres letras o menos.
  SELECT
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    NOT nombreEmpleado like '____%, %'
ORDER BY
	nombreEmpleado ASC;
    
-- 1.19: Obtener por orden alfabético los nombres de empleados cuyo apellido termina en EZ y su nombre de pila termina en O y tiene al menos tres letras.
SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    nombreEmpleado LIKE '%EZ, %__O'
ORDER BY nombreEmpleado ASC;
    
-- 1.20: Obtener los nombres, salarios y fechas de ingreso de los empleados que o bien ingresaron después de 01/01/88 o bien tienen un salario inferior a 2.000 €. Clasificados por fecha y nombre.
SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    salarioEmpleado AS 'Salario',
    fechaIngresoEmpleado AS 'Fecha de Ingreso'
FROM
    empleados
WHERE
    fechaIngresoEmpleado > '1988-01-01'
        OR salarioEmpleado < 2000
ORDER BY fechaIngresoEmpleado , nombreEmpleado;
    
-- 1.21. Obtener por orden alfabético los nombres de los departamentos que no sean de Dirección ni de Sectores.

SELECT 
    nombreDepartamento AS 'Departamento'
FROM
    departamentos
WHERE
    nombreDepartamento NOT LIKE 'DIRECCIÓN%'
        AND nombreDepartamento NOT LIKE 'SECTOR%'
ORDER BY 1;

-- 1.22. Hallar, por orden alfabético, los nombres de los departamentos que o bien tienen directores en funciones o bien en propiedad y su presupuesto anual excede a 5.000.000 € o bien no dependen de ningún otro.
SELECT 
    nombreDepartamento AS 'Departamento'
FROM
    departamentos
WHERE
    (tipoDirectorDepartamento = 'F')
        OR (tipoDirectorDepartamento = 'P'
        AND presupuestoDepartamento > 5)
        OR (idDepartamentoFK IS NULL)
ORDER BY 1;

-- 2.1. Obtener por orden alfabético los nombres de los empleados cuya extensión Telefónica es 250 ó 750.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    extensionEmpleado = 250 OR extensionEmpleado = 750
ORDER BY 1;

-- LA FORMA DE HACERLO CON EL PREDICADO 'IN' SERÍA:

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    extensionEmpleado IN (250, 750)
ORDER BY 1;

-- 2.2. Obtener por orden alfabético los nombres de los empleados que trabajan en el mismo departamento que Pilar Gálvez o Dorotea Flor.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    idDepartamentoFK IN ((SELECT idDepartamentoFK FROM empleados WHERE nombreEmpleado = "FLOR, DOROTEA"), (SELECT idDepartamentoFK FROM empleados WHERE nombreEmpleado = "GALVEZ, PILAR"))
ORDER BY 1;

-- 2.3. Obtener por orden alfabético los nombres de los empleados cuyo salario está entre 2.500 y 3.000 €.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    salarioEmpleado BETWEEN 2500 AND 3001
ORDER BY 1;

-- 2.4. Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario, dividido por su número de hijos cumpla una, o ambas, de las condiciones siguientes:
-- Que sea inferior a 1.200 €.
-- Que sea superior al doble de su comisión.
    
-- SIN BETWEEN:
SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(salarioEmpleado, ' €') AS 'Salario'
FROM
    empleados
WHERE
    (salarioEmpleado / hijosEmpleado < 1200)
        OR (salarioEmpleado / hijosEmpleado) > (comisionEmpleado * 2)
ORDER BY 1;

-- CON BETWEEN:
SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(salarioEmpleado, ' €') AS 'Salario'
FROM
    empleados
WHERE
    (salarioEmpleado / hijosEmpleado) BETWEEN 0 AND 1200
        OR (salarioEmpleado / hijosEmpleado) > (comisionEmpleado * 2)
ORDER BY 1;

-- 2.5. En la fiesta de Reyes se desea organizar un espectáculo para los hijos de los empleados, que se representará en dos días diferentes. 
-- El primer día asistirán  los empleados cuyo apellido empiece por las letras desde A hasta L, ambas inclusive. El segundo día se cursarán 
-- las invitaciones para el resto. A cada empleado se le asignarán tantas invitaciones gratuitas como hijos tenga y dos más. Además, en la
-- fiesta, se entregará a cada empleado un obsequio por hijo. Obtener una lista por orden alfabético de los nombres a quienes hay que invitar
-- el primer día de la representación, incluyendo también cuántas invitaciones corresponden a cada nombre y cuántos regalos hay que preparar para él.

SELECT 
    nombreEmpleado AS 'Invitados 1er día',
    (hijosEmpleado + 2) AS 'Invitaciones',
    hijosEmpleado AS 'Regalos'
FROM
    empleados
WHERE
    nombreEmpleado BETWEEN 'A%, %' AND 'M%, %'
ORDER BY 1;

-- 3.1. Obtener los nombres y salarios anuales expresados en n € de los empleados del departamento 100. Presentarlos por orden decreciente de salarios.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT((salarioEmpleado *12), ' €') AS 'Salario anual'
FROM
    empleados
WHERE
    idDepartamentoFK = 100
ORDER BY salarioEmpleado DESC;

-- 3.2. Obtener los nombres de los empleados cuya commisión es superior o igual al 50% de su salario, por orden alfabético.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    comisionEmpleado >= (salarioEmpleado / 2)
ORDER BY 1;

-- 3.3. En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra de 500 € por hijo, a partir del cuarto inclusive. 
-- Obtener por orden alfabético para estos empleados: nombre y salario total que van a cobrar incluyendo esta paga extra.

SELECT 
    nombreEmpleado AS 'Nombre Empleado', 
    CONCAT(salarioEmpleado + (500 * hijosEmpleado), ' €') AS 'Salario Total'
FROM
    empleados
WHERE
    hijosEmpleado >= 4
ORDER BY 1;

-- 3.4. Obtener una relación por orden alfabético de los departamentos cuyo presupuesto es inferior a 5.000.000 €. El nombre de los 
--  departamentos vendrá precedido de las palabras; 'Departamento de' e irá en la misma columna que el nombre del departamento.

SELECT 
    CONCAT('Departamento de ' , nombreDepartamento) AS 'Nombre Departamento'
FROM
    departamentos
WHERE
    presupuestoDepartamento < 5
ORDER BY 1;



-- Primeros ejemplos de JOIN
-- Sacar información de más de UNA tabla (relacionadas)
-- Ejemplo 1: Mostrar la información de los Departamentos, 
-- incluyendo el Nombre del Centro de trabajo al que pertenece.
-- Producto Cartesiano o JOIN Natural
-- El Join que siempre debemos usar es el innerJoin

-- Si se llaman igual "nombre" y "nombre" tendríamos que poner delante el nombre de la tabla. 
-- Por ejemplo: departamento.nombre

-- EJEMPLO CARTESIANO -- NUNCA HAY QUE HACERLO ASÍ  (EJEMPLO 1)
SELECT 
    idDepartamento AS 'Nº Departamento',
    nombreDepartamento AS 'Departamento',
    nombreCentroTrabajo AS 'Centro Trabajo'
FROM
    departamentos,
    centrostrabajo
ORDER BY 1;

-- EJEMPLO COMO SÍ SE DEBE HACER: USANDO INNER JOIN o JOIN interno  (EJEMPLO 2)
SELECT 
    idDepartamento AS 'Nº Departamento',
    nombreDepartamento AS 'Departamento',
    nombreCentroTrabajo AS 'Centro Trabajo'
FROM
    departamentos,
    centrostrabajo
WHERE
    departamentos.idCentroTrabajoFK = centrostrabajo.idCentroTrabajo
ORDER BY 1;

-- Otro ejemplo: Obtener id de empleado, nombre de empleado
-- y NOMBRE del departamento al que pertenece
-- 110 PONS, CESAR Personal
-- ...  (EJEMPLO 3) -- Esto ya es un inner join pero es implícito

SELECT 
    idEmpleado AS 'Nº Empleado',
    nombreEmpleado AS 'Nombre Empleado',
    nombreDepartamento AS 'Departamento'
FROM
    empleados,
    departamentos
WHERE
    empleados.idDepartamentoFK = departamentos.idDepartamento
ORDER BY 1;

-- Lo mismo que el anterior pero solo los empleados que cobran menos de 1500€ al mes (EJEMPLO 4)

SELECT 
    idEmpleado AS 'Nº Empleado',
    nombreEmpleado AS 'Nombre Empleado',
    nombreDepartamento AS 'Departamento'
FROM
    empleados,
    departamentos
WHERE
    (empleados.idDepartamentoFK = departamentos.idDepartamento)
        && (salarioEmpleado < 1500)
ORDER BY 1;

-- Esta es la forma MÁS CORRECTA que existe. Internamente es mejor y es la que debemos usar SIEMPRE. (Ejemplo 5)

SELECT 
    idEmpleado AS 'Nº Empleado',
    nombreEmpleado AS 'Nombre Empleado',
    nombreDepartamento AS 'Departamento'
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.idDepartamentoFK = departamentos.idDepartamento
WHERE
    salarioEmpleado < 1500
ORDER BY 1;

-- (Ejemplo 6): Empleado, Departamento y Centro || Más de 2 tablas. 

SELECT 
    nombreEmpleado AS 'Empleado',
    nombreDepartamento AS 'Departamento',
    nombreCentroTrabajo AS 'Centro Trabajo'
FROM
    empleados,
    departamentos,
    centrostrabajo
WHERE
    (empleados.idDepartamentoFK = departamentos.idDepartamento)
        && (departamentos.idCentroTrabajoFK = centrostrabajo.idCentroTrabajo)
ORDER BY 1;

-- (Ejemplo 7): Ahora con la forma explícita del JOIN.

SELECT 
    nombreEmpleado AS 'Empleado',
    nombreDepartamento AS 'Departamento',
    nombreCentroTrabajo AS 'Centro Trabajo'
FROM
    empleados
        INNER JOIN
    departamentos ON empleados.idDepartamentoFK = departamentos.idDepartamento
        INNER JOIN
    centrostrabajo ON departamentos.idCentroTrabajoFK = centrostrabajo.idCentroTrabajo
ORDER BY 1;

-- 3.5 Llamemos presupuesto medio mensual de un departamento al resultado de dividir su presupuesto anual por 12. Supongamos que se decide aumentar los
-- presupuestos medios mensuales de todos los departamentos en un 10% a partir del mes de octubre inclusive. Para los departamentos cuyo presupuesto mensual
-- medio anterior a octubre es más de 5.000.000 €, hallar por orden alfabético el nombre de departamento y su presupuesto anual total después del incremento.

-- El presupuesto de los departamentos es anual, por lo que al dividirlo entre 12 tenemos el mensual.
-- De enero a septiembre se queda igual el presupuesto.

SELECT 
    nombreDepartamento AS 'Nombre Departamento',
    CONCAT(ROUND((presupuestoDepartamento/12 *9) + (presupuestoDepartamento/12 * 3 * 1.1), 2), ' €') AS 'Presupuesto Anual Total'
FROM
    departamentos
WHERE
-- octubre, noviembre y diciembre son 3 meses. Se le aumenta un 10% al presupuesto
    ((presupuestoDepartamento / 12) * 9) > 5
ORDER BY 1;

-- 3.6. Supongamos que en los próximos tres años el coste de vida va a aumentar un 6% anual y que se suben los salarios en la misma proporción, hallar para los
-- empleados con más de 4 hijos su nombre y su salario anual, actual y para cada uno de los próximos tres años, clasificados por orden alfabético.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(ROUND((salarioEmpleado * 12.00), 2), ' €') AS 'Salario Anual Actual',
	CONCAT(ROUND(((salarioEmpleado * 12) * 1.06), 2), ' €') AS 'Salario Anual Primer Año',
    CONCAT(ROUND((((salarioEmpleado * 12) * 1.06) * 1.06), 2), ' €') AS 'Salario Anual Segundo Año',
    CONCAT(ROUND(((((salarioEmpleado * 12) * 1.06) * 1.06) * 1.06), 2), ' €') AS 'Salario Anual Tercer Año'
FROM
    empleados
WHERE
    hijosEmpleado > 4
ORDER BY 1;

-- 3.7. Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación 
-- de 1.000 € por hijo, el total de esta gratificación no supera a la décima parte del salario.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    -- ((salarioEmpleado * 12) * hijosEmpleado) < ((salarioEmpleado * 12) * .10)
    -- (hijosEmpleado * 1000) < (salarioEmpleado * 1.10)
    (hijosEmpleado * 1000) < (salarioEmpleado * 0.1)
ORDER BY 1;

-- 3.8. Para los empleados del departamento 112 hallar el nombre y el salario total de cada uno (salario más comisión), 
-- por orden de salario total decreciente, y por orden alfabético dentro de salario total.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(salarioEmpleado + comisionEmpleado, ' €') AS 'Salario Total'
FROM
    empleados
WHERE
    idDepartamentoFK = 112
ORDER BY salarioEmpleado + comisionEmpleado DESC , nombreEmpleado ASC;

-- 3.9. Hallar ordenado por número de empleado, el nombre y salario total (salario 
-- más comisión) de los empleados cuyo salario total supera los 3.000 € mensuales.

SELECT 
    idEmpleado AS 'Nº Empleado',
    nombreEmpleado AS 'Empleado',
    salarioEmpleado + comisionEmpleado AS 'Salario Total'
FROM
    empleados
WHERE
    salarioEmpleado + comisionEmpleado > 3000
ORDER BY 1;

-- 3.10. Obtener los números de los departamentos en los que haya algún empleado cuya comisión supere al 20 % de su salario.

SELECT DISTINCT
    idDepartamentoFK AS 'Número Departamento'
FROM
    empleados
WHERE
    comisionEmpleado > salarioEmpleado * 0.2
ORDER BY 1;

-- 3.11. Para todos los empleados que tienen comisión, hallar sus salarios mensuales totales incluyendo ésta. Obtenerlos por orden 
-- alfabético. Halla también el porcentaje que de su salario total supone la comisión.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(salarioEmpleado + comisionEmpleado, ' €') AS 'Salario Total',
    CONCAT(ROUND((100 * comisionEmpleado) / (salarioEmpleado + comisionEmpleado), 0), '%') AS 'Porcentaje Comisión'
FROM
    empleados
WHERE
    comisionEmpleado > 0
ORDER BY 1;

-- 3.12. Obtener los nombres de los departamentos que no dependen funcionalmente de otro.

SELECT 
    nombreDepartamento AS 'Nombre Departamento'
FROM
    departamentos
WHERE
    idDepartamentoFK IS NULL
ORDER BY 1;

-- 3.13. Para los empleados que no tienen comisión, obtener por orden alfabético el nombre y el cociente entre su salario y el número de hijos.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(ROUND(salarioEmpleado / hijosEmpleado, 2), ' €') AS 'Salario por hijo'
FROM
    empleados
WHERE
    comisionEmpleado = 0
    && hijosEmpleado > 0
ORDER BY 1;

-- 3.14. Se desea hacer un regalo de un 1% del salario a los empleados en el día de su onomástica. 
-- Hallar, por orden alfabético, los nombres y cuantía de los regalos en € para los que celebren su santo el día de San Honorio.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    CONCAT(ROUND(salarioEmpleado / 100, 2), ' €') AS 'Regalo'
FROM
    empleados
WHERE
    nombreEmpleado LIKE '%, Honorio%'
        || nombreEmpleado LIKE '%, Honoria%'
ORDER BY 1;

-- 3.15. Obtener por orden alfabético los nombres de empleados que tengan al menos 13 letras.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    LENGTH(nombreEmpleado) > 12
ORDER BY 1;

-- 3.16. Obtener los nombres abreviados para los departamentos tomando sus primeras nueve letras, por orden alfabético.

SELECT 
    substring(nombreDepartamento, 1, 9) AS 'Nombre Departamento'
FROM
    departamentos
ORDER BY 1;

-- 3.17.  Obtener los números de departamento, y los cinco caracteres siguientes al de la posición
-- duodécima de sus nombres, mostrándolos por orden de número de departamento.

SELECT 
    idDepartamento AS 'idDepartamento',
    SUBSTRING(nombreDepartamento, 13, 5) AS 'Nombre Departamento'
FROM
    departamentos
ORDER BY 1;

-- 3.18. Obtener los números de departamentos, y para los nombres de éstos con más de 12 caracteres
-- extraes los cinco siguientes, mostrándolos por orden de número de departamento.

SELECT 
    idDepartamento,
    SUBSTRING(nombreDepartamento, 13, 5) AS 'Nombre Departamento'
FROM
    departamentos
WHERE 
length(nombreDepartamento) > 12
ORDER BY 1;

-- 3.19. Obtener los tres últimos caracteres de los nombres de departamento por orden alfabético.

SELECT 
    RIGHT(nombreDepartamento, 3) AS 'Nombre Departamento'
FROM
    departamentos
ORDER BY 1;

-- 3.20. Hallar los nombres de los empleados que no tienen comisión, clasificados 
-- de manera que aparezcan primero aquellos cuyos nombres son más cortos.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    comisionEmpleado = 0
ORDER BY LENGTH(nombreEmpleado), nombreEmpleado ASC;

-- 3.21. Hallar, por orden alfabético, los nombres de empleados suprimiendo las tres últimas letras
-- de los nombres de pila, para los empleados cuyos nombres de pila tengan más de 6 letras.

SELECT 
    SUBSTRING(nombreEmpleado,
        1,
        LENGTH(nombreEmpleado) - 3) AS 'Nombre acortado'
FROM
    empleados
WHERE
    nombreEmpleado LIKE '%,_______%'
ORDER BY 1;

-- 3.22. Se desea modificar la fecha de ingreso de Valeriana Mora (empleado número 430) poniendo el 3 de mayo de 1988.

SELECT 
    nombreEmpleado,
    fechaNacimientoEmpleado AS 'Fecha Nacimiento'
FROM
    empleados
WHERE
    nombreEmpleado LIKE 'Mora, Valeriana'
ORDER BY 1;

UPDATE empleados 
SET 
    fechaNacimientoEmpleado = '1988-05-03'
WHERE
    idEmpleado = '430';

-- 3.23. Se desea saber el nombre y fecha de nacimiento del empleado 110.

SELECT 
    nombreEmpleado,
    fechaNacimientoEmpleado AS 'Fecha Nacimiento'
FROM
    empleados
WHERE
    nombreEmpleado LIKE 'PONS, CESAR'
ORDER BY 1;

-- 3.24. Extraer de la tabla de empleados los nombres de 
-- los que  han ingresado posteriormente al año 1970.

SELECT 
    nombreEmpleado
FROM
    empleados
WHERE
    fechaIngresoEmpleado > '1969-01-31';
    
-- 3.25. Modificar la fecha de ingreso de Valeriana Mora (empleado número 430) poniendo la del día de hoy.

SELECT 
    nombreEmpleado AS 'Nombre Empleado', fechaIngresoEmpleado AS 'Fecha Ingreso'
FROM
    empleados
WHERE
    idEmpleado = '430'
ORDER BY 1;

UPDATE empleados 
SET 
    fechaIngresoEmpleado = '2023-05-17'
WHERE
    idEmpleado = '430';

-- 3.26. Obtener los nombres y fechas de nacimiento de los empleados del departamento 100, en formato dd/mm/yyyy, de más viejo a más joven.

SELECT 
    nombreEmpleado AS 'Nombre Empleado', date_format(fechaNacimientoEmpleado, '%d/%m/%Y') AS 'Fecha Nacimiento'
FROM
    empleados
WHERE
    idDepartamentoFK = '100'
ORDER BY fechaNacimientoEmpleado DESC;

-- 3.27. Para los empleados que ingresaron durante el año 1968, después del mes de mayo, hallar, su nombre  
-- y cuántos días llevaban trabajando en la empresa a primeros de año de 1969, por orden alfabético.

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    timestampdiff(day, fechaIngresoEmpleado, '1969-01-01') AS 'Días hasta 1969'
FROM
    empleados
WHERE
    fechaIngresoEmpleado > '1968-05-01' && fechaIngresoEmpleado < '1969-01-1'
ORDER BY 1;

-- 3.28. Obtener por orden alfabético los nombres de los empleados 
-- que ingresaron en los primeros noventa días del año 1988.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    fechaIngresoEmpleado > '1988-01-01' && fechaIngresoEmpleado < '1988-03-01'
ORDER BY 1;

-- 3.29. Obtener, por orden alfabético, los nombres y fechas de nacimiento
-- de los empleados que cumplen años en el mes de noviembre.

SELECT 
    nombreEmpleado AS 'Nombre Empleado', fechaNacimientoEmpleado AS 'Fecha Nacimiento'
FROM
    empleados
WHERE
    fechaNacimientoEmpleado LIKE '%-11-%'
ORDER BY 1;

-- 3.30. Obtener, por orden alfabético, los nombres de 
--  los empleados que cumplan años en el día de hoy.

SELECT 
    nombreEmpleado AS 'Nombre Empleado', fechaNacimientoEmpleado AS 'Cumpleaños'
FROM
    empleados
WHERE
    fechaNacimientoEmpleado LIKE '17-05-2023'
ORDER BY 1;

-- 3.31. Obtener, por orden alfabético, los nombres de los empleados
-- que cumplen 20 años de trabajo en la empresa en el año actual.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    TIMESTAMPDIFF(YEAR,
        fechaIngresoEmpleado,
        '2023-%-%') = 20
ORDER BY 1;

-- 3.32. Obtener, por orden alfabético, los empleados que  
-- en el día de hoy tienen 20 años cumplidos en la empresa.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
    TIMESTAMPDIFF(YEAR,
        fechaIngresoEmpleado,
        '2023-05-17') = 20
ORDER BY 1;

-- 3.33. Obtener los nombres y salarios de los empleados que hayan empezado 
-- a trabajar en la empresa el año 88 o después, por orden alfabético

SELECT 
    nombreEmpleado AS 'Nombre Empleado',
    salarioEmpleado AS 'Salario'
FROM
    empleados
WHERE
	fechaIngresoEmpleado > '1988-01-01'
ORDER BY 1;

-- 3.34. Obtener, por orden alfabético, los nombres de los empleados 
-- que empezaron a trabajar en la empresa en el año 1966.

SELECT 
    nombreEmpleado AS 'Nombre Empleado'
FROM
    empleados
WHERE
	fechaIngresoEmpleado > '1966-01-01' && fechaIngresoEmpleado < '1967-01-01'
ORDER BY 1;

-- 3.35. Obtener, por orden alfabético, los nombres de los
-- empleados que han ingresado el 01/01/88 o en el día de hoy.

SELECT 
    nombreEmpleado
FROM
    empleados
WHERE
    fechaIngresoEmpleado = '1988-01-01'
        OR fechaIngresoEmpleado = '2023-05-17'
ORDER BY 1;

-- 3.36. Supongamos que, según el convenio laboral de la empresa, para los empleados con más de un año de servicio,
-- el número de días de vacaciones anuales expresado en días laborables es de 20, incrementados en uno más por cada 
-- tres años de servicio cumplidos. Para los empleados que este año cumplen 45 o más años de edad y tienen más de un 
-- año de servicio, hallar por orden alfabético el nombre y el número de días laborables de vacaciones anuales que 
-- corresponde a cada uno.

-- Saltamos hasta el apartado 4 - los ejercicios del apartado 3 están resueltos en la plataforma.

--  GROUP BY:

SELECT 
    idDepartamentoFK AS 'Departamento', COUNT(1) AS 'Plantilla'
FROM
    empleados
GROUP BY idDepartamentoFK
ORDER BY 1;

-- 4.1. Hallar para cada departamento el salario medio, el mínimo y el máximo.

SELECT 
    idDepartamentoFK AS 'Departamento',
    ROUND(AVG(salarioEmpleado), 2) AS 'Salario Medio',
    ROUND(MIN(salarioEmpleado), 2) AS 'Salario Mínimo',
    ROUND(MAX(salarioEmpleado), 2) AS 'Salario Máximo'
FROM
    empleados
GROUP BY idDepartamentoFK -- Si pusiéramos GROUP BY 1 sería lo mismo
ORDER BY 1;

-- 4.2. Hallar por departamentos la edad en años cumplidos del empleado más viejo
-- del departamento que tiene comisión. Ordenar el resultado por edades.

SELECT 
    idDepartamentoFK AS 'Departamento',
    MAX(TIMESTAMPDIFF(YEAR,
        fechaNacimientoEmpleado,
        CURDATE())) AS 'Edad'
FROM
    empleados
WHERE
    comisionEmpleado > 0
GROUP BY idDepartamentoFK
ORDER BY 2;

-- Otra forma de hacer el 4.2 más simple PERO MÁS IMPRECISO (sin tener en cuenta días, meses, etc) :

SELECT 
    idDepartamentoFK AS 'Departamento',
    MAX(YEAR(CURDATE())-YEAR(fechaNacimientoEmpleado)) AS 'Edad'
FROM
    empleados
WHERE
    comisionEmpleado > 0
GROUP BY idDepartamentoFK
ORDER BY 2;

-- 4.3. Agrupando por departamento y número de hijos, hallar cuántos empleados hay en cada grupo.

SELECT 
    idDepartamentoFK AS 'Departamento', hijosEmpleado AS 'Nº hijos', COUNT(1) AS 'Número empleados'
FROM
    empleados
GROUP BY 1, 2
ORDER BY 1, 2;

-- 4.4. Hallar el salario medio y la edad media en años para cada grupo
-- de empleados con igual comisión y para los que no la tengan.

SELECT 
    comisionEmpleado AS 'Comisión empleados',
    AVG(salarioEmpleado) AS 'Salario medio',
    AVG(TIMESTAMPDIFF(YEAR,
        fechaNacimientoEmpleado,
        CURDATE())) AS 'Media edad'
FROM
    empleados
GROUP BY comisionEmpleado;

-- 4.5. Para cada extensión telefónica, hallar cuántos empleados la usan y el salario medio de éstos.

SELECT 
    extensionEmpleado AS 'Extensión',
    AVG(salarioEmpleado) AS 'Salario medio',
    COUNT(1) AS 'Total Empleados'
FROM
    empleados
GROUP BY extensionEmpleado
ORDER BY 1;

-- 4.6. Para cada extensión telefónica y cada departamento hallar 
-- cuántos empleados la usan y el salario medio de éstos

SELECT 
    extensionEmpleado AS 'Extensión',
    AVG(salarioEmpleado) AS 'Salario medio',
    COUNT(1) AS 'Total Empleados'
FROM
    empleados
GROUP BY extensionEmpleado, idDepartamentoFK;

-- 4.7. Hallar los números de extensión telefónica mayores de los 
-- diversos departamentos, sin incluir los números de éstos

SELECT 
    MAX(extensionEmpleado) AS 'Extensión más alta'
FROM
    empleados
GROUP BY idDepartamentoFK;

-- 4.8. Para cada extensión telefónica, hallar el número de departamento a los que sirve.

SELECT 
    extensionEmpleado AS 'Extensión', COUNT(1) AS 'Número de departamentos'
FROM
    empleados
GROUP BY extensionEmpleado;

-- 4.9. Para cada centro, hallar los presupuestos medios de los departamentos dirigidos
-- en propiedad y en funciones, excluyendo del resultado el número del centro.

SELECT 
    CONCAT(AVG(presupuestoDepartamento), ' €') AS 'Presupuestos Medios'
FROM
    departamentos
GROUP BY idCentroTrabajoFK;

-- Cláusula HAVING - 4.10




