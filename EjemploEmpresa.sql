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