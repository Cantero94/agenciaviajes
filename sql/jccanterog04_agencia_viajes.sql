-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-02-2025 a las 11:40:41
-- Versión del servidor: 10.11.6-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jccanterog04_agencia_viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correoelectronico` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `apellidos`, `correoelectronico`, `telefono`) VALUES
(1, 'José Carlos', 'Cantero García', 'jccanterogarcia@gmail.com', '622024712');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testimoniales`
--

CREATE TABLE `testimoniales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `correoelectronico` varchar(255) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `testimoniales`
--

INSERT INTO `testimoniales` (`id`, `nombre`, `correoelectronico`, `mensaje`) VALUES
(1, 'carlos', 'croncero@yahoo.es', 'mensaje1'),
(2, 'luis', 'pinado@yahoo.es', 'mensaje2'),
(3, 'Pedro', 'pietro@gmail.com', 'muy hermoso'),
(4, 'Lucas ', 'lucas@yahoo.es', 'Hola qué guay '),
(5, 'Luis Enrique', 'luisenrique@yahoo.es', 'Me ha encantado su web'),
(6, 'PEDRITO', 'pedro@yahoo.es', 'hola'),
(7, 'José Carlos', 'saasdf@asdfasdf.com', 'asdfasdf'),
(8, 'asdfeqqwe', 'expodogs@gmail.com', 'ue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `precio` varchar(10) DEFAULT NULL,
  `fecha_ida` date DEFAULT NULL,
  `fecha_vuelta` date DEFAULT NULL,
  `imagen` varchar(15) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `disponibles` int(11) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id`, `titulo`, `precio`, `fecha_ida`, `fecha_vuelta`, `imagen`, `descripcion`, `disponibles`, `slug`) VALUES
(1, 'Italia', '50000', '2021-06-24', '2021-06-30', 'roma', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 32, 'viaje-italia'),
(2, 'Canada', '60000', '2021-07-19', '2021-07-19', 'canada', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 25, 'viaje-canada'),
(3, 'Grecia', '40000', '2021-08-29', '2021-09-15', 'grecia', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 18, 'viaje-grecia'),
(4, 'Inglaterra', '8000', '2021-09-22', '2021-10-03', 'londres', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 22, 'viaje-inglaterra'),
(5, 'Rio de Janeiro', '50000', '2021-04-16', '2021-04-25', 'rio', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 23, 'viaje-rio-de-janeiro'),
(6, 'Francia', '75000', '2021-04-03', '2021-04-10', 'paris', 'Praesent tincidunt ante at justo semper volutpat. Sed risus neque, scelerisque id dictum in, placerat non erat. Sed eget tellus eu mauris faucibus pharetra. Praesent vulputate diam ac diam dignissim, eu semper turpis gravida. Vestibulum tempor purus orci, vitae ullamcorper erat congue quis. Nullam dapibus dui a velit lacinia, eu cursus massa cursus. Morbi lobortis fermentum urna, quis tincidunt justo varius vitae. In justo nisl, auctor vel eros sed, tempus efficitur lacus. Maecenas volutpat pharetra dolor, nec rutrum ipsum dapibus id.\r\n\r\nMauris ultricies augue lectus, efficitur tincidunt enim euismod non. Praesent nisl elit, eleifend et eleifend eu, venenatis et felis. Donec eleifend mi in congue semper. Quisque hendrerit purus eget pharetra laoreet. Donec nisl nisi, auctor at vehicula et, fermentum sed urna. In nec porta felis, eu ullamcorper lacus. Curabitur scelerisque commodo laoreet. Donec finibus vel nibh quis ultrices. Integer varius tellus sed leo tempor, vitae ullamcorper leo placerat.', 14, 'viaje-francia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correoelectronico` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_2` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_3` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_4` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_5` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_6` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_7` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_8` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_9` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_10` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_11` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_12` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_13` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_14` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_15` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_16` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_17` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_18` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_19` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_20` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_21` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_22` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_23` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_24` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_25` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_26` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_27` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_28` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_29` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_30` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_31` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_32` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_33` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_34` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_35` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_36` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_37` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_38` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_39` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_40` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_41` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_42` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_43` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_44` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_45` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_46` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_47` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_48` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_49` (`correoelectronico`),
  ADD UNIQUE KEY `correoelectronico_50` (`correoelectronico`);

--
-- Indices de la tabla `testimoniales`
--
ALTER TABLE `testimoniales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `testimoniales`
--
ALTER TABLE `testimoniales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
