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
  mapa_destino VARCHAR(255),
  viaje_id INT,
  FOREIGN KEY (viaje_id) REFERENCES viaje(id) 
                          ON DELETE CASCADE
);

CREATE TABLE punto_interes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  descripcion TEXT,
  mapa_punto_interes VARCHAR(255),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE
);

CREATE TABLE alojamiento (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  tipo VARCHAR(100),
  precio DECIMAL(10, 2),
  contacto VARCHAR(100),
  mapa_alojamiento VARCHAR(255),
  destino_id INT,
  FOREIGN KEY (destino_id) REFERENCES destino(id) 
                            ON DELETE CASCADE
);

INSERT INTO viaje (nombre, fecha_inicio, fecha_fin) VALUES
('Viaje a Maldivas', '2026-08-01', '2026-08-10'),
('Viaje a Seichelles', '2026-09-05', '2026-09-15'),
('Viaje a Azores', '2026-10-01', '2026-10-08'),
('Viaje a Mauricio', '2026-11-12', '2026-11-22'),
('Viaje a Filipinas', '2027-01-10', '2027-01-25'),
('Viaje a Indonesia', '2027-03-15', '2027-03-30'),
('Viaje a Japón', '2027-04-05', '2027-04-20');

INSERT INTO destino (ciudad, localidad, pais, mapa_destino, viaje_id) VALUES
('Malé', 'Kaafu', 'Maldivas', 'https://maps.example.com/male', 1),
('Victoria', 'Mahé', 'Seichelles', 'https://maps.example.com/victoria', 2),
('Ponta Delgada', 'São Miguel', 'Azores', 'https://maps.example.com/pontadelgada', 3),
('Port Louis', 'Port Louis', 'Mauricio', 'https://maps.example.com/portlouis', 4),
('Manila', 'Metro Manila', 'Filipinas', 'https://maps.example.com/manila', 5),
('Bali', 'Denpasar', 'Indonesia', 'https://maps.example.com/bali', 6),
('Tokio', 'Kanto', 'Japón', 'https://maps.example.com/tokio', 7);

INSERT INTO punto_interes (nombre, descripcion, mapa_punto_interes, destino_id) VALUES
('Playa Hulhumale', 'Playa famosa por sus aguas cristalinas en Malé.', 'https://maps.example.com/hulhumale', 1),
('Jardín Botánico de Seichelles', 'Hermoso jardín tropical en Victoria.', 'https://maps.example.com/botanico', 2),
('Lagoa das Sete Cidades', 'Impresionante lago volcánico en Azores.', 'https://maps.example.com/setecidades', 3),
('Jardín de Pamplemousses', 'Jardín botánico histórico en Mauricio.', 'https://maps.example.com/pamplemousses', 4),
('Intramuros', 'Barrio histórico amurallado en Manila.', 'https://maps.example.com/intramuros', 5),
('Templo Uluwatu', 'Templo hindú en un acantilado en Bali.', 'https://maps.example.com/uluwatu', 6),
('Templo Senso-ji', 'Templo budista más antiguo de Tokio.', 'https://maps.example.com/sensoji', 7);

INSERT INTO alojamiento (nombre, direccion, tipo, precio, contacto, mapa_alojamiento, destino_id) VALUES
('Resort Maldivas', 'Hulhumale, Malé', 'Resort', 350.00, 'info@resortmaldivas.com', 'https://maps.example.com/resortmaldivas', 1),
('Hotel Seichelles', 'Independence Ave, Victoria', 'Hotel', 200.00, 'contacto@hotelseichelles.com', 'https://maps.example.com/hotelseichelles', 2),
('Azores Inn', 'Rua dos Mercadores, Ponta Delgada', 'Posada', 90.00, 'info@azoresinn.com', 'https://maps.example.com/azoresinn', 3),
('Mauricio Suites', 'Royal Road, Port Louis', 'Hotel', 180.00, 'reservas@mauriciosuites.com', 'https://maps.example.com/mauriciosuites', 4),
('Filipinas Hostel', 'Ermita, Manila', 'Hostel', 40.00, 'info@filipinashostel.com', 'https://maps.example.com/filipinashostel', 5),
('Bali Villas', 'Jl. Sunset Road, Bali', 'Villa', 120.00, 'contact@balivillas.com', 'https://maps.example.com/balivillas', 6),
('Tokio Capsule Hotel', 'Asakusa, Tokio', 'Capsule Hotel', 60.00, 'info@tokyocapsule.com', 'https://maps.example.com/tokyocapsule', 7);
