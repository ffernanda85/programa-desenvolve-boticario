--QUERIE CURSOS POR CATEGORIA
SELECT  categoria.nome AS categoria,
		COUNT(curso.id) AS numero_cursos
	FROM categoria
JOIN curso ON curso.categoria_id = categoria.id
GROUP BY 1
--CRIANDO UMA VIEW
CREATE VIEW vw_cursos_por_categoria AS SELECT categoria.nome AS categoria,
			COUNT(curso.id) AS numero_cursos
		FROM categoria
		JOIN curso ON curso.categoria_id = categoria.id
		GROUP BY categoria
		
--CHAMANDO A VIEW
SELECT * FROM vw_cursos_por_categoria

--MANIPULANDO UMA VIEW
SELECT categoria, numero_cursos FROM vw_cursos_por_categoria
	WHERE numero_cursos > 1
	ORDER BY numero_cursos DESC
	
--CRIANDO UMA VIEW QUE RETORNE TODOS OS CURSO DE PROGRAMAÇÃO
CREATE VIEW vw_cursos_desenvolvimento AS SELECT nome AS curso FROM curso WHERE categoria_id = 1;

SELECT * FROM vw_cursos_desenvolvimento

--UNINDO VIEWS E TABELAS
SELECT  categoria.id categoria_id, categoria, numero_cursos
	FROM vw_cursos_por_categoria
JOIN categoria ON categoria.nome = categoria
WHERE numero_cursos > 1

-- OU OS DOIS SCRIPTS RETORNAM A MESMA TABELA

SELECT  categoria.id categoria_id, vw_cursos_por_categoria.*
	FROM vw_cursos_por_categoria
JOIN categoria ON categoria.nome = vw_cursos_por_categoria.categoria
WHERE numero_cursos > 1