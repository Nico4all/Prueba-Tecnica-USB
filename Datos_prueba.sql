/* =========================
   1) CIUDADES (7)
========================= */
INSERT INTO Ciudades (id_ciudad, nombre, pais) VALUES
(1, 'Bogotá', 'Colombia'),
(2, 'Medellín', 'Colombia'),
(3, 'Cali', 'Colombia'),
(4, 'Barranquilla', 'Colombia'),
(5, 'Cartagena', 'Colombia'),
(6, 'Bucaramanga', 'Colombia'),
(7, 'Pereira', 'Colombia');


/* =========================
   2) DEPARTAMENTOS (5)
   (cada uno con ciudad)
========================= */
INSERT INTO Departamento (Iddept, nombre, localizacion, id_ciudad) VALUES
(10, 'Sistemas', 'Torre Norte', 1),
(20, 'Recursos Humanos', 'Torre Sur', 2),
(30, 'Finanzas', 'Edificio Central', 3),
(40, 'Operaciones', 'Planta 1', 4),
(50, 'Soporte', 'Planta 2', 1);


/* =========================
   3) EMPLEADOS (5)
   - 1001 será el jefe de todos
   - 1005 estará retirado
   NOTA: requiere columnas:
   id_ciudad_nacimiento, id_ciudad_residencia
========================= */

-- Jefe (sin jefe)
INSERT INTO Empleado (
  codigo, nombre, apellido, cargo, salario, comision, genero,
  fecha_nacimiento, fecha_ingreso, fecha_retiro,
  Emp_codigo_jefe, Departamento_iddept,
  id_ciudad_nacimiento, id_ciudad_residencia
) VALUES
(1001, 'Laura', 'Gómez', 'Gerente General', 9500000.00, 0.00, 'F',
 '1988-04-12', '2015-02-01', NULL,
 NULL, 10,
 1, 1);

-- Empleados (todos con jefe 1001)
INSERT INTO Empleado (
  codigo, nombre, apellido, cargo, salario, comision, genero,
  fecha_nacimiento, fecha_ingreso, fecha_retiro,
  Emp_codigo_jefe, Departamento_iddept,
  id_ciudad_nacimiento, id_ciudad_residencia
) VALUES
(1002, 'Nicolás', 'Rojas', 'Analista de Sistemas', 4200000.00, 250000.00, 'M',
 '2002-09-20', '2024-07-10', NULL,
 1001, 10,
 2, 1),

(1003, 'Camila', 'Díaz', 'Auxiliar RRHH', 2600000.00, 0.00, 'F',
 '1999-01-05', '2023-03-15', NULL,
 1001, 20,
 5, 2),

(1004, 'Juan', 'Martínez', 'Contador', 3800000.00, 150000.00, 'M',
 '1995-11-23', '2022-06-01', NULL,
 1001, 30,
 3, 6),

-- Retirado
(1005, 'Sofía', 'Pérez', 'Técnico de Soporte', 2400000.00, 0.00, 'F',
 '1997-07-30', '2020-01-15', '2025-12-20',
 1001, 50,
 7, 7);


/* =========================
   4) MOTHERBOARD (5)
========================= */
INSERT INTO Motherboard (nro_serial, descripcion, fabricante, estado) VALUES
('MB-0001', 'Motherboard ATX DDR4', 'ASUS', 'A'),
('MB-0002', 'Motherboard mATX DDR4', 'Gigabyte', 'A'),
('MB-0003', 'Motherboard ATX DDR5', 'MSI', 'A'),
('MB-0004', 'Motherboard ITX DDR4', 'ASRock', 'I'),
('MB-0005', 'Motherboard ATX DDR4', 'Intel', 'A');


/* =========================
   5) COMPUTADORES (5)
   (cada uno con motherboard)
========================= */
INSERT INTO Computadores (
  idcomp, nro_serial, descripcion, estado, Motherboard_nro_serial
) VALUES
('PC-001', 'PCSN-001', 'Equipo Oficina 1', 'A', 'MB-0001'),
('PC-002', 'PCSN-002', 'Equipo Oficina 2', 'A', 'MB-0002'),
('PC-003', 'PCSN-003', 'Equipo Contabilidad', 'A', 'MB-0003'),
('PC-004', 'PCSN-004', 'Equipo Soporte', 'I', 'MB-0004'),
('PC-005', 'PCSN-005', 'Portátil Gerencia', 'A', 'MB-0005');


/* =========================
   6) ASIGNACIONES (3)
========================= */
INSERT INTO Asignaciones (
  idasig, Empleado_codigo, Computadores_idcomp, fecha_asignacion, fecha_devolucion
) VALUES
(1, 1002, 'PC-001', '2025-01-10', NULL),
(2, 1003, 'PC-002', '2025-02-05', NULL),
(3, 1005, 'PC-004', '2024-06-20', '2025-12-20');


/* =========================
   7) ASIGNACIONESV1 (3)
   (PK compuesta)
========================= */
INSERT INTO AsignacionesV1 (
  EMPLEADO_codigo, Computadores_idcomp, fecha_asignacion, fecha_devolucion
) VALUES
(1001, 'PC-005', '2025-03-01', NULL),
(1004, 'PC-003', '2025-03-10', NULL),
(1002, 'PC-002', '2025-04-01', '2025-04-20');