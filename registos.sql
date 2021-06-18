/*
2020/2021 
TEsP Programação de Sistemas de Informação
UC de Conceção e Desenvolvimento de Bases de Dados

Sistema Avaliação e Informação de Filmes

Artur Quaresma 2201115
Marcelo Marques 2200428
Vasco Silva 2200426
*/
-- Inserção de Dados

USE e11;

INSERT INTO pessoas
(idPessoa, nome, dtaNasc)
VALUES
(1, "Cora Welsh", "1970/12/01"),		-- realizador, ator
(2, "Keenan Barnett", "1971/11/02"),	-- realizador
(3, "Ahyan Cantu", "1972/10/03"),		-- realizador
(4, "Karl Ashley", "1973/09/04"),		-- realizador
(5, "Fathima Larsen", "1964/08/05"),	-- cliente
(6, "Jesse Sanderson", "1965/07/06"),	-- ator, cliente
(7, "Clement Bernard", "1966/06/07"),	-- ator, cliente
(8, "Adriana Foreman", "1967/05/08");	-- ator, cliente

INSERT INTO realizadores
(idRealizador, foto, dtaMorte)
VALUES
(1, null, null),
(2, null, "2020/05/08"),
(3, null, "2019/02/02"),
(4, null, null);

INSERT INTO atores
(idAtor, foto, dtaMorte)
VALUES
(1, null, null),
(6, null, "2020/05/05"),
(7, null, null),
(8, null, null);

INSERT INTO clientes
(idCliente, nif)
VALUES
(5, 123456789),
(6, 987654321),
(7, 123789456),
(8, 456789123);

INSERT INTO estudios
(idEstudio, nome, pais)
VALUES
(1, "Thunder Filmworks", "EUA"),
(2, "Clockline Film Company", "Suécia"),
(3, "Chronowood Cinema", "Inglaterra"),
(4, "Bad Lantern Studios", "Estónia"),
(5, "Morício Filmes", "Portugal"),
(6, "BadClock Interactive", "EUA"),
(7, "Cinema Lights", "EUA"),
(8, "Kamelor Studios", "Estónia");

INSERT INTO filmes
(idFilme, nome, anoEstreia, idEstudio, idRealizador)
VALUES
(1, "Prince of the Seas", 2010, 1, 1),
(2, "Ruler of the Old Kingdom", 2011, 2, 2),
(3, "The Sundering", 2012, 3, 3),
(4, "Nature's Vengeance", 2013, 4, 4),
(5, "Statue of Everywhere", 2019, 1, 4),
(6, "With Wings", 2009, 2, 1),
(7, "Shield's Aligned", 2011, 3, 1),
(8, "BxMxC", 2010, 6, 1);

INSERT INTO avaliacoes
(idAvaliacao, cotacao, comentario, idCliente, idFilme)
VALUES
(1, 4, null, 5, 1),
(2, 5, "Cool music, otherwise pretty average", 6, 3),
(3, 6, "Pretty good, solid story.", 7, 3),
(4, 7, "Liked a lot, great ambience and story", 7, 4),
(5, 1, "Masterpiece of an awful movie, don't watch", 8, 1),
(6, 9, "Perfect movie to watch with your pet hamster", 5, 4),
(7, 2, "The Sundering more like The Sundying, lmao", 6, 6),
(8, 8, "I like water", 7, 1);

INSERT INTO servicos
(idServico, nome, link)
VALUES
(1, "MegaFlix", "www.megaflix.com/movies"),
(2, "Dellari Movies", "www.dellarimovies.com"),
(3, "MilkyWay", "www.milkymovies.es"),
(4, "Crony, Movies and Series", "www.crony.com/movies");

INSERT INTO generos
(idGenero, nome, descricao)
VALUES
(1, "Comédia", null),
(2, "Ação", null),
(3, "Story-Heavy", "Filmes com extrema importância na história e nos detalhes"),
(4, "Romântico", null),
(5, "Sci-Fi", null),
(6, "Drama", null),
(7, "Fantasia", null),
(8, "Terror", null);

INSERT INTO filmes_servicos
(idFilme, idServico, linkFilme)
VALUES
(1, 4, "www.crony.com/movies/PrinceoftheSeas"),
(2, 3, "www.milkymovies.es/ruleroftheoldkingdom"),
(3, 2, "www.dellarimovies.com/sundering"),
(4, 1, "www.megaflix.com/movies/Naturesvengance"),
(8, 4, "www.crony.com/movies/BxMxC"),
(7, 3, "www.milkymovies.es/shieldsaligned"),
(6, 2, "www.dellarimovies.com/WithWings"),
(5, 1, "www.megaflix.com/movies/Statueofeverywhere");

INSERT INTO filmes_generos
(idFilme, idGenero)
VALUES
(1, 4),
(2, 3),
(3, 2),
(4, 1),
(5, 5),
(6, 7),
(7, 2),
(8, 5);

INSERT INTO filmes_atores
(idFilme, idAtor)
VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 6);

INSERT INTO telefones_clientes
(idCliente, telefone)
VALUES
(5, 987654321),
(5, 123456789),
(6, 123789456),
(7, 789123456);











