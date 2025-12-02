-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2025 a las 03:51:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_aguafresh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `password`, `telefono`, `fecha_registro`) VALUES
(1, 'dfsdfdsf', 'davidhu1601@gmail.com', '$2y$10$3mhHs5njXPS43VlqMALbbO3mX8STSvVioQZFKJKY4mcPgD5ViO2bO', '959123544', '2025-11-13 21:36:36'),
(2, 'LUIS DAVID HUACCHARAQUI URBINA', 'luisdavidhu26@gmail.com', '$2y$10$VhH5CWJXqMC/y71oqiv27.sxfImfzTqnBKBoxEC3qVs77W8Q5facq', '959123544', '2025-11-13 21:50:07'),
(3, 'HUACCHARAQUI URBINA LUIS DAVID', 'luis_h_urbina@hotmail.com', '$2y$10$83nMohXkB0n/OVxVS5pweOczNF6hJqvruYRSC4sfiPkAODFPATNn.', '959123544', '2025-11-13 21:51:45'),
(4, 'LUIS DAVID', 'davidluishu1998@gmail.com', '$2y$10$VIwVM/Mv8qct5PjUlEee/e7zdRHxQXTaiDhZdGP6vikb05uBWheuG', '959123544', '2025-11-13 21:54:03'),
(5, 'francisco', 'francisco@gmail.com', '$2y$10$CBzI4HldeWO9jxBsLxhhZenh1O/O.xHEZtERUpEg0W0lwsLMEO85W', '989564789', '2025-11-13 21:58:31'),
(6, 'pedro fernandez', 'pedro@gmail.com', '$2y$10$5vNDjtAW.QIyerV3u4Rhd.OZgz5R1FAAekQNeJmApy7qOLPLAx3mu', '956878964', '2025-11-16 02:31:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `nombre`, `correo`, `mensaje`, `fecha_envio`) VALUES
(1, 'HUACCHARAQUI URBINA LUIS DAVID', 'davidhu1601@gmail.com', 'sadasd', '2025-11-13 01:19:11'),
(2, 'alfredo benavides', 'U22327952@utp.edu.pe', 'asdasdasdasfa', '2025-11-13 01:37:42'),
(3, 'HUACCHARAQUI URBINA LUIS DAVID', 'davidhu1601@gmail.com', 'sadasd', '2025-11-13 21:05:51'),
(4, 'pedro fernandez', 'davidhu1601@gmail.com', 'sdasdas', '2025-11-13 21:51:21'),
(5, 'pedro fernandez', 'pedrp@gmail.com', 'prueba', '2025-11-16 02:30:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('En proceso','Entregado') DEFAULT 'En proceso',
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_pedido`
--

CREATE TABLE `productos_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `productos_pedido`
--
ALTER TABLE `productos_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_pedido`
--
ALTER TABLE `productos_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos_pedido`
--
ALTER TABLE `productos_pedido`
  ADD CONSTRAINT `productos_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
