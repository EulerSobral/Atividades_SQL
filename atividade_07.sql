-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/11/2023 às 04:16
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `CODIGO_CONSULTA` int(11) NOT NULL,
  `DATA_HORARIO` datetime DEFAULT NULL,
  `CRM_MEDICO_FK` varchar(15) DEFAULT NULL,
  `RG_PACIENTE_FK` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `CRM` varchar(15) NOT NULL,
  `NOME` varchar(40) NOT NULL,
  `ESPECIALIDADE` varchar(20) NOT NULL DEFAULT 'Orotpedia',
  `CPF` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `RG` varchar(15) NOT NULL,
  `NOME` varchar(40) NOT NULL,
  `DATA_NASC` date DEFAULT NULL,
  `CIDADE` varchar(30) DEFAULT 'Itabuna',
  `DOENCA` varchar(40) NOT NULL,
  `PLANO_SAUDE` varchar(40) NOT NULL DEFAULT 'SUS'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sala`
--

CREATE TABLE `sala` (
  `NUM_SALA` int(11) NOT NULL,
  `ANDAR` int(11) NOT NULL CHECK (`ANDAR` < 12),
  `CRM_MEDICO_FK` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`CODIGO_CONSULTA`),
  ADD KEY `CRM_MEDICO_FK` (`CRM_MEDICO_FK`),
  ADD KEY `RG_PACIENTE_FK` (`RG_PACIENTE_FK`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`RG`);

--
-- Índices de tabela `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`NUM_SALA`),
  ADD KEY `CRM_MEDICO_FK` (`CRM_MEDICO_FK`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`CRM_MEDICO_FK`) REFERENCES `medico` (`CRM`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`RG_PACIENTE_FK`) REFERENCES `paciente` (`RG`);

--
-- Restrições para tabelas `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`CRM_MEDICO_FK`) REFERENCES `medico` (`CRM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
