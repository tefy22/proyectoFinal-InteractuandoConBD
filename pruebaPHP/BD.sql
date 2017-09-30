-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para agenda
CREATE DATABASE IF NOT EXISTS `agenda` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `agenda`;

-- Volcando estructura para tabla agenda.evento
CREATE TABLE IF NOT EXISTS `evento` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `hora_ini` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `dia_completo` bit(1) DEFAULT NULL,
  `usuario` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_evento_usuario` (`usuario`),
  CONSTRAINT `FK_evento_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla agenda.evento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`id`, `titulo`, `fecha_inicio`, `fecha_fin`, `hora_ini`, `hora_fin`, `dia_completo`, `usuario`) VALUES
	(4, 'cumpleaÃ±os valentina', '2017-10-03', NULL, '00:00:00', NULL, b'1', 1094267608),
	(5, 'cita medica', '2017-10-02', '2017-09-07', '05:00:00', '05:30:00', b'1', 1094267608),
	(6, 'cita medica', '2017-10-05', '2017-09-07', '00:00:00', '05:30:00', b'1', 1094267608);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;

-- Volcando estructura para procedimiento agenda.guardarUser
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `guardarUser`(
	in id int(10),
	in nom varchar(50),
	in email varchar(30),
	in pass varchar(100),
	in fechaN date)
BEGIN
	insert into usuario values (id, nom, email, pass, fechaN);
END//
DELIMITER ;

-- Volcando estructura para tabla agenda.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contrasenna` varchar(100) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla agenda.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `email`, `contrasenna`, `nacimiento`) VALUES
	(1094267608, 'Stefania Afanador', 'sa.ortega19@gmail.com', '$2y$10$LpBGU2qQwb7bE.lnx5LAeOb6aNnFdY1i30mCEaSXdHK1t48jJKQhu', '1991-10-22');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
