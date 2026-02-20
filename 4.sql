SELECT
  d.Iddept                           AS id_departamento,
  d.nombre                           AS departamento,
  d.localizacion                     AS localizacion_departamento,
  cd.id_ciudad                       AS id_ciudad_departamento,
  cd.nombre                          AS ciudad_departamento,
  cd.pais                            AS pais_departamento,

  e.codigo                           AS codigo_empleado,
  e.nombre                           AS nombre_empleado,
  e.apellido                         AS apellido_empleado,
  e.cargo                            AS cargo,
  e.salario                          AS salario,
  e.comision                         AS comision,
  e.genero                           AS genero,
  e.fecha_ingreso                    AS fecha_ingreso,

  cr.id_ciudad                       AS id_ciudad_residencia,
  cr.nombre                          AS ciudad_residencia,
  cr.pais                            AS pais_residencia
FROM Empleado e
INNER JOIN Departamento d
  ON d.Iddept = e.Departamento_iddept
INNER JOIN Ciudades cd
  ON cd.id_ciudad = d.id_ciudad
INNER JOIN Ciudades cr
  ON cr.id_ciudad = e.id_ciudad_residencia
WHERE e.id_ciudad_residencia = d.id_ciudad
ORDER BY d.Iddept, e.codigo;