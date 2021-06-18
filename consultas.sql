/*
2020/2021 
TEsP Programação de Sistemas de Informação
UC de Conceção e Desenvolvimento de Bases de Dados

Sistema Avaliação e Informação de Filmes

Artur Quaresma 2201115
Marcelo Marques 2200428
Vasco Silva 2200426
*/
-- Consultas SQL

USE e11;

/* Mostrar todos os filmes */
CREATE OR REPLACE VIEW v_mostrar_filmes AS
SELECT
f.nome AS Nome,
f.anoEstreia AS "Ano de Estreia",
e.nome AS Estudio,
p.nome AS Realizador
FROM filmes f
JOIN estudios e ON f.idEstudio = e.idEstudio
JOIN realizadores r ON f.idRealizador = r.idRealizador
JOIN pessoas p on r.idRealizador = p.idPessoa
ORDER BY 2;

/* Grupos (GROUP BY) */

-- 1 | Mostrar numero de estudios por pais
CREATE OR REPLACE VIEW v_numero_estudios_por_pais AS
SELECT 
pais AS País,
count(*) AS "Número de Estúdios"
FROM estudios
GROUP BY pais
ORDER BY 2 DESC;

-- 2 | Mostrar a avaliacao media dos filmes
CREATE OR REPLACE VIEW v_cotacao_media_filmes AS
SELECT
f.nome AS Nome, 
ifnull(ROUND(AVG(cotacao),1), "Sem Avalição") AS "Avaliacao Media"
FROM avaliacoes a RIGHT JOIN filmes f ON a.idFilme = f.idFilme
GROUP BY f.nome
ORDER BY 2 DESC;

-- 3 | Mostrar apenas os realizadores que tem filmes associados e o numero de filmes associados
CREATE OR REPLACE VIEW v_num_filmes_por_realizador AS
SELECT
p.nome AS Realizador,
count(f.nome) AS Filme
FROM realizadores r 
JOIN pessoas p ON p.idPessoa = r.idRealizador
JOIN filmes f ON f.idRealizador = r.idRealizador
GROUP BY p.nome
ORDER BY 2;

/* Sub Consultas */

-- 1 | Mostrar todas as avaliacoes de um filme
CREATE OR REPLACE VIEW v_mostrar_avaliacoes_do_filme AS
SELECT
p.nome AS Cliente,
f.nome AS Filme,
concat(a.cotacao, " pontos") AS Cotacao,
ifnull(a.comentario, "* * Sem Comentario * *") AS Comentario
FROM avaliacoes a
JOIN pessoas p ON p.idPessoa = a.idCliente
JOIN filmes f ON f.idFilme = a.idFilme
WHERE a.idFilme IN (SELECT idFilme FROM filmes WHERE nome = "The Sundering");

-- 2 | Mostrar todas as avaliacoes de um cliente
CREATE OR REPLACE VIEW v_mostrar_todas_avaliacoes_do_cliente AS
SELECT
p.nome AS Cliente,
f.nome AS Filme,
concat(a.cotacao, " pontos") AS Cotacao,
ifnull(a.comentario, "* * Sem Comentario * *") AS Comentario
FROM avaliacoes a
JOIN pessoas p ON p.idPessoa = a.idCliente
JOIN filmes f ON f.idFilme = a.idFilme
INNER JOIN clientes c on c.idCliente = a.idCliente
WHERE c.idCliente IN (SELECT idPessoa FROM pessoas WHERE nome = "Fathima Larsen");

/* JOIN + WHERE + ORDER BY + Formatar (((ex: CONCAT, ROUND, IF, CASE, ...)) */

