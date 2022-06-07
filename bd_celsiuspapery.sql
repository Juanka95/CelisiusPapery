-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2022 a las 00:32:11
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_celsiuspapery`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `foto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `primerapellidos` varchar(100) DEFAULT NULL,
  `segundoapellido` varchar(100) DEFAULT NULL,
  `tipo_doc` varchar(20) DEFAULT NULL,
  `num_doc` varchar(11) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `comunidadauto` varchar(100) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `direccion_envio` varchar(500) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `foto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombres`, `primerapellidos`, `segundoapellido`, `tipo_doc`, `num_doc`, `pais`, `comunidadauto`, `provincia`, `direccion_envio`, `telefono`, `foto_id`) VALUES
(2, 'Juan Carlos', 'Ruiz', 'Garcia', 'DNI', '23860512', 'España', 'Valencia', 'Valencia', 'calles islas canarias', '691786540', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `platillo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_almacenado`
--

CREATE TABLE `documento_almacenado` (
  `id` bigint(20) NOT NULL,
  `eliminado` bit(1) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `descripcion_platillo` varchar(500) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `recomendado` bit(1) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `foto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `anular_pedido` bit(1) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `clave` varchar(20) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `vigencia` bit(1) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `clave`, `email`, `vigencia`, `cliente_id`) VALUES
(1, '456456111', 'juancarlosruizgracia@gmail.com', b'1', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbyh5eextelhhs5gyxj7giuspd` (`foto_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKorx40wtfkkqg46bht8mt4vb3a` (`foto_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgqvba9e7dildyw45u0usdj1k2` (`pedido_id`),
  ADD KEY `FKjdy85hfuoa3v9nwnjom6hjltk` (`platillo_id`);

--
-- Indices de la tabla `documento_almacenado`
--
ALTER TABLE `documento_almacenado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5n4c3r1vke5yf6b6vd804c77y` (`categoria_id`),
  ADD KEY `FKb6oobjrj90ajqhea2rn05i88c` (`foto_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4xhh9ujbo3ub466rnd2ocs629` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documento_almacenado`
--
ALTER TABLE `documento_almacenado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `FKbyh5eextelhhs5gyxj7giuspd` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FKorx40wtfkkqg46bht8mt4vb3a` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `FKgqvba9e7dildyw45u0usdj1k2` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `FKjdy85hfuoa3v9nwnjom6hjltk` FOREIGN KEY (`platillo_id`) REFERENCES `libro` (`id`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK5n4c3r1vke5yf6b6vd804c77y` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `FKb6oobjrj90ajqhea2rn05i88c` FOREIGN KEY (`foto_id`) REFERENCES `documento_almacenado` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK30s8j2ktpay6of18lbyqn3632` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK4xhh9ujbo3ub466rnd2ocs629` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
