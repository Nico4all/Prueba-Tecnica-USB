
-- Tabla Ciudades
CREATE TABLE Ciudades (
  id_ciudad INT PRIMARY KEY,
  nombre VARCHAR(30),
  pais VARCHAR(30)
);

-- Tabla Departamento
CREATE TABLE Departamento (
  Iddept BIGINT PRIMARY KEY,
  nombre VARCHAR(30),
  localizacion VARCHAR(30),
  id_ciudad INT,
  CONSTRAINT fk_departamento_ciudad
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad)
);

-- Tabla Empleado
CREATE TABLE Empleado (
  codigo INT PRIMARY KEY,
  nombre VARCHAR(30),
  apellido VARCHAR(30),
  cargo VARCHAR(50),
  salario DECIMAL(10,2),
  comision DECIMAL(10,2),
  genero CHAR(1),
  fecha_nacimiento DATE,
  fecha_ingreso DATE,
  fecha_retiro DATE,
  Emp_codigo_jefe INT,
  Departamento_iddept BIGINT,
  CONSTRAINT fk_empleado_jefe
    FOREIGN KEY (Emp_codigo_jefe) REFERENCES Empleado(codigo),
  CONSTRAINT fk_empleado_departamento
    FOREIGN KEY (Departamento_iddept) REFERENCES Departamento(Iddept)
);

-- Tabla Motherboard
CREATE TABLE Motherboard (
  nro_serial VARCHAR(30) PRIMARY KEY,
  descripcion VARCHAR(100),
  fabricante VARCHAR(30),
  estado CHAR(1)
);

-- Tabla Computadores
CREATE TABLE Computadores (
  idcomp VARCHAR(30) PRIMARY KEY,
  nro_serial VARCHAR(30),
  descripcion VARCHAR(100),
  estado CHAR(1),
  Motherboard_nro_serial VARCHAR(30),
  CONSTRAINT fk_computadores_motherboard
    FOREIGN KEY (Motherboard_nro_serial) REFERENCES Motherboard(nro_serial)
);

-- Índice en Computadores
CREATE INDEX computadores_idx ON Computadores(Motherboard_nro_serial);

-- Tabla Asignaciones
CREATE TABLE Asignaciones (
  idasig INT PRIMARY KEY,
  Empleado_codigo INT,
  Computadores_idcomp VARCHAR(30),
  fecha_asignacion DATE,
  fecha_devolucion DATE,
  CONSTRAINT fk_asignaciones_empleado
    FOREIGN KEY (Empleado_codigo) REFERENCES Empleado(codigo),
  CONSTRAINT fk_asignaciones_computadores
    FOREIGN KEY (Computadores_idcomp) REFERENCES Computadores(idcomp)
);

-- Tabla AsignacionesV1 (PK compuesta)
CREATE TABLE AsignacionesV1 (
  EMPLEADO_codigo INT,
  Computadores_idcomp VARCHAR(30),
  fecha_asignacion DATE,
  fecha_devolucion DATE,
  PRIMARY KEY (EMPLEADO_codigo, Computadores_idcomp),
  CONSTRAINT fk_asigv1_empleado
    FOREIGN KEY (EMPLEADO_codigo) REFERENCES Empleado(codigo),
  CONSTRAINT fk_asigv1_computadores
    FOREIGN KEY (Computadores_idcomp) REFERENCES Computadores(idcomp)
);