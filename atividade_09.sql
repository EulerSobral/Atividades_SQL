-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2023 às 23:28
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
-- Banco de dados: `empresa`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--
-- Criação: 26/11/2023 às 02:03
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `ID_Depto` int(11) NOT NULL,
  `NomeDepto` varchar(30) NOT NULL,
  `ID_Gerente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `departamento`:
--   `ID_Gerente`
--       `funcionario` -> `ID_Func`
--

--
-- Despejando dados para a tabela `departamento`
--


--Questão 01 
  --01
  INSERT INTO `departamento` (`ID_Depto`, `NomeDepto`, `ID_Gerente`) VALUES
  (1, 'Pesquisa', 10),
  (2, 'Administra??o', 20),
  (3, 'Inform?tica', 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `empregado`
--
-- Criação: 26/11/2023 às 18:21
-- Última atualização: 26/11/2023 às 18:39
--

DROP TABLE IF EXISTS `empregado`;
CREATE TABLE `empregado` (
  `idemp` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `secao` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `chefe` int(11) DEFAULT NULL,
  `salario` decimal(8,2) NOT NULL,
  `comissao` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `empregado`:
--   `secao`
--       `secao` -> `idsec`
--

--
-- Despejando dados para a tabela `empregado`
--

INSERT INTO `empregado` (`idemp`, `nome`, `secao`, `cargo`, `chefe`, `salario`, `comissao`) VALUES
(1, 'Ana Paula', 10, 'Programador', 3, 3000.00, 9.99),
(2, 'Gustavo Henrique', 70, 'Engenheiro', 1, 2500.00, 9.99),
(3, 'Álvaro Dias', 50, 'Administrador', NULL, 2500.00, 0.00),
(4, 'Antônio Carlos', 10, 'Engenheiro', 3, 2400.00, 9.99),
(5, 'Susana Silva', 20, 'Administrador', NULL, 2750.00, 9.99),
(6, 'Cláudio José', 60, 'Vendedor', 4, 1000.00, 9.99);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--
-- Criação: 26/11/2023 às 02:03
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `ID_Func` int(11) NOT NULL,
  `NomeFunc` varchar(30) NOT NULL,
  `Endereco` varchar(50) NOT NULL,
  `DataNasc` date NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Salario` decimal(8,2) NOT NULL,
  `E_mail` varchar(50) DEFAULT NULL,
  `ID_Depto` int(11) NOT NULL
) ;

--
-- RELACIONAMENTOS PARA TABELAS `funcionario`:
--   `ID_Depto`
--       `departamento` -> `ID_Depto`
--

--
-- Despejando dados para a tabela `funcionario`
--

--Questão 01 
  --02
  INSERT INTO `funcionario` (`ID_Func`, `NomeFunc`, `Endereco`, `DataNasc`, `Sexo`, `Salario`, `E_mail`, `ID_Depto`) VALUES
  (10, 'Euler Pereira Sobral', '58.432-300', '2003-03-10', 'M', 5000.00, NULL, 1),
  (20, 'Milena Gon?alves da Silva', '58.432-300', '2001-01-10', 'F', 1000.00, 'milena@gmail.com', 2),
  (30, 'Jos? Pereira da Silva', '58.432-300', '1999-05-05', 'M', 2500.00, 'jose@gmail.com', 3);

-- -------------------------------------------------------- 

--
-- Estrutura para tabela `secao`
--
-- Criação: 26/11/2023 às 18:22
-- Última atualização: 26/11/2023 às 18:39
--

