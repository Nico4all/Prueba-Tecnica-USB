-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 20-02-2026 a las 09:31:16
-- Versión del servidor: 11.8.5-MariaDB-ubu2404
-- Versión de PHP: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SanBue`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Asignaciones`
--

CREATE TABLE `Asignaciones` (
  `idasig` int(11) NOT NULL,
  `Empleado_codigo` int(11) DEFAULT NULL,
  `Computadores_idcomp` varchar(30) DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Asignaciones`
--

INSERT INTO `Asignaciones` (`idasig`, `Empleado_codigo`, `Computadores_idcomp`, `fecha_asignacion`, `fecha_devolucion`) VALUES
(1, 1002, 'PC-001', '2025-01-10', NULL),
(2, 1003, 'PC-002', '2025-02-05', NULL),
(3, 1005, 'PC-004', '2024-06-20', '2025-12-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AsignacionesV1`
--

CREATE TABLE `AsignacionesV1` (
  `EMPLEADO_codigo` int(11) NOT NULL,
  `Computadores_idcomp` varchar(30) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `AsignacionesV1`
--

INSERT INTO `AsignacionesV1` (`EMPLEADO_codigo`, `Computadores_idcomp`, `fecha_asignacion`, `fecha_devolucion`) VALUES
(1001, 'PC-005', '2025-03-01', NULL),
(1002, 'PC-002', '2025-04-01', '2025-04-20'),
(1004, 'PC-003', '2025-03-10', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudades`
--

CREATE TABLE `Ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Ciudades`
--

INSERT INTO `Ciudades` (`id_ciudad`, `nombre`, `pais`) VALUES
(1, 'Bogotá', 'Colombia'),
(2, 'Medellín', 'Colombia'),
(3, 'Cali', 'Colombia'),
(4, 'Barranquilla', 'Colombia'),
(5, 'Cartagena', 'Colombia'),
(6, 'Bucaramanga', 'Colombia'),
(7, 'Pereira', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Computadores`
--

CREATE TABLE `Computadores` (
  `idcomp` varchar(30) NOT NULL,
  `nro_serial` varchar(30) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `Motherboard_nro_serial` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Computadores`
--

INSERT INTO `Computadores` (`idcomp`, `nro_serial`, `descripcion`, `estado`, `Motherboard_nro_serial`) VALUES
('PC-001', 'PCSN-001', 'Equipo Oficina 1', 'A', 'MB-0001'),
('PC-002', 'PCSN-002', 'Equipo Oficina 2', 'A', 'MB-0002'),
('PC-003', 'PCSN-003', 'Equipo Contabilidad', 'A', 'MB-0003'),
('PC-004', 'PCSN-004', 'Equipo Soporte', 'I', 'MB-0004'),
('PC-005', 'PCSN-005', 'Portátil Gerencia', 'A', 'MB-0005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE `Departamento` (
  `Iddept` bigint(20) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `localizacion` varchar(30) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Departamento`
--

INSERT INTO `Departamento` (`Iddept`, `nombre`, `localizacion`, `id_ciudad`) VALUES
(10, 'Sistemas', 'Torre Norte', 1),
(20, 'Recursos Humanos', 'Torre Sur', 2),
(30, 'Finanzas', 'Edificio Central', 3),
(40, 'Operaciones', 'Planta 1', 4),
(50, 'Soporte', 'Planta 2', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `comision` decimal(10,2) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_retiro` date DEFAULT NULL,
  `Emp_codigo_jefe` int(11) DEFAULT NULL,
  `Departamento_iddept` bigint(20) DEFAULT NULL,
  `id_ciudad_nacimiento` int(11) DEFAULT NULL,
  `id_ciudad_residencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Empleado`
--

INSERT INTO `Empleado` (`codigo`, `nombre`, `apellido`, `cargo`, `salario`, `comision`, `genero`, `fecha_nacimiento`, `fecha_ingreso`, `fecha_retiro`, `Emp_codigo_jefe`, `Departamento_iddept`, `id_ciudad_nacimiento`, `id_ciudad_residencia`) VALUES
(1001, 'Laura', 'Gómez', 'Gerente General', 9500000.00, 0.00, 'F', '1988-04-12', '2015-02-01', NULL, NULL, 10, 1, 1),
(1002, 'Nicolás', 'Rojas', 'Analista de Sistemas', 4200000.00, 250000.00, 'M', '2002-09-20', '2024-07-10', NULL, 1001, 10, 2, 1),
(1003, 'Camila', 'Díaz', 'Auxiliar RRHH', 2600000.00, 0.00, 'F', '1999-01-05', '2023-03-15', NULL, 1001, 20, 5, 2),
(1004, 'Juan', 'Martínez', 'Contador', 3800000.00, 150000.00, 'M', '1995-11-23', '2022-06-01', NULL, 1001, 30, 3, 6),
(1005, 'Sofía', 'Pérez', 'Técnico de Soporte', 2400000.00, 0.00, 'F', '1997-07-30', '2020-01-15', '2025-12-20', 1001, 50, 7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Motherboard`
--

CREATE TABLE `Motherboard` (
  `nro_serial` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fabricante` varchar(30) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `Motherboard`
--

INSERT INTO `Motherboard` (`nro_serial`, `descripcion`, `fabricante`, `estado`) VALUES
('MB-0001', 'Motherboard ATX DDR4', 'ASUS', 'A'),
('MB-0002', 'Motherboard mATX DDR4', 'Gigabyte', 'A'),
('MB-0003', 'Motherboard ATX DDR5', 'MSI', 'A'),
('MB-0004', 'Motherboard ITX DDR4', 'ASRock', 'I'),
('MB-0005', 'Motherboard ATX DDR4', 'Intel', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Asignaciones`
--
ALTER TABLE `Asignaciones`
  ADD PRIMARY KEY (`idasig`),
  ADD KEY `fk_asignaciones_empleado` (`Empleado_codigo`),
  ADD KEY `fk_asignaciones_computadores` (`Computadores_idcomp`);

--
-- Indices de la tabla `AsignacionesV1`
--
ALTER TABLE `AsignacionesV1`
  ADD PRIMARY KEY (`EMPLEADO_codigo`,`Computadores_idcomp`),
  ADD KEY `fk_asigv1_computadores` (`Computadores_idcomp`);

--
-- Indices de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `Computadores`
--
ALTER TABLE `Computadores`
  ADD PRIMARY KEY (`idcomp`),
  ADD KEY `computadores_idx` (`Motherboard_nro_serial`);

--
-- Indices de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`Iddept`),
  ADD KEY `fk_departamento_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_empleado_jefe` (`Emp_codigo_jefe`),
  ADD KEY `fk_empleado_departamento` (`Departamento_iddept`),
  ADD KEY `fk_empleado_ciudad_nacimiento` (`id_ciudad_nacimiento`),
  ADD KEY `fk_empleado_ciudad_residencia` (`id_ciudad_residencia`);

--
-- Indices de la tabla `Motherboard`
--
ALTER TABLE `Motherboard`
  ADD PRIMARY KEY (`nro_serial`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Asignaciones`
--
ALTER TABLE `Asignaciones`
  ADD CONSTRAINT `fk_asignaciones_computadores` FOREIGN KEY (`Computadores_idcomp`) REFERENCES `Computadores` (`idcomp`),
  ADD CONSTRAINT `fk_asignaciones_empleado` FOREIGN KEY (`Empleado_codigo`) REFERENCES `Empleado` (`codigo`);

--
-- Filtros para la tabla `AsignacionesV1`
--
ALTER TABLE `AsignacionesV1`
  ADD CONSTRAINT `fk_asigv1_computadores` FOREIGN KEY (`Computadores_idcomp`) REFERENCES `Computadores` (`idcomp`),
  ADD CONSTRAINT `fk_asigv1_empleado` FOREIGN KEY (`EMPLEADO_codigo`) REFERENCES `Empleado` (`codigo`);

--
-- Filtros para la tabla `Computadores`
--
ALTER TABLE `Computadores`
  ADD CONSTRAINT `fk_computadores_motherboard` FOREIGN KEY (`Motherboard_nro_serial`) REFERENCES `Motherboard` (`nro_serial`);

--
-- Filtros para la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD CONSTRAINT `fk_departamento_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `Ciudades` (`id_ciudad`);

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `fk_empleado_ciudad_nacimiento` FOREIGN KEY (`id_ciudad_nacimiento`) REFERENCES `Ciudades` (`id_ciudad`),
  ADD CONSTRAINT `fk_empleado_ciudad_residencia` FOREIGN KEY (`id_ciudad_residencia`) REFERENCES `Ciudades` (`id_ciudad`),
  ADD CONSTRAINT `fk_empleado_departamento` FOREIGN KEY (`Departamento_iddept`) REFERENCES `Departamento` (`Iddept`),
  ADD CONSTRAINT `fk_empleado_jefe` FOREIGN KEY (`Emp_codigo_jefe`) REFERENCES `Empleado` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
