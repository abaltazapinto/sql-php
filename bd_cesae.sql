-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 09-Maio-2024 às 20:31
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_cesae`
--

CREATE DATABASE IF NOT EXISTS `bd_cesae` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_cesae`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `n_area` int(2) NOT NULL AUTO_INCREMENT,
  `designacao_area` varchar(80) NOT NULL,
  PRIMARY KEY (`n_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato_formador`
--

DROP TABLE IF EXISTS `contrato_formador`;
CREATE TABLE IF NOT EXISTS `contrato_formador` (
  `n_contrato` int(5) NOT NULL AUTO_INCREMENT,
  `n_formador` int(5) NOT NULL,
  `cod_curso` varchar(20) NOT NULL,
  `dados_cesae` varchar(250) NOT NULL,
  `condicoes` varchar(250) NOT NULL,
  `data_contrato` date NOT NULL,
  PRIMARY KEY (`n_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato_formando`
--

DROP TABLE IF EXISTS `contrato_formando`;
CREATE TABLE IF NOT EXISTS `contrato_formando` (
  `n_contrato` int(5) NOT NULL AUTO_INCREMENT,
  `n_formando` int(5) NOT NULL,
  `cod_curso` varchar(20) NOT NULL,
  `dados_cesae` varchar(250) NOT NULL,
  `condicoes` varchar(250) NOT NULL,
  `data_contrato` date NOT NULL,
  PRIMARY KEY (`n_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `cod_curso` varchar(20) NOT NULL,
  `designacao_curso` varchar(80) NOT NULL,
  `modalidade` varchar(120) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `duracao` int(5) NOT NULL,
  `regime` varchar(30) NOT NULL,
  `nivel` int(9) NOT NULL,
  `custo` decimal(10,2) NOT NULL,
  `n_periodo` int(1) NOT NULL,
  `n_area` int(2) NOT NULL,
  `n_sala` int(1) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso_regalias`
--

DROP TABLE IF EXISTS `curso_regalias`;
CREATE TABLE IF NOT EXISTS `curso_regalias` (
  `cod_curso` varchar(10) NOT NULL,
  `n_regalia` int(2) NOT NULL,
  PRIMARY KEY (`cod_curso`,`n_regalia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso_ufcd`
--

DROP TABLE IF EXISTS `curso_ufcd`;
CREATE TABLE IF NOT EXISTS `curso_ufcd` (
  `cod_curso` varchar(10) NOT NULL,
  `cod_ufcd` int(4) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  PRIMARY KEY (`cod_curso`,`cod_ufcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formador`
--

DROP TABLE IF EXISTS `formador`;
CREATE TABLE IF NOT EXISTS `formador` (
  `n_formador` int(5) NOT NULL AUTO_INCREMENT,
  `n_pessoa` int(5) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `data_admissao` date NOT NULL,
  PRIMARY KEY (`n_formador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formador_area`
--

DROP TABLE IF EXISTS `formador_area`;
CREATE TABLE IF NOT EXISTS `formador_area` (
  `n_formador` int(5) NOT NULL,
  `n_area` int(2) NOT NULL,
  `horas_lecionadas` int(5) NOT NULL,
  PRIMARY KEY (`n_formador`,`n_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formador_ufcd`
--

DROP TABLE IF EXISTS `formador_ufcd`;
CREATE TABLE IF NOT EXISTS `formador_ufcd` (
  `n_formador` int(5) NOT NULL,
  `cod_ufcd` int(4) NOT NULL,
  PRIMARY KEY (`n_formador`,`cod_ufcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formando`
--

DROP TABLE IF EXISTS `formando`;
CREATE TABLE IF NOT EXISTS `formando` (
  `n_formando` int(5) NOT NULL AUTO_INCREMENT,
  `n_pessoa` int(5) NOT NULL,
  `data_inscricao` date NOT NULL,
  PRIMARY KEY (`n_formando`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `n_funcionario` int(5) NOT NULL AUTO_INCREMENT,
  `n_pessoa` int(5) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `funcao` varchar(40) NOT NULL,
  `data_admissao` date NOT NULL,
  `vencimento` decimal(8,2) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL,
  `salario` decimal(3,2) NOT NULL,
  PRIMARY KEY (`n_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodo`
--

DROP TABLE IF EXISTS `periodo`;
CREATE TABLE IF NOT EXISTS `periodo` (
  `n_periodo` int(1) NOT NULL AUTO_INCREMENT,
  `designacao_periodo` varchar(80) NOT NULL,
  `horario` varchar(30) NOT NULL,
  PRIMARY KEY (`n_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE IF NOT EXISTS `pessoa` (
  `n_pessoa` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `cod_postal` varchar(8) NOT NULL,
  `localidade` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telefone` int(9) NOT NULL,
  `cc` int(9) NOT NULL,
  `nif` int(9) NOT NULL,
  `data_nascimento` date NOT NULL,
  `habilitacoes` varchar(80) NOT NULL,
  `observacoes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`n_pessoa`),
  UNIQUE KEY `cc` (`cc`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `regalias`
--

DROP TABLE IF EXISTS `regalias`;
CREATE TABLE IF NOT EXISTS `regalias` (
  `cod_regalia` int(2) NOT NULL AUTO_INCREMENT,
  `designacao_regalia` varchar(80) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  PRIMARY KEY (`cod_regalia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala`
--

DROP TABLE IF EXISTS `sala`;
CREATE TABLE IF NOT EXISTS `sala` (
  `n_sala` int(2) NOT NULL AUTO_INCREMENT,
  `n_lugares` int(2) NOT NULL,
  `n_mesas` int(2) NOT NULL,
  `n_pcs` int(2) NOT NULL,
  `tipo_quadro` varchar(20) NOT NULL,
  PRIMARY KEY (`n_sala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ufcd`
--

DROP TABLE IF EXISTS `ufcd`;
CREATE TABLE IF NOT EXISTS `ufcd` (
  `cod_ufcd` int(4) NOT NULL,
  `designacao_ufcd` varchar(80) NOT NULL,
  `carga_horaria` int(2) NOT NULL,
  PRIMARY KEY (`cod_ufcd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
