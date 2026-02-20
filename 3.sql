/*updatear todos los empleados para que tengan un valor en las columnas de ciudad de nacimiento y residencia, asignando un valor por defecto (en este caso, 1) a aquellos que no lo tengan*/
UPDATE Empleado
SET
  id_ciudad_nacimiento = 1,
  id_ciudad_residencia = 1
WHERE
  id_ciudad_nacimiento IS NULL
  OR id_ciudad_residencia IS NULL;

/*updatear empleados por codigo */
UPDATE Empleado
SET
  id_ciudad_nacimiento = NULL,
  id_ciudad_residencia = NULL
WHERE codigo IN (1003, 1010);

/*updatear empleado esepcifico*/
UPDATE Empleado
SET
  id_ciudad_nacimiento = 3,
  id_ciudad_residencia = 5
WHERE codigo = 1002;

