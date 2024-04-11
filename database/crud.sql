-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-01-2023 a las 03:30:47
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spinsertardetalle` (`idProduct` INT, `idVent` INT, `cantida` INT)  BEGIN 
	DECLARE precio double;
	set precio=(SELECT precio from productos WHERE id=idProducto);
	INSERT INTO detalleventa(idProducto,idVenta,cantidad,subtotal)
	VALUES(idProduct,idVent,cantida,cantida*precio);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `fechaRegistro` date NOT NULL DEFAULT current_timestamp(),
  `edad` int(11) NOT NULL,
  `peso` float NOT NULL,
  `talla` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombres`, `apellidos`, `fechaRegistro`, `edad`, `peso`, `talla`) VALUES
(3, '74968016', 'Mario Jhanpier', 'Chamba Yarleque', '2023-01-13', 18, 76, 1.7),
(4, '45348901', 'Rosa Ezequiela', 'Chinguel Rojas', '2023-01-13', 20, 70, 1.69),
(8, '12345678', 'Rosa Domador', 'Manrique', '2023-01-13', 20, 78, 1.65),
(9, '21233465', 'Julian Coveñas', 'Florez', '2023-01-13', 21, 80, 1.69),
(10, '32213456', 'Gianella Fernandez', 'Sernaque', '2023-01-13', 29, 20, 1.8),
(11, '67452345', 'Jorge', 'Niño Valdiviezo', '2023-01-13', 19, 75, 1.53),
(12, '67545634', 'Mateo', 'Rivera Ypanaque', '2023-01-13', 25, 79, 1.74),
(13, '23341234', 'Emilia', 'Cardoza Garcia', '2023-01-13', 28, 83, 1.59),
(14, '65438765', 'Pedro', 'Farfan Olivares', '2023-01-13', 40, 81, 1.71),
(15, '34234576', 'Maria', 'Calderon Zarzosa', '2023-01-13', 24, 86, 1.74),
(16, '23875467', 'Flor', 'Yarleque Diaz', '2023-01-13', 33, 84, 1.63),
(17, '34563499', 'Sergio', 'Troncos Manrique', '2023-01-13', 18, 90, 1.64);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `idDetallaVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleventa`
--

INSERT INTO `detalleventa` (`idDetallaVenta`, `idProducto`, `idVenta`, `cantidad`, `subtotal`) VALUES
(2, 8, 1, 1, 6),
(3, 23, 1, 2, 78),
(4, 8, 1, 4, 51),
(5, 23, 1, 5, 12),
(6, 11, 2, 3, 5),
(7, 3, 2, 6, 9),
(8, 12, 3, 1, 1),
(9, 20, 3, 2, 5),
(10, 13, 4, 4, 2),
(11, 18, 4, 3, 1),
(12, 6, 5, 6, 22),
(13, 22, 5, 8, 9),
(14, 17, 6, 3, 0),
(15, 19, 6, 5, 14),
(16, 9, 7, 6, 10),
(17, 21, 7, 2, 3),
(18, 16, 8, 8, 4),
(19, 21, 8, 4, 6),
(20, 16, 9, 7, 3),
(21, 5, 9, 5, 9),
(22, 7, 10, 6, 28),
(23, 10, 10, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `stock`) VALUES
(1, 'fideos', 2.8, 20),
(2, 'Maiz', 4, 20),
(3, 'Avena', 1.5, 20),
(4, 'Arroz', 3.5, 20),
(5, 'Papel Higienico', 1.8, 20),
(6, 'Detergente', 3.8, 20),
(7, 'Pasta dental', 4.8, 20),
(8, 'Aceite', 12.8, 20),
(9, 'Lejia', 1.8, 20),
(10, 'Prestobarba', 3.5, 20),
(11, 'Aromatizante', 1.8, 20),
(12, 'Cafe', 1.4, 20),
(13, 'Cocoa', 0.7, 20),
(14, 'Vinagre', 2.5, 20),
(15, 'Sillao', 1, 20),
(16, 'Panquita', 0.5, 20),
(17, 'Fosforos', 0.2, 20),
(18, 'Comino', 0.5, 20),
(19, 'Inka Kola', 2.8, 20),
(20, 'Coca Cola', 2.7, 20),
(21, 'Milo', 1.5, 20),
(22, 'Eco', 1.2, 20),
(23, 'Ajinomix', 2.5, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `correlativoVenta` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `idcliente` int(11) NOT NULL,
  `montoTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`correlativoVenta`, `fecha`, `idcliente`, `montoTotal`) VALUES
(1, '2023-01-13', 8, 0),
(2, '2023-01-13', 9, 0),
(3, '2023-01-13', 13, 0),
(4, '2023-01-13', 16, 0),
(5, '2023-01-13', 10, 0),
(6, '2023-01-13', 15, 0),
(7, '2023-01-13', 17, 0),
(8, '2023-01-13', 4, 0),
(9, '2023-01-13', 14, 0),
(10, '2023-01-13', 11, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`idDetallaVenta`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`correlativoVenta`),
  ADD KEY `idcliente` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `idDetallaVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `correlativoVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `detalleventa_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `detalleventa_ibfk_2` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`correlativoVenta`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