DROP TABLE IF EXISTS `secao`;
CREATE TABLE `secao` (
  `idsec` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `secao`:
--

--
-- Despejando dados para a tabela `secao`
--

INSERT INTO `secao` (`idsec`, `nome`, `cidade`) VALUES
(10, 'Fabrica', 'Recife'),
(20, 'Comercial', 'Recife'),
(30, 'Marketing', 'Campina Grande'),
(40, 'Planejamento', 'João Pessoa'),
(50, 'Administração', 'Recife'),
(60, 'Informática', 'Campina Grande'),
(70, 'Recursos Humanos', 'João Pessoa');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
-- 
--Questão 01 
  --03
  ALTER TABLE `departamento`
    ADD PRIMARY KEY (`ID_Depto`),
    ADD UNIQUE KEY `uk_nome` (`NomeDepto`),
    ADD KEY `fk_depto_func` (`ID_Gerente`);

--
-- Índices de tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`idemp`),
  ADD KEY `fk_empregado_secao` (`secao`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`ID_Func`),
  ADD KEY `fk_func_depto` (`ID_Depto`);

--
-- Índices de tabela `secao`
--
ALTER TABLE `secao`
  ADD PRIMARY KEY (`idsec`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `fk_depto_func` FOREIGN KEY (`ID_Gerente`) REFERENCES `funcionario` (`ID_Func`);

--
-- Restrições para tabelas `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `fk_empregado_secao` FOREIGN KEY (`secao`) REFERENCES `secao` (`idsec`);

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_func_depto` FOREIGN KEY (`ID_Depto`) REFERENCES `departamento` (`ID_Depto`);


--Questão 01 
    --04
    SELECT * FROM funcionario WHERE ID_Depto = 1; 
    --05 
    SELECT NomeFunc FROM funcionario WHERE Salario >= 800 AND Salario <= 1200; 
    --06 
    SELECT * FROM funcionario WHERE NomeFunc LIKE 'A'; 
    --07
    SELECT NomeFunc, DataNasc, Salario FROM funcionario WHERE Sexo = "F" AND Salario > 1000 ORDER BY Salario DESC; 
    --08
    SELECT * FROM funcionario WHERE Sexo = "M" AND NomeFunc LIKE '%Silva%';  
    --09
    SELECT ID_Func, NomeFunc, Endereco FROM funcionario WHERE E_mail = NULL; 
    --10 
    DELETE FROM funcionario WHERE ID_Depto = 3; --Para esse comando funcionar é necessário colocar o ON CASCADE na tabela funcionario. No entanto, a tabela depaetamento vai ser afetada quando o funcionario for deletado 

--Questão 02 
  --01
  SELECT MIN(Salario), AVG(Salario) From empregado; 
  --02
  SELECT cidade, COUNT(*) FROM Secao GROUP BY cidade;  
  --03
  SELECT secao, COUNT(*), SUM(salario)  FROM empregado GROUP BY secao;  
  
  --04  
  SELECT cargo, COUNT(*) empregado, AVG(salario) FROM empregado GROUP BY cargo;  

  --05
  SELECT ((salario * comissao) + salario) FROM empregado WHERE  salario = 3000; 
  --06  
  SELECT cargo, COUNT(*), AVG(salario) FROM empregado GROUP BY cargo HAVING COUNT(*) >= 2;
  --07 
  SELECT cargo, ((salario * (comissao / 100)) + salario) FROM empregado GROUP BY cargo HAVING MAX(salario);
  --08  
  SELECT cargo, AVG(salario) FROM empregado GROUP BY cargo HAVING cargo != "Administrador";  
  --09  
  SELECT cidade, COUNT(*) FROM secao GROUP BY cidade; 
  --10 
  SELECT COUNT(idemp) FROM empregado WHERE chefe = NULL;
  --11   
  SELECT secao, SUM(salario) FROM empregado GROUP BY secao HAVING SUM(salario) > 2500;
 --12 
  SELECT cargo, SUM(salario) FROM empregado GROUP BY cargo ORDER BY salario DESC, cargo;
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata para tabela departamento
--

--
-- Metadata para tabela empregado
--

--
-- Metadata para tabela funcionario
--

--
-- Metadata para tabela secao
--

--
-- Metadata para o banco de dados empresa
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