-- 1 | Mostrar todos os realizadores que ja faleceram
CREATE OR REPLACE VIEW v_realizadores_falecidos AS
SELECT
p.nome AS Nome,
date_format(p.dtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
ifnull(date_format(r.dtaMorte, "%d/%m/%Y"), "Ainda nao faleceu") AS "Data de Morte",
concat(timestampdiff(YEAR, p.dtaNasc, r.dtaMorte), " Anos quando faleceu") AS Idade
FROM realizadores r 
JOIN pessoas p ON p.idPessoa = r.idRealizador
WHERE r.dtaMorte IS NOT NULL
ORDER BY 2;

-- 2 | Mostrar todos os atores que ja faleceram
CREATE OR REPLACE VIEW v_atores_falecidos AS
SELECT
p.nome AS Nome,
date_format(p.dtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
ifnull(date_format(a.dtaMorte, "%d/%m/%Y"), "Ainda nao faleceu") AS "Data de Morte",
concat(timestampdiff(YEAR, p.dtaNasc, a.dtaMorte), " Anos quando faleceu") AS Idade
FROM atores a 
JOIN pessoas p ON p.idPessoa = a.idAtor
WHERE a.dtaMorte IS NOT NULL
ORDER BY 2;

-- 3 | Mostrar todos os clientes com idade superior a 55
CREATE OR REPLACE VIEW v_mostrar_clientes_com_mais_55 AS
SELECT
p.nome AS Nome,
c.nif AS "Numero de Contribuinte",
date_format(p.dtaNasc, "%d/%m/%Y") AS "Data de Nascimento",
CONCAT(TIMESTAMPDIFF(YEAR, p.dtaNasc, CURDATE()), " Anos") AS Idade
FROM clientes c 
JOIN pessoas p ON p.idPessoa = c.idCliente
WHERE TIMESTAMPDIFF(YEAR, p.dtaNasc, CURDATE()) > 55
ORDER BY 1;

-- 4 | Mostrar todos os filmes estreados depois de 2011
CREATE OR REPLACE VIEW v_filmes_estreados_depois_2011 AS
SELECT
concat("O filme ", f.nome, " do estudio ", e.nome, " e realizado por ", p.nome, " estreou em ", f.anoEstreia) AS "Filmes estreados após 2011"
FROM filmes f
JOIN estudios e ON f.idEstudio = e.idEstudio
JOIN realizadores r ON f.idRealizador = r.idRealizador
JOIN pessoas p on r.idRealizador = p.idPessoa
WHERE f.anoEstreia > 2011
ORDER BY f.anoEstreia DESC;

-- 5 | Mostrar os filmes disponiveis num servico escolhido
CREATE OR REPLACE VIEW v_mostrar_todos_filmes_servico AS
SELECT
concat("Filmes no ", s.nome ,": ", f.nome) AS "Serviço e Filme",
fs.linkFilme AS "Link do Filme"
FROM filmes_servicos fs JOIN filmes f ON fs.idFilme = f.idFilme
JOIN servicos s on fs.idServico = s.idServico
WHERE s.nome = "MegaFlix"
ORDER BY 2;

-- 6 | Mostrar os filmes disponiveis com ATOR escolhido num servico escolhido
CREATE OR REPLACE VIEW v_mostrar_todos_filmes_com_Ator_no_servico AS
SELECT
p.nome AS "Nome Ator",
f.nome AS "Nome Filme",
concat(s.nome," Link: ",fs.linkFilme) AS "Nome Servico"
FROM filmes_servicos fs JOIN filmes f ON fs.idFilme = f.idFilme
JOIN servicos s on fs.idServico = s.idServico
INNER JOIN atores a join pessoas p on a.idAtor = p.idPessoa
WHERE s.nome = "MegaFlix" AND p.nome = "Jesse Sanderson"
ORDER BY 1;

-- 7 | Mostrar numero de filmes por genero
CREATE OR REPLACE VIEW v_numero_filmes_por_genero AS
SELECT
g.nome AS Genero,
count(fg.idFilme) AS Filme
FROM generos g 
JOIN filmes_generos fg ON g.idGenero = fg.idGenero
GROUP BY g.nome
ORDER BY 1;

