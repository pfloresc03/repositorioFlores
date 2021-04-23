-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2021 a las 19:23:20
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baseflores`
--
CREATE DATABASE IF NOT EXISTS `baseflores` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `baseflores`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conciertos`
--

CREATE TABLE `conciertos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `conciertos`
--

INSERT INTO `conciertos` (`id`, `nombre`, `fecha`) VALUES
(1, 'CONCIERTO EN HONOR A SANTA CECILIA', '2013-11-23'),
(2, 'XXX FESTIVAL DE BANDAS DE MOTA DEL CUERVO', '2013-07-27'),
(3, 'VI CERTAMEN INTERNACIONAL DE BANDAS \"VILA DE LA SÉNIA\"', '2012-04-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumentos`
--

CREATE TABLE `instrumentos` (
  `id` int(11) NOT NULL,
  `nombreInst` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instrumentos`
--

INSERT INTO `instrumentos` (`id`, `nombreInst`) VALUES
(1, 'oboe'),
(2, 'clarinete'),
(3, 'flauta'),
(4, 'saxo alto'),
(5, 'saxo tenor'),
(6, 'saxo baritono'),
(7, 'tuba'),
(8, 'trombón'),
(9, 'trompa'),
(10, 'bombardino'),
(11, 'trompeta'),
(12, 'fliscorno'),
(13, 'fagot'),
(14, 'violonchelo'),
(15, 'percusión'),
(16, 'corno ingles'),
(17, 'piano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obras`
--

CREATE TABLE `obras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `obras`
--

INSERT INTO `obras` (`id`, `nombre`, `autor`) VALUES
(1, 'Ferling', 'señor ferling'),
(2, 'Prueba', 'Anónimo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partituras`
--

CREATE TABLE `partituras` (
  `id` int(11) NOT NULL,
  `archivo` varchar(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_obra` int(11) NOT NULL,
  `id_instrumento` int(11) NOT NULL,
  `voz` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partituras`
--

INSERT INTO `partituras` (`id`, `archivo`, `nombre`, `id_obra`, `id_instrumento`, `voz`) VALUES
(2, 'http://localhost/repositorioFlores/backendFlores/partituras/Ferling.pdf', 'Ferling.pdf', 1, 1, 1),
(5, 'http://localhost/repositorioFlores/backendFlores/partituras/Bartók, Béla - Para niños, Sz.42 Vol.1.pdf', 'Bartók, Béla - Para niños, Sz.42 Vol.1.pdf', 2, 3, 3),
(6, 'http://localhost/repositorioFlores/backendFlores/partituras/Bartók, Béla - Primer término al piano, Sz.53.pdf', 'Bartók, Béla - Primer término al piano, Sz.53.pdf', 1, 17, 2),
(7, 'http://localhost/repositorioFlores/backendFlores/partituras/IMSLP314940-PMLP508711-Dohnanyi-Essential_Finger_Exercises_P1.pdf', 'IMSLP314940-PMLP508711-Dohnanyi-Essential_Finger_Exercises_P1.pdf', 2, 8, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(4) NOT NULL,
  `nombreRol` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombreRol`) VALUES
(1, 'registrado'),
(14, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `idRol` int(4) NOT NULL DEFAULT 1,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `idRol`, `nombre`, `apellidos`, `email`, `password`) VALUES
(1, 14, 'Pablo', 'Flores', 'pabloflores11@hotmail.com', '$2y$10$IQRBWs4zJrpvCNHfdVzQmuGMt8g3i6SbxCmYFI/PSpWcac.cm4SKG'),
(3, 1, 'Javier', 'Flores', 'javier@hotmail.com', '$2y$10$TZcj9UXrcelqKlH4CGkiMuKeG8NBSA3mjfBxNN8o/2SDOfVDn0kKi'),
(4, 14, 'Admin', 'Admin', 'admin@admin.com', '$2y$10$FkgEpJqOxdUToUV/FpdrI.L9YSaDL5crVFsmSt0GHf/p.RauJ4ouy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videoteca`
--

CREATE TABLE `videoteca` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `enlace` varchar(100) NOT NULL,
  `id_concierto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `videoteca`
--

INSERT INTO `videoteca` (`id`, `titulo`, `autor`, `enlace`, `id_concierto`) VALUES
(3, 'El colibrí', 'Anónimo', 'https://www.youtube.com/embed/veO2ooRTsKU', 1),
(4, 'Manual del perfecte inoportú', 'Joaquim Cano', 'https://www.youtube.com/embed/br2h74Ymcq0', 1),
(5, 'Lluna Mediterránea', 'Teodoro Aparicio', 'https://www.youtube.com/embed/eSJKm8WrU68', 1),
(6, 'Libertadores', 'Óscar Navarro', 'https://www.youtube.com/embed/dTbSU5362mk', 1),
(9, 'Lolita Bru', 'Xavier Martinez', 'https://www.youtube.com/embed/IQFpY5ZXD2k', 2),
(10, 'Hispania', 'Óscar Navarro', 'https://www.youtube.com/embed/7uxjCKxPMl8', 2),
(11, 'Yakka', 'José Rafael Pascual Vilaplana', 'https://www.youtube.com/embed/K-x97qJ2tt8', 3),
(12, 'Microtopia', 'Bert Appermont', 'https://www.youtube.com/embed/dcOVHmMJfqM', 3),
(13, 'Egmont', 'Bert Appermont', 'https://www.youtube.com/embed/NrM43QwviPM', 3),
(14, 'Rubores', 'Pascual Marquina', 'https://www.youtube.com/embed/ljEa4Ghxuhg', 2),
(16, 'Dolores Pedro', 'Antonio Sánchez Pedro', 'https://www.youtube.com/embed/nM1_fOdFk1o', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conciertos`
--
ALTER TABLE `conciertos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `instrumentos`
--
ALTER TABLE `instrumentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `obras`
--
ALTER TABLE `obras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partituras`
--
ALTER TABLE `partituras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_obra` (`id_obra`),
  ADD KEY `id_instrumento` (`id_instrumento`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `relacionRoles` (`idRol`);

--
-- Indices de la tabla `videoteca`
--
ALTER TABLE `videoteca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conciertos` (`id_concierto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conciertos`
--
ALTER TABLE `conciertos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `instrumentos`
--
ALTER TABLE `instrumentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `obras`
--
ALTER TABLE `obras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `partituras`
--
ALTER TABLE `partituras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `videoteca`
--
ALTER TABLE `videoteca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partituras`
--
ALTER TABLE `partituras`
  ADD CONSTRAINT `id_instrumento` FOREIGN KEY (`id_instrumento`) REFERENCES `instrumentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_obra` FOREIGN KEY (`id_obra`) REFERENCES `obras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `relacionRoles` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `videoteca`
--
ALTER TABLE `videoteca`
  ADD CONSTRAINT `conciertos` FOREIGN KEY (`id_concierto`) REFERENCES `conciertos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
