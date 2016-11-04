-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.11-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para imobiliaria
CREATE DATABASE IF NOT EXISTS `imobiliaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `imobiliaria`;


-- Copiando estrutura para tabela imobiliaria.authorities
CREATE TABLE IF NOT EXISTS `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela imobiliaria.authorities: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` (`username`, `authority`) VALUES
	('admin', 'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;


-- Copiando estrutura para tabela imobiliaria.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela imobiliaria.hibernate_sequence: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(12);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;


-- Copiando estrutura para tabela imobiliaria.imoveis
CREATE TABLE IF NOT EXISTS `imoveis` (
  `imovelId` int(11) NOT NULL,
  `imovelCategoria` varchar(255) NOT NULL,
  `imovelDescricao` varchar(255) NOT NULL,
  `imovelEndereco` varchar(255) NOT NULL,
  `imovelPreco` decimal(10,2) NOT NULL,
  `imovelTipo` varchar(255) NOT NULL,
  PRIMARY KEY (`imovelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela imobiliaria.imoveis: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `imoveis` DISABLE KEYS */;
INSERT INTO `imoveis` (`imovelId`, `imovelCategoria`, `imovelDescricao`, `imovelEndereco`, `imovelPreco`, `imovelTipo`) VALUES
	(1, 'Casa', '3 Quartos\r\n2 Banheiros\r\nSala\r\nCozinha\r\nArea de Festas\r\nPiscina', 'Rua XYZ, 666', 850.00, 'Aluguel'),
	(2, 'Casa', '1 Quarto\r\n1 Banheiros\r\nCozinha', 'Rua Blabla, 250', 133000.00, 'Aluguel'),
	(3, 'Apartamento', '3 Quartos\r\n2 Banheiros\r\nCozinha\r\nSala', 'Rua Noiada, 1840', 950000.00, 'Venda'),
	(4, 'Casa', '2 Quartos\r\nSala\r\nCozinha\r\nBanheiro\r\nLareira', 'Monte Crista, 445', 633.00, 'Aluguel'),
	(5, 'Apartamento', '2 Quartos\r\nSala\r\nBanheiro\r\nCozinha\r\nGaragem\r\nSacada', 'Rua XYZ, 250', 444.00, 'Aluguel'),
	(6, 'Casa', '8 Quartos\r\n3 Salas\r\n1 Canil\r\nCaragem 4 Carros\r\n8 Banheiros\r\nPiscina', 'Rua AAAAAA, 250', 2000000.00, 'Venda'),
	(7, 'Casa', '3 Quartos\r\n1 Sala\r\nCozinha\r\n2 Banheiros\r\nLinda Vista', 'Rua Bla bla, 234', 690000.00, 'Venda'),
	(8, 'Apartamento', '3 Quartos\r\nSacada\r\nÃrea de ServiÃ§o\r\n1 Garagem\r\n2 Banheiros', 'Rua TZPA, 334', 780000.00, 'Venda'),
	(9, 'Comercial', 'Ponto Comercial\r\nLoja\r\nLivraria', 'Rua Central, 4000', 1200.00, 'Aluguel'),
	(10, 'Comercial', 'Loja Rustica\r\nLoja\r\nChocolate\r\nPonto Comercial', 'Rua ASDASD, 666', 289000.00, 'Venda'),
	(11, 'Terreno', 'Terreno 1000m2\r\n', 'Rua 2asfdsadf, 111', 456000.00, 'Venda');
/*!40000 ALTER TABLE `imoveis` ENABLE KEYS */;


-- Copiando estrutura para tabela imobiliaria.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela imobiliaria.users: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('admin', 'admin', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
