CREATE DATABASE planificador_viajes;
USE planificador_viajes;

CREATE TABLE viaje (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha_inicio DATE,
  fecha_fin DATE
);

CREATE TABLE destino (
  id INT AUTO_INCREMENT PRIMARY KEY,
  ciudad VARCHAR(100),
  localidad VARCHAR(100),
  pais VARCHAR(100),
  viaje_id INT,
  FOREIGN KEY (viaje_id) REFERENCES viajes(id) 
                          ON DELETE CASCADE
);

CREATE TABLE punto_interes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destinos(id) 
                            ON DELETE CASCADE
);

CREATE TABLE alojamiento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  tipo VARCHAR(100),
  precio DECIMAL(10, 2),
  contacto VARCHAR(100),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destinos(id) 
                            ON DELETE CASCADE
);

