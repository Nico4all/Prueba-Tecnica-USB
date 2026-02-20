/*permite alterar la tabla empleao anadiendo columnas null por default para no tener conflictos*/
ALTER TABLE Empleado
  ADD COLUMN id_ciudad_nacimiento INT NULL,
  ADD COLUMN id_ciudad_residencia INT NULL;

/*agregar fk a las columnas nuevas*/
ALTER TABLE Empleado
  ADD CONSTRAINT fk_empleado_ciudad_nacimiento
    FOREIGN KEY (id_ciudad_nacimiento) REFERENCES Ciudades(id_ciudad)
    ON UPDATE CASCADE
    ON DELETE SET NULL;

ALTER TABLE Empleado
  ADD CONSTRAINT fk_empleado_ciudad_residencia
    FOREIGN KEY (id_ciudad_residencia) REFERENCES Ciudades(id_ciudad)
    ON UPDATE CASCADE
    ON DELETE SET NULL;


/*una vez rellenado los datos de la nueva comulna correspondiente*/
ALTER TABLE Empleado
  MODIFY id_ciudad_nacimiento INT NOT NULL,
  MODIFY id_ciudad_residencia INT NOT NULL;

  

