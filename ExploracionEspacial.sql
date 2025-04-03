

/* tabla de exploración espacial */

DROP DATABASE IF EXISTS ExploracionEspacial;
CREATE DATABASE ExploracionEspacial;
USE ExploracionEspacial;

CREATE TABLE Planetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Rocoso', 'Gaseoso', 'Hielo', 'Otro') NOT NULL,
    tamaño_km DECIMAL(10,2),
    distancia_años_luz DECIMAL(10,2),
    temperatura_media DECIMAL(5,2),
    tiene_vida BOOLEAN
);

CREATE TABLE Astronomos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50),
    especialidad VARCHAR(100)
);

CREATE TABLE Descubrimientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    planeta_id INT,
    astronomo_id INT,
    fecha DATE,
    metodo ENUM('Telescopio', 'Sonda Espacial', 'Otro'),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id),
    FOREIGN KEY (astronomo_id) REFERENCES Astronomos(id)
);

CREATE TABLE MisionesEspaciales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    agencia VARCHAR(100),
    fecha_lanzamiento DATE,
    estado ENUM('En curso', 'Finalizada', 'Cancelada')
);

CREATE TABLE Misiones_Planetas (
    mision_id INT,
    planeta_id INT,
    PRIMARY KEY (mision_id, planeta_id),
    FOREIGN KEY (mision_id) REFERENCES MisionesEspaciales(id),
    FOREIGN KEY (planeta_id) REFERENCES Planetas(id)
);

-- datos en la tabla de Astrónomos
INSERT INTO Astronomos (nombre, nacionalidad, especialidad)
VALUES 
('Carl Sagan', 'Estados Unidos', 'Astrofísico'),
('Neil deGrasse Tyson', 'Estados Unidos', 'Astrofísico'),
('Vera Rubin', 'Estados Unidos', 'Astrónoma');

-- datos en la tabla de Planetas
INSERT INTO Planetas (nombre, tipo, tamaño_km, distancia_años_luz, temperatura_media, tiene_vida)
VALUES 
('Kepler-452b', 'Rocoso', 12000.00, 1400.00, 15.5, TRUE),
('Jupiter', 'Gaseoso', 139820.00, 5.2, -108.0, FALSE),
('Mars', 'Rocoso', 6779.00, 0.00015, -60.0, FALSE);

-- datos en la tabla de Descubrimientos
INSERT INTO Descubrimientos (planeta_id, astronomo_id, fecha, metodo)
VALUES 
(1, 1, '2015-07-23', 'Telescopio'),
(2, 2, '1610-01-07', 'Telescopio'),
(3, 3, '1965-01-01', 'Telescopio');

-- datos en la tabla de Misiones Espaciales
INSERT INTO MisionesEspaciales (nombre, agencia, fecha_lanzamiento, estado)
VALUES 
('Curiosity', 'NASA', '2011-11-26', 'Finalizada'),
('Juno', 'NASA', '2011-08-05', 'En curso'),
('Viking', 'NASA', '1975-08-20', 'Finalizada');

-- datos en la tabla de Misiones_Planetas
INSERT INTO Misiones_Planetas (mision_id, planeta_id)
VALUES 
(1, 3), 
(2, 2), 
(3, 3); 

-- procedimiento para insertar un nuevo planeta

DELIMITER $$

CREATE PROCEDURE InsertarPlaneta(
    IN nombrePlaneta VARCHAR(100), 
    IN tipoPlaneta VARCHAR(50), 
    IN tamaño DECIMAL(10,2), 
    IN distancia DECIMAL(10,2),
    IN temperatura DECIMAL(5,2),
    IN vida BOOLEAN
)
BEGIN
    INSERT INTO Planetas (nombre, tipo, tamaño_km, distancia_años_luz, temperatura_media, tiene_vida) 
    VALUES (nombrePlaneta, tipoPlaneta, tamaño, distancia, temperatura, vida);
END $$

DELIMITER ;

-- procedimiento para obtener planetas descubiertos por un astrónomo

DELIMITER $$

CREATE PROCEDURE ObtenerPlanetasPorAstronomo(IN nombreAstronomo VARCHAR(100))
BEGIN
    SELECT P.nombre, P.tipo, P.distancia_años_luz 
    FROM Planetas P
    JOIN Descubrimientos D ON P.id = D.planeta_id
    JOIN Astronomos A ON D.astronomo_id = A.id
    WHERE A.nombre = nombreAstronomo;
END $$

DELIMITER ;

-- procedimiento para obtener las misiones que han explorado un planeta

DELIMITER $$

CREATE PROCEDURE ObtenerMisionesPorPlaneta(IN nombrePlaneta VARCHAR(100))
BEGIN
    SELECT M.nombre, M.agencia, M.fecha_lanzamiento, M.estado
    FROM MisionesEspaciales M
    JOIN Misiones_Planetas MP ON M.id = MP.mision_id
    JOIN Planetas P ON MP.planeta_id = P.id
    WHERE P.nombre = nombrePlaneta;
END $$

DELIMITER ;