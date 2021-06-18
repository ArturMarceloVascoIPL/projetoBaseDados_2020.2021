/*
2020/2021 
TEsP Programação de Sistemas de Informação
UC de Conceção e Desenvolvimento de Bases de Dados

Sistema Avaliação e Informação de Filmes

Artur Quaresma 2201115
Marcelo Marques 2200428
Vasco Silva 2200426
*/
-- Criação da Base de Dados e respetivas Tabelas

/* CRIAR BASE DE DADOS */

DROP DATABASE IF EXISTS e11;
CREATE DATABASE e11;

USE e11;

/* CRIAR TABELAS */

CREATE TABLE pessoas (
	idPessoa INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome varchar(50) NOT NULL,
	dtaNasc DATE NOT NULL,
	PRIMARY KEY (idPessoa)
) ENGINE=InnoDB;

CREATE TABLE realizadores (
	idRealizador INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dtaMorte DATE,
    foto BLOB,
    PRIMARY KEY (idRealizador),
    FOREIGN KEY (idRealizador) REFERENCES pessoas(idPessoa)
) ENGINE=InnoDB;

CREATE TABLE atores (
	idAtor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    dtaMorte DATE,
    foto BLOB,
    PRIMARY KEY (idAtor),
    FOREIGN KEY (idAtor) REFERENCES pessoas(idPessoa)
) ENGINE=InnoDB;

CREATE TABLE clientes (
    idCliente INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nif INT NOT NULL,
    PRIMARY KEY (idCliente)
) ENGINE=INNODB;

CREATE TABLE estudios (
	idEstudio INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (idEstudio)
) ENGINE=InnoDB;

CREATE TABLE filmes (
	idFilme INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    anoEstreia INT NOT NULL,
    idEstudio INT UNSIGNED NOT NULL,
    idRealizador INT UNSIGNED NOT NULL,
    PRIMARY KEY (idFilme),
    FOREIGN KEY (idEstudio) REFERENCES estudios(idEstudio),
    FOREIGN KEY (idRealizador) REFERENCES realizadores(idRealizador)
) ENGINE=InnoDB;

CREATE TABLE avaliacoes (
	idAvaliacao INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cotacao INT NOT NULL,
    comentario VARCHAR(500),
    idCliente INT UNSIGNED NOT NULL,
    idFilme INT UNSIGNED NOT NULL,
    PRIMARY KEY (idAvaliacao),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idFilme) REFERENCES filmes(idFilme)
) ENGINE=InnoDB;

CREATE TABLE servicos (
	idServico INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    link VARCHAR(150) NOT NULL,
	PRIMARY KEY (idServico)
) ENGINE=InnoDB;

CREATE TABLE generos (
	idGenero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(500),
	PRIMARY KEY (idGenero)
) ENGINE=InnoDB;

CREATE TABLE filmes_servicos (
	idFilme INT UNSIGNED NOT NUll,
    idServico INT UNSIGNED NOT NULL,
    linkFilme VARCHAR(150) NOT NULL,
	PRIMARY KEY (idFilme, idServico),
    FOREIGN KEY (idFilme) REFERENCES filmes(idFilme),
    FOREIGN KEY (idServico) REFERENCES servicos(idServico)
) ENGINE=InnoDB;

CREATE TABLE filmes_generos (
	idFilme INT UNSIGNED NOT NULL,
    idGenero INT UNSIGNED NOT NULL,
    PRIMARY KEY (idFilme, idGenero),
    FOREIGN KEY (idFilme) REFERENCES filmes(idFilme),
    FOREIGN KEY (idGenero) REFERENCES generos(idGenero)
) ENGINE=InnoDB;

CREATE TABLE filmes_atores (
	idFilme INT UNSIGNED NOT NULL,
    idAtor INT UNSIGNED NOT NULL,
    PRIMARY KEY (idFilme, idAtor),
    FOREIGN KEY (idFilme) REFERENCES filmes(idFilme),
    FOREIGN KEY (idAtor) REFERENCES atores(idAtor)
) ENGINE=InnoDB;

CREATE TABLE telefones_clientes (
	idCliente INT UNSIGNED NOT NULL,
    telefone INT UNSIGNED NOT NULL,
    PRIMARY KEY (idCliente, telefone),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
) ENGINE=InnoDB;
















