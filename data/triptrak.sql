CREATE DATABASE triptrak;
USE triptrak;

CREATE TABLE viaje (
  idViaj INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  fechInic DATE,
  fechFin DATE
);

CREATE TABLE nota (
  idNota INT AUTO_INCREMENT PRIMARY KEY,
  nomNota VARCHAR(100),
  fechNota DATETIME,
  diaViaj DATETIME,
  diaSem VARCHAR(20),
  planDia VARCHAR(300),
  comentDia VARCHAR(300),
  idViaj INT,
  FOREIGN KEY (idViaj) REFERENCES viaje(idViaj) 
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE destino (
  idDest INT AUTO_INCREMENT PRIMARY KEY,
  locDest VARCHAR(100),
  ciudDest VARCHAR(100),
  paisDest VARCHAR(100),
  fechLleg DATE,
  fechSal DATE,
  imgDest VARCHAR(255),
  mapDest VARCHAR(255),
  idViaj INT,
  FOREIGN KEY (idViaj) REFERENCES viaje(idViaj) 
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE punto_interes (
  idPunt INT AUTO_INCREMENT PRIMARY KEY,
  nomPunt VARCHAR(100),
  descPunt TEXT,
  imgPunt VARCHAR(255),
  mapPunt VARCHAR(255),
  idDest INT,
  FOREIGN KEY (idDest) REFERENCES destino(idDest) 
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE alojamiento (
  idAloj INT AUTO_INCREMENT PRIMARY KEY,
  nomAloj VARCHAR(100),
  tipoAloj VARCHAR(50),
  dirAloj VARCHAR(255),
  precAloj DECIMAL(10, 2),
  fechLleg DATE,
  fechSal DATE,
  emailAloj VARCHAR(100),
  telAloj VARCHAR(15),
  imgAloj VARCHAR(255),
  mapAloj VARCHAR(255),
  idDest INT,
  FOREIGN KEY (idDest) REFERENCES destino(idDest) 
  ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO viaje (nombre, fechInic, fechFin) VALUES
('Viaje a Maldivas', '2026-08-01', '2026-08-10'),
('Viaje a Seichelles', '2026-09-05', '2026-09-15'),
('Viaje a Azores', '2026-10-01', '2026-10-08'),
('Viaje a Mauricio', '2026-11-12', '2026-11-22'),
('Viaje a Filipinas', '2027-01-10', '2027-01-25'),
('Viaje a Indonesia', '2027-03-15', '2027-03-30'),
('Viaje a Japón', '2027-04-05', '2027-04-20');

INSERT INTO destino (locDest, ciudDest, paisDest, fechLleg, fechSal, imgDest, mapDest, idViaj) VALUES
('Atolón de Malé', 'Kaafu', 'Maldivas', '2026-08-01', '2026-08-10', 'https://example.com/male.jpg', 'https://maps.example.com/male', 1),
('Isla de Praslin', 'Praslin', 'Seichelles', '2026-09-05', '2026-09-15', 'https://example.com/praslin.jpg', 'https://maps.example.com/praslin', 2),
('Ponta Delgada', 'São Miguel', 'Azores', '2026-10-01', '2026-10-08', 'https://example.com/pontadelgada.jpg', 'https://maps.example.com/pontadelgada', 3),
('Port Louis', 'Mauricio', 'Mauricio', '2026-11-12', '2026-11-22', 'https://example.com/portlouis.jpg', 'https://maps.example.com/portlouis', 4),
('Manila', 'Luzón', 'Filipinas', '2027-01-10', '2027-01-25', 'https://example.com/manila.jpg', 'https://maps.example.com/manila', 5),
('Bali', 'Bali', 'Indonesia', '2027-03-15', '2027-03-30', 'https://example.com/bali.jpg', 'https://maps.example.com/bali', 6),
('Tokio', 'Honshu', 'Japón', '2027-04-05', '2027-04-20', 'https://example.com/tokio.jpg', 'https://maps.example.com/tokio', 7); 

INSERT INTO punto_interes (nomPunt, descPunt, imgPunt, mapPunt, idDest) VALUES
('Playa de arena blanca', 'Una hermosa playa de arena blanca con aguas cristalinas.', 'https://example.com/playablanca.jpg', 'https://maps.example.com/playablanca', 1),
('Reserva Natural de Vallée de Mai', 'Un sitio declarado Patrimonio de la Humanidad por la UNESCO, hogar de la palmera Coco de Mer.', 'https://example.com/valle.jpg', 'https://maps.example.com/valle', 2),
('Lagoa das Sete Cidades', 'Una impresionante laguna situada en el cráter de un volcán extinto.', 'https://example.com/setecidades.jpg', 'https://maps.example.com/setecidades', 3),
('Jardín Botánico de Pamplemousses', 'Un jardín botánico famoso por su colección de plantas tropicales y exóticas.', 'https://example.com/pamplemousses.jpg', 'https://maps.example.com/pamplemousses', 4),
('Intramuros', 'El casco antiguo amurallado de Manila, lleno de historia y arquitectura colonial española.', 'https://example.com/intramuros.jpg', 'https://maps.example.com/intramuros', 5),
('Templo Uluwatu', 'Un templo hindú situado en un acantilado con vistas al océano.', 'https://example.com/uluwatu.jpg', 'https://maps.example.com/uluwatu', 6),
('Templo Senso-ji', 'El templo más antiguo de Tokio, dedicado a la diosa Kannon.', 'https://example.com/sensoji.jpg', 'https://maps.example.com/sensoji', 7); 

INSERT INTO alojamiento (nomAloj, tipoAloj, dirAloj, precAloj, fechLleg, fechSal, emailAloj, telAloj, imgAloj, mapAloj, idDest) VALUES
('Resort Maldivas', 'Resort', 'Atolón de Malé', 200.00, '2026-08-01', '2026-08-10', 'info@resortmaldivas.com', '+591 12345678', 'https://example.com/resortmaldivas.jpg', 'https://maps.example.com/resortmaldivas', 1),
('Hotel Praslin', 'Hotel', 'Isla de Praslin', 150.00, '2026-09-05', '2026-09-15', 'info@hotelpraslin.com', '+591 87654321', 'https://example.com/hotelpraslin.jpg', 'https://maps.example.com/hotelpraslin', 2),
('Pousada São Miguel', 'Pousada', 'Ponta Delgada', 100.00, '2026-10-01', '2026-10-08', 'info@pousadasaomiguel.com', '+591 55555555', 'https://example.com/pousadasaomiguel.jpg', 'https://maps.example.com/pousadasaomiguel', 3),
('Hotel Port Louis', 'Hotel', 'Port Louis', 120.00, '2026-11-12', '2026-11-22', 'info@hotelportlouis.com', '+591 44444444', 'https://example.com/hotelportlouis.jpg', 'https://maps.example.com/hotelportlouis', 4);

INSERT INTO nota (nomNota, fechNota, diaViaj, diaSem, planDia, comentDia, idViaj) VALUES
('Día de llegada a Maldivas', '2026-08-01 10:00:00', '2026-08-01', 'Sábado', 'Llegada al aeropuerto y traslado al resort.', 'El vuelo fue tranquilo y el traslado al resort fue rápido.', 1),
('Explorando la Isla de Praslin', '2026-09-06 14:00:00', '2026-09-06', 'Domingo', 'Visita a la Reserva Natural de Vallée de Mai.', 'La reserva es impresionante, especialmente la palmera Coco de Mer.', 2),
('Día en Ponta Delgada', '2026-10-02 09:00:00', '2026-10-02', 'Viernes', 'Paseo por el centro histórico y visita a la Lagoa das Sete Cidades.', 'El centro histórico es encantador y la laguna es espectacular.', 3),
('Jardín Botánico en Mauricio', '2026-11-13 11:00:00', '2026-11-13', 'Viernes', 'Visita al Jardín Botánico de Pamplemousses.', 'El jardín es hermoso y tiene una gran variedad de plantas tropicales.', 4);