SELECT * FROM categoria;
SELECT * FROM curso;

INSERT INTO curso(nome, categoria_id) VALUES('Engenharia de Dados', 4)

--BUSCAR CURSOS QUE SEJAM DA CATEGORIA DESENVOLVIMENTO WEB OU LINGUAGEM DE PROGRAMAÇÃO

SELECT * FROM curso WHERE categoria_id = 1 OR categoria_id = 2;
SELECT * FROM curso WHERE categoria_id IN(1,2);--IN equivale (=) agrega vários parametros de vez

--UTILIZANDO QUERIES ANINHADAS
--BUSCAR TODOS OS CURSOS QUE ESTÃO DENTRO DE UMA CATEGORIA QUE NÃO POSSUI ESPAÇO
-- PASSO 1: BUSCAR OS IDs DE TODAS CATEGORIAS QUE NÃO POSSUEM ESPAÇOS NO NOME
SELECT id FROM categoria WHERE nome NOT LIKE '% %';
-- AGORA QUE JÁ TEMOS UMA QUERIE QUE RETORNA OS IDs DAS CATEGORIAS SEM ESPAÇO PODEMOS AGRUPAR A BUSCA DE CURSO
SELECT * FROM curso WHERE categoria_id IN(
	SELECT id FROM categoria WHERE nome NOT LIKE '% %'
);


--USANDO QUERIE DENTRO DO FROM, COMO O FROM APONTA PARA UMA TABELA PODEMOS INSERIR DENTRO DELE UMA QUERIE COM TANTO QUE ESSA RETORNE UMA TABELA
SELECT  categoria.nome categoria,
		COUNT(curso.id) qtd_cursos
	FROM categoria
JOIN curso ON categoria.id = curso.categoria_id
GROUP BY(categoria)
HAVING COUNT(curso.id) > 2

--NESSE CASO AO INVÉS DE INSERIR A QUERIE DENTRO DO FROM PODERIAMOS APENAS INCREMENTAR A QUERIE ACIMA COM O HAVING QUE JÁ RETORNARIA O RELATORIO DESEJADO
--MAS POR TREINO VAMOS INSERIR ASSIM MESMO
SELECT  categoria,
		qtd_cursos
	FROM(
		SELECT  categoria.nome categoria,
				COUNT(curso.id) qtd_cursos
			FROM categoria
		JOIN curso ON categoria.id = curso.categoria_id
		GROUP BY(categoria)
	)
WHERE qtd_cursos > 2


SELECT curso.nome,
       COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
    HAVING COUNT(aluno_curso.aluno_id) > 2
ORDER BY numero_alunos DESC;

SELECT  curso.nome curso,
		COUNT(aluno_curso.aluno_id) numero_alunos
	FROM curso
	JOIN aluno_curso ON curso.id = aluno_curso.curso_id
GROUP BY 1
ORDER BY numero_alunos DESC;

SELECT  curso,
		numero_alunos
	FROM(
			SELECT  curso.nome curso,
					COUNT(aluno_curso.aluno_id) numero_alunos
				FROM curso
			JOIN aluno_curso ON curso.id = aluno_curso.curso_id
			GROUP BY 1
			ORDER BY numero_alunos DESC
	)
WHERE numero_alunos > 2 