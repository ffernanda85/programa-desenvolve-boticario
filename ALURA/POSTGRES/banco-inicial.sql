--CREATE DATABASE alura;
DROP DATABASE alura;
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

INSERT INTO aluno(primeiro_nome, ultimo_nome, data_nascimento) 
	VALUES  ('Flávia', 'Santos', '1985-08-29'),
			('Izabela', 'Silva', '1983-09-18'),
			('Fabíola', 'Santos', '1982-11-20'),
			('Fabiana', 'Santos', '1980-05-06'),
			('Edy', 'Mendonça', '1979-06-19');

SELECT * FROM aluno;

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

SELECT * FROM categoria

INSERT INTO categoria(nome) 
	VALUES  ('Linguagem Programação'),
			('Computação em Nuvem'),
			('Dados'),
			('Segurança da Informação')
						
update categoria set id = 5 where id = 11;

delete from categoria where id > 1;

select * from categoria order by id
	
CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

INSERT INTO curso(nome, categoria_id)
	VALUES  ('Frontend', 1),
			('Backend', 1),
			('FullStack', 1),
			('JavaScript', 2),
			('Python', 2),
			('AWS', 3),
			('Ciências de Dados', 4),
			('Cibersegurança', 5);

select * from curso
	
CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno_curso(aluno_id, curso_id)
	VALUES  (3, 3),
			(2, 3),
			(5, 3);

SELECT * FROM aluno_curso

SELECT  curso.nome Curso,
		categoria.nome categoria, 
		COUNT(aluno_curso.aluno_id) QTD_Alunos
	FROM curso
JOIN aluno_curso ON curso.id = aluno_curso.curso_id
JOIN categoria ON curso.categoria_id = categoria.id
GROUP BY(1, 2)
ORDER BY QTD_Alunos DESC --DO MAIOR PARA O MENOR
LIMIT 1 --LIMITA NOSSO RELATÓRIO A UM ÚNICO RESULTADO
OFFSET 1 --NESSE CASO MOSTRA SEGUNDO CURSO COM MAIS ALUNOS

SELECT DISTINCT ultimo_nome FROM aluno  

SELECT  primeiro_nome Aluno,
		ultimo_nome sobrenome,
		COUNT(aluno_curso.curso_id) QTD_Cursos
		FROM aluno
JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
--JOIN curso ON curso.id = aluno_curso.curso_id
GROUP BY(1, 2)
ORDER BY 3 DESC
LIMIT 1

SELECT	curso.nome curso,
		COUNT(aluno_curso.aluno_id) QTD_ALUNOS
		FROM curso
JOIN aluno_curso ON curso.id = aluno_curso.curso_id
GROUP BY(1)
ORDER BY (QTD_ALUNOS) DESC
LIMIT 1

SELECT	categoria.nome categoria_curso,
		COUNT(aluno_curso.aluno_id) qtd_alunos
	FROM categoria
JOIN curso ON curso.categoria_id = categoria.id
JOIN aluno_curso ON curso.id = aluno_curso.curso_id
	GROUP BY 1
	ORDER BY qtd_alunos DESC	
	
	SELECT * FROM categoria