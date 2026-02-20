ALTER TABLE Empleado
  ADD COLUMN id_ciudad_nacimiento INT NULL,
  ADD COLUMN id_ciudad_residencia INT NULL;

ALTER TABLE Empleado
  ADD CONSTRAINT fk_empleado_ciudad_nacimiento
    FOREIGN KEY (id_ciudad_nacimiento) REFERENCES Ciudades(id_ciudad);

ALTER TABLE Empleado
  ADD CONSTRAINT fk_empleado_ciudad_residencia
    FOREIGN KEY (id_ciudad_residencia) REFERENCES Ciudades(id_ciudad);