-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2024 a las 21:00:03
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
-- Base de datos: `huerta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `nombre` text DEFAULT NULL,
  `hora_i` time DEFAULT NULL,
  `hora_f` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `evento` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id` int(11) NOT NULL,
  `clave` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrucciones`
--

CREATE TABLE `instrucciones` (
  `descripcion` text NOT NULL,
  `imagen` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `nombre` tinytext NOT NULL,
  `apellido` tinytext NOT NULL,
  `correo` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `tipo_documento` enum('tar','ced','cedex') NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `grupo` varchar(10) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`id`, `nombre`, `apellidos`, `tipo_documento`, `numero_documento`, `grupo`, `clave`) VALUES
(1, 'fff', 'fff', 'ced', '123', 'ced', '$2y$10$5Upj6/BiWPwu5IHF0OIseelHD.gvpRBxdqTKwMb8EKkKVKScKbuAO'),
(2, 'wert', 'dddd', 'tar', 'qwerty', 'tar', '$2y$10$J0ybEymRfctuBKldWRzP3.BqakSW7OCvyKhfqRZGNWE2VcoE.P3We'),
(4, 'fff', 'fff', 'tar', '12365', 'tar', '$2y$10$VR3DKnwXvAgJZPpVVzdfzuiFCTh37VvexUIfjG5nwsGvA6DYA7Oyi'),
(6, 'wert', 'fff', 'ced', '12345', 'tar', '$2y$10$ApJ0qh59cc6AolocgnICruljdeS4/NnqldQzMBHrgVtSfHlCUwtJ6'),
(7, 'mongo', 'eee', 'tar', '987', 'tar', '$2y$10$xnOBjEDFwvnzv8.NIXhMCueI/wagBg8.qa4Yw3bGjYC9fPh/3krey'),
(10, 'mongo', 'eee', 'ced', '123456', 'tar', '$2y$10$ltkalH8GLwG5BiRCxKhXPu0QTJFvWt8yDyz72M9.c/jXqsQ4ToUNC'),
(11, 'sara', 'vanegas', 'tar', '789', 'tar', '$2y$10$9P9LwSNob4VJ24pxJwqCLuLpJtBq/N1M9RnqoXepBZVle62Ji0OWq'),
(12, 'valen', 'jimenez', 'tar', '1011397851', 'tar', '$2y$10$U9ggIt7HqOP8LaKNR01Sb.GshLoo6h8gqRuYbZTq1tdjl52c0kEhG'),
(15, 'cindyy', 'bedoyya', 'tar', '9876543210', 'tar', '$2y$10$20ZVVoLYMppEBihZh28SKeZpwqSU3WAEgB1MPGSFFppyP0xibIHWO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`id`) REFERENCES `registro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
