-- Creamos la base de datos
DROP DATABASE IF EXISTS telecomunicaciones;
CREATE DATABASE telecomunicaciones;
USE telecomunicaciones;

-- Creamos las tablas e importamos los datos
/* DatosAccesos: Tabla con los datos sobre la cantidad de accesos a internet 
segun la tecnologia, la velocidad de descarga, por provincia, trimestre y anio */
DROP TABLE IF EXISTS DatosAccesos;
CREATE TABLE DatosAccesos (
	Anio INT,
    Trimestre INT,
    Provincia VARCHAR(255),
    Accesos_por_cada_100_hogares FLOAT,
    Accesos_por_cada_100_hab FLOAT,
    Banda_ancha_fija INT,
    Dial_up FLOAT,
    ADSL FLOAT,
    Cablemodem FLOAT,
    Fibra_optica FLOAT,
    Wireless FLOAT,
    Otras_tecnologias FLOAT,
    Mbps_Media_de_bajada FLOAT,
    HASTA_512_kbps FLOAT,
    Mas_512_Kbps_1_Mbps FLOAT,
    Mas_1_Mbps_6_Mbps FLOAT,
    Mas_6_Mbps_10_Mbps FLOAT,
    Mas_10_Mbps_20_Mbps FLOAT,
    Mas_20_Mbps_30_Mbps FLOAT,
    Mas_30_Mbps FLOAT,
    Otras_velocidades FLOAT,
    Total_accesos FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/accesos_internet_provincias.csv'
INTO TABLE DatosAccesos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

/*AccesosLocalidades: Contiene la informacion acerca de la cantidad de accesos
segun la tecnologia, velocidad de descarga y localidad de Argentina */

DROP TABLE IF EXISTS AccesosLocalidades;
CREATE TABLE AccesosLocalidades (
    Provincia VARCHAR(255),
    Partido VARCHAR(255),
    Localidad VARCHAR(255),
    Otras_Velocidades FLOAT,
    Hasta_512_Kbps FLOAT,
    Mas_512_Kbps_1_Mbps FLOAT,
    Mas_1_Mbps_6_Mbps FLOAT,
    Mas_6_Mbps_10_Mbps FLOAT,
    Mas_10_Mbps_20_Mbps FLOAT,
    Mas_20_Mbps_30_Mbps FLOAT,
    Mas_30_Mbps FLOAT,
    Adsl INT,
    Cablemodem INT,
    Dial_Up INT,
    Fibra_Optica INT,
    Otras_Tecnologias INT,
    Satelital INT,
    Wimax INT,
    Wireless INT,
    Poblacion INT,
    Latitud FLOAT,
    Longitud FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/accesos_localidades.csv'
INTO TABLE AccesosLocalidades
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

/*TelefoniaMovil: contiene informacion acerca de la cantidad de accesos a telefonia movil,
cantidad de llamadas y minutos realizados segun la modalidad de contrato, y la cantidaad de 
accesos cada 100 hab y cantidad de SMS salientes, segun trimestre y anio */

DROP TABLE IF EXISTS TelefoniaMovil;
CREATE TABLE TelefoniaMovil (
    Anio INT,
    Trimestre INT,
    Total_de_accesos_pospago INT,
    Total_de_accesos_prepago INT,
    Total_de_accesos_operativos INT,
    Llamadas_pospago_salientes INT,
    Llamadas_prepago_salientes INT,
    Total_de_llamadas_salientes INT,
    Minutos_pospago_salientes INT,
    Minutos_prepago_salientes INT,
    Total_de_minutos_salientes INT,
    Accesos_por_cada_100_hab FLOAT,
    Numero_de_SMS_salientes BIGINT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/telefonia.csv'
INTO TABLE TelefoniaMovil
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

/* Ingresos: contiene informacion acerca de la cantidad de ingresos en miles de pesos
de la industria de los servicios de internet y de la telefonia movil*/
DROP TABLE IF EXISTS Ingresos;
CREATE TABLE Ingresos(
	Anio INT,
    Trimestre INT,
    Ingresos_Internet_miles_pesos INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ingresos_internet.csv'
INTO TABLE Ingresos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES; 

DROP TABLE IF EXISTS Ingresos_telefonia_movil;
CREATE TABLE Ingresos_telefonia_movil(
	Anio INT,
    Trimestre INT,
    Ingresos_telefonia_miles_pesos INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ingresos_telefonia_movil.csv'
INTO TABLE Ingresos_telefonia_movil
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Unimos las dos tablas
ALTER TABLE Ingresos
ADD COLUMN Ingresos_telefonia_miles_pesos INT;

UPDATE Ingresos AS I
JOIN Ingresos_telefonia_movil AS ITM
ON I.Anio = ITM.Anio AND I.Trimestre = ITM.Trimestre
SET I.Ingresos_telefonia_miles_pesos = ITM.Ingresos_telefonia_miles_pesos;

DROP TABLE IF EXISTS ingresos_telefonia_movil;

-- Creamos una tabla que contenga un listado de provincias de argentina
DROP TABLE IF EXISTS Provincias;
CREATE TABLE Provincias (
    Id_Provincia INT AUTO_INCREMENT PRIMARY KEY,
    Provincia VARCHAR(255) NOT NULL
);

-- Insertamos el listado de provincias de la tabla de DatosAccesos
INSERT INTO Provincias (Provincia)
SELECT DISTINCT Provincia
FROM DatosAccesos;

-- Modificamos la tabla DatosAccesos agregando una nueva columna 'Id_Provincia'
ALTER TABLE datosaccesos
ADD COLUMN Id_Provincia INT;

-- Unimos ambas tablas para agregar el id de cada provincia
UPDATE DatosAccesos AS da
JOIN Provincias AS p ON da.Provincia = p.Provincia
SET da.Id_Provincia = p.Id_Provincia;

-- Eliminamos la columna Provincia de la tabla DatosAccesos
ALTER TABLE DatosAccesos
DROP COLUMN Provincia;

-- Realizamos el mismo proceso para la tabla AccesosLocalidades
ALTER TABLE AccesosLocalidades
ADD COLUMN Id_Provincia INT;

UPDATE AccesosLocalidades AS al
JOIN Provincias AS p ON al.Provincia = p.Provincia
SET al.Id_Provincia = p.Id_Provincia;

ALTER TABLE AccesosLocalidades
DROP COLUMN Provincia;

-- Realizamos el mismo procedimiento para crear una tabla de Partidos de Argentina 
DROP TABLE IF EXISTS Partidos;
CREATE TABLE Partidos (
    Id_Partido INT AUTO_INCREMENT PRIMARY KEY,
    Partido VARCHAR(255) NOT NULL,
    Id_Provincia INT
);

INSERT INTO Partidos (Partido, Id_Provincia)
SELECT DISTINCT Partido, Id_Provincia
FROM AccesosLocalidades;

-- Vemos que hay un registro nulo que coincide con Caba
SELECT * FROM AccesosLocalidades
WHERE Id_Provincia IS NULL;

-- Modificamos la tabla para completar ese campo
UPDATE AccesosLocalidades
SET Id_Provincia = 2
WHERE Id_Provincia IS NULL;

ALTER TABLE AccesosLocalidades
ADD COLUMN Id_Partido INT;

UPDATE AccesosLocalidades AS al
JOIN Partidos AS p ON al.Partido = p.Partido
SET al.Id_Partido = p.Id_Partido;

ALTER TABLE AccesosLocalidades
DROP COLUMN Partido;

-- Configuramos como claves foraneas a las columnas de Id en la tabla DatosAccesos
ALTER TABLE AccesosLocalidades
ADD FOREIGN KEY (Id_Partido) REFERENCES Partidos(Id_Partido);

ALTER TABLE DatosAccesos
ADD FOREIGN KEY (Id_Provincia) REFERENCES Provincias(Id_Provincia);

ALTER TABLE Partidos
ADD FOREIGN KEY (Id_Provincia) REFERENCES Provincias(Id_Provincia);

-- Agregamos una columna con Id_Localidad para la tabla AccesosLocalidades
ALTER TABLE AccesosLocalidades
ADD COLUMN Id_Localidad INT AUTO_INCREMENT PRIMARY KEY;

-- Creamos una tabla calendario
DROP TABLE IF EXISTS Calendario;
CREATE TABLE Calendario (
	Id_Fecha INT AUTO_INCREMENT PRIMARY KEY,
    Anio INT,
    Trimestre INT,
    FechaInicio DATE,
    FechaFin DATE
);

-- Llenamos la tabla de calendario con años y trimestres de nuestra tabla DatosAccesos
INSERT INTO Calendario (Anio, Trimestre)
SELECT DISTINCT Anio, Trimestre
FROM TelefoniaMovil
ORDER BY Anio ASC, Trimestre ASC;

-- Actualizamos las fechas de inicio
UPDATE Calendario
SET FechaInicio = CONCAT(Anio, '-', (Trimestre - 1) * 3 + 1, '-01');

-- Actualizamos las fechas de fin
UPDATE Calendario
SET FechaFin = DATE_ADD(LAST_DAY(FechaInicio), INTERVAL 2 MONTH);

-- Agregamos la columna Id_Fecha a las tablas DatosAccesos, TelefoniaMovil e Ingresos
ALTER TABLE datosaccesos
ADD COLUMN Id_Fecha INT;

UPDATE DatosAccesos AS da
INNER JOIN Calendario AS c
ON da.Anio = c.Anio AND da.Trimestre = c.Trimestre
SET da.Id_Fecha = c.Id_Fecha;

ALTER TABLE TelefoniaMovil
ADD COLUMN Id_Fecha INT;

UPDATE TelefoniaMovil AS t
INNER JOIN Calendario AS c
ON t.Anio = c.Anio AND t.Trimestre = c.Trimestre
SET t.Id_Fecha = c.Id_Fecha;

ALTER TABLE Ingresos
ADD COLUMN Id_Fecha INT;

UPDATE Ingresos AS i
INNER JOIN Calendario AS c
ON i.Anio = c.Anio AND i.Trimestre = c.Trimestre
SET i.Id_Fecha = c.Id_Fecha;

-- Eliminamos las columnas Anio y Trimestre de las tablas
ALTER TABLE datosaccesos
DROP COLUMN Anio, DROP COLUMN Trimestre;

ALTER TABLE TelefoniaMovil
DROP COLUMN Anio, DROP COLUMN Trimestre;

ALTER TABLE Ingresos
DROP COLUMN Anio, DROP COLUMN Trimestre;

-- Configuramos como clave foranea la columna Id_Fecha
ALTER TABLE DatosAccesos
ADD FOREIGN KEY (Id_Fecha) REFERENCES Calendario(Id_Fecha);

ALTER TABLE TelefoniaMovil
ADD FOREIGN KEY (Id_Fecha) REFERENCES Calendario(Id_Fecha);

ALTER TABLE Ingresos
ADD FOREIGN KEY (Id_Fecha) REFERENCES Calendario(Id_Fecha);

/* Creamos las claves primarias de las tablas faltantes */
ALTER TABLE datosaccesos
ADD COLUMN Id_Accesos INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE ingresos
ADD COLUMN Id_ingresos INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE telefoniamovil
ADD COLUMN Id_Accesos_Telefonicos INT AUTO_INCREMENT PRIMARY KEY;


/* Nos damos cuenta que es redundante tener la columna Id_Provincia en 
la tabla AccesosLocalidades, ya que podemos llegar a ello a traves de la tabla
Partidos, por lo que decidimos eliminarla */

ALTER TABLE AccesosLocalidades
DROP COLUMN Id_Provincia;