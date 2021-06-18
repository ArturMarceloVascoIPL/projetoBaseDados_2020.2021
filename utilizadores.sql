/*
2020/2021 
TEsP Programação de Sistemas de Informação
UC de Conceção e Desenvolvimento de Bases de Dados

Sistema Avaliação e Informação de Filmes

Artur Quaresma 2201115
Marcelo Marques 2200428
Vasco Silva 2200426
*/
-- Gestão de Utilizadores

USE e11;

/* Criar o utilizador dataadmin */
DROP USER IF EXISTS 'e11admin'@'localhost';
CREATE USER 'e11admin'@'localhost' IDENTIFIED BY 'e11admin';
-- Dar todos os previlégios
GRANT ALL PRIVILEGES ON e11.* TO 'e11admin'@'localhost';

/* Criar o utilizador cliente */
DROP USER IF EXISTS 'cliente'@'localhost';
CREATE USER 'cliente'@'localhost' IDENTIFIED BY 'cliente';

GRANT SELECT ON e11.v_mostrar_filmes TO 'cliente'@'localhost';
GRANT SELECT ON e11.v_mostrar_todas_avaliacoes_do_cliente  TO 'cliente'@'localhost';
GRANT SELECT ON e11.v_cotacao_media_filmes TO 'cliente'@'localhost';
GRANT SELECT ON e11.v_mostrar_todos_filmes_servico  TO 'cliente'@'localhost';
GRANT SELECT(nome, link) ON e11.servicos TO 'cliente'@'localhost';

GRANT INSERT, DELETE, UPDATE(cotacao, comentario, idCliente, idFilme) ON e11.avaliacoes TO 'cliente'@'localhost';

GRANT INSERT, DELETE, UPDATE(telefone, idCliente) ON e11.telefones_clientes TO 'cliente'@'localhost';