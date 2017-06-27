-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2017 a las 18:07:43
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chile_regional`
--
CREATE DATABASE IF NOT EXISTS `chile_regional` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `chile_regional`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficiario`
--

CREATE TABLE `beneficiario` (
  `id` int(11) NOT NULL,
  `rut` int(8) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `telefono` int(9) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `beneficiario`
--

INSERT INTO `beneficiario` (`id`, `rut`, `dv`, `nombres`, `paterno`, `materno`, `telefono`, `email`, `cliente_id`) VALUES
(1, 12345678, '9', 'BENFICIARIO 1', 'BENFICIARIO 1', 'BENFICIARIO 1', NULL, 'alejandro@gmail.com', 1),
(2, 12345677, '9', 'BENFICIARIO 2', 'BENFICIARIO 2', 'BENFICIARIO 2', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(37, 'SEGUROS DE VIDA'),
(38, 'ASISTENCIA EN VIAJE'),
(39, 'ACCIDENTES PERSONALES'),
(40, 'CATASTRÓFICOS Y ONCOLÓGICOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `rut` int(8) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `fecha_nac` date NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(9) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `rut`, `dv`, `clave`, `fecha_nac`, `nombres`, `paterno`, `materno`, `sexo`, `direccion`, `telefono`, `email`) VALUES
(1, 11111111, '9', '1234', '1990-06-01', 'CLIENTE 1', 'PATERNO', 'MATERNO', 'MASCULINO', 'MI CASA', 321654987, 'alejandro@gmail.com'),
(2, 22222222, '9', '1234', '1988-10-11', 'CLIENTE 2', 'PATERNO', 'MATERNO', 'MASCULINO', 'SU CASA', 639852147, 'alejandro@gmail.com'),
(10, 33333333, '5', '1234', '2000-02-15', 'CLIENTE 3', 'PATERNO', 'MATERNO', 'MASCULINO', 'DDASD', 32165487, 'alejandro.isla.c@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `categoria_producto` varchar(45) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_termino` datetime NOT NULL,
  `capital_uf` float NOT NULL,
  `capital_pesos` float NOT NULL,
  `prima_uf` float NOT NULL,
  `prima_pesos` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id`, `cliente_id`, `fecha`, `categoria_producto`, `nombre_producto`, `fecha_inicio`, `fecha_termino`, `capital_uf`, `capital_pesos`, `prima_uf`, `prima_pesos`) VALUES
(1, 1, '2017-06-01 00:00:00', 'DSAD', 'DSADA', '2017-06-01 00:00:00', '2017-06-01 00:00:00', 2500, 2500, 2500, 2400);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_beneficiario`
--

CREATE TABLE `contrato_beneficiario` (
  `contrato_id` int(11) NOT NULL,
  `beneficiario_id` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contrato_beneficiario`
--

INSERT INTO `contrato_beneficiario` (`contrato_id`, `beneficiario_id`, `porcentaje`) VALUES
(1, 1, 50),
(1, 2, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `rut` int(8) NOT NULL,
  `dv` varchar(1) NOT NULL,
  `clave` varchar(64) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `telefono` int(9) NOT NULL,
  `email` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `tipo_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `rut`, `dv`, `clave`, `nombres`, `paterno`, `materno`, `telefono`, `email`, `activo`, `tipo_usuario_id`) VALUES
(1, 55555555, '1', '1234', 'VENDEDOR 1', 'PATERNO', 'MATERNO', 123456789, 'alejandro@gmail.com', 1, 3),
(2, 11111111, '9', '1234', 'SUPERADMIN 1', 'PATERNO', 'MATERNO', 322929436, 'alejandro.isla.c@gmail.com', 1, 1),
(18, 22222222, '2', '1234', 'SUPERVISOR 1', 'PATERNO', 'MATERNO', 321654987, 'super@gmail.com', 1, 2),
(19, 66666666, 'K', '1234', 'VENDEDOR 2', 'PATERNO', 'MATERNO', 326549871, 'ds@xn--mfdslmf-5za.com', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(1024) NOT NULL,
  `valor_uf` float NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `valor_uf`, `categoria_id`) VALUES
(24, 'PLAN 1000', 'Este seguro de vida es un seguro de vida de 1000 UF', 1000, 37),
(25, 'PLAN 3000', 'Este es un seguro de vida de 3000', 3000, 37),
(26, 'SEGURO EXPRESS 500', 'seguro de viajes express', 500, 38),
(27, 'PLAN 5000', 'Este producto es de 500 uf', 5000, 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `personal_id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id`, `fecha`, `cliente_id`, `producto_id`, `personal_id`, `estado`) VALUES
(1, '2017-06-01 00:00:00', 1, 24, 1, 'PENDIENTE'),
(2, '2017-06-01 00:00:00', 1, NULL, 1, 'RECHAZADA'),
(6, '2017-06-27 11:48:49', 10, 24, 1, 'APROBADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_beneficiario`
--

CREATE TABLE `solicitud_beneficiario` (
  `solicitud_id` int(11) NOT NULL,
  `beneficiario_id` int(11) NOT NULL,
  `porcentaje` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitud_beneficiario`
--

INSERT INTO `solicitud_beneficiario` (`solicitud_id`, `beneficiario_id`, `porcentaje`) VALUES
(1, 1, 50),
(1, 2, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`) VALUES
(1, 'SUPERADMIN'),
(2, 'SUPERVISOR'),
(3, 'VENDEDOR');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `fk_beneficiario_cliente_idx` (`cliente_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`,`cliente_id`),
  ADD KEY `fk_contrato_cliente_idx` (`cliente_id`);

--
-- Indices de la tabla `contrato_beneficiario`
--
ALTER TABLE `contrato_beneficiario`
  ADD PRIMARY KEY (`contrato_id`,`beneficiario_id`),
  ADD KEY `fk_contrato_beneficiario_beneficiario_idx` (`beneficiario_id`),
  ADD KEY `fk_contrato_beneficiario_contrato_idx` (`contrato_id`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personal_tipo_usuario_idx` (`tipo_usuario_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`,`categoria_id`),
  ADD KEY `fk_producto_categoria_idx` (`categoria_id`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id`,`cliente_id`,`personal_id`),
  ADD KEY `fk_solicitud_cliente_idx` (`cliente_id`),
  ADD KEY `fk_solicitud_producto_idx` (`producto_id`),
  ADD KEY `fk_solicitud_personal_idx` (`personal_id`);

--
-- Indices de la tabla `solicitud_beneficiario`
--
ALTER TABLE `solicitud_beneficiario`
  ADD PRIMARY KEY (`solicitud_id`,`beneficiario_id`),
  ADD KEY `fk_solicitud_beneficiario_beneficiario_idx` (`beneficiario_id`),
  ADD KEY `fk_solicitud_beneficiario_solicitud_idx` (`solicitud_id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beneficiario`
--
ALTER TABLE `beneficiario`
  ADD CONSTRAINT `fk_beneficiario_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contrato_beneficiario`
--
ALTER TABLE `contrato_beneficiario`
  ADD CONSTRAINT `fk_contrato_beneficiario_beneficiario` FOREIGN KEY (`beneficiario_id`) REFERENCES `beneficiario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contrato_beneficiario_contrato` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_tipo_usuario` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `fk_solicitud_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_solicitud_personal` FOREIGN KEY (`personal_id`) REFERENCES `personal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_solicitud_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud_beneficiario`
--
ALTER TABLE `solicitud_beneficiario`
  ADD CONSTRAINT `fk_solicitud_beneficiario_beneficiario` FOREIGN KEY (`beneficiario_id`) REFERENCES `beneficiario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_solicitud_beneficiario_solicitud` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitud` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
