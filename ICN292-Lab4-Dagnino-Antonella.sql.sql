DROP DATABASE IF EXISTS austral;
CREATE DATABASE austral CHARACTER SET utf8mb4;
USE austral;

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre   VARCHAR(80) NOT NULL,
    pais     VARCHAR(60),
    genero   ENUM('Cómic','Ensayo','Infantil','Novela','Poesía') NOT NULL
);

CREATE TABLE colecciones (
    id_coleccion      INT AUTO_INCREMENT PRIMARY KEY,
    titulo            VARCHAR(120) NOT NULL,
    fecha_publicacion DATE
);

CREATE TABLE libros (
    id_libro            INT AUTO_INCREMENT PRIMARY KEY,
    id_autor            INT NOT NULL,
    id_coleccion        INT,
    titulo              VARCHAR(120) NOT NULL,
    paginas             INT,
    ejemplares_vendidos INT,
    anio                INT,
    FOREIGN KEY (id_autor)     REFERENCES autores(id_autor),
    FOREIGN KEY (id_coleccion) REFERENCES colecciones(id_coleccion)
);

CREATE TABLE pagos (
    id_pago    INT AUTO_INCREMENT PRIMARY KEY,
    id_autor   INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto      DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- Carga oficial: autores (ids 1 a 6 por orden de inserción)
INSERT INTO autores (nombre, pais, genero) VALUES
('Elena Pizarro',     'Chile',          'Novela'),
('Harold Finch',      'Inglaterra',     'Ensayo'),
('Rodrigo Bahamonde', 'Chile',          'Poesía'),
('Valentina Correa',  'Argentina',      'Infantil'),
('Nora Keller',       'Estados Unidos', 'Novela'),
('Kenji Arakawa',     NULL,             'Cómic');

-- Carga oficial: libros (sin colección)
INSERT INTO libros (id_autor, titulo, paginas, ejemplares_vendidos, anio) VALUES
(1, 'Cielo de Enero',      210, 1500, 2024),
(1, 'Marea Baja',          185,  800, 2023),
(1, 'El Norte',            200, 2200, 2024),
(2, 'Estrellas que Caen',  240, 3000, 2022),
(2, 'Máquinas',            215,  450, 2024),
(3, 'Luz Artificial',      300, 1200, 2024),
(3, 'Ruido Blanco',        260,  600, 2023),
(3, 'El Barrio de Lila',   190, 5000, 2024),
(4, 'Antes del Amanecer',  205, 2700, 2024),
(4, 'La Calle 8',          175,  900, 2023),
(5, 'Flor de Hierro',      195, 4100, 2024),
(5, 'Hora Dorada',         220, 1800, 2022);