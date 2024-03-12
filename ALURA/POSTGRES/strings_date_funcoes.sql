--MANIPULANDO STRINGS
SELECT (primeiro_nome || ' ' || ultimo_nome) nome_completo FROM aluno;

SELECT CONCAT(primeiro_nome, ' ', ultimo_nome) nome_completo FROM aluno;

SELECT CHAR_LENGTH(TRIM(UPPER(CONCAT(primeiro_nome, ' ', ultimo_nome)) || ' ')) nome_completo FROM aluno;

--MANIPULANDO DATAS
SELECT NOW() data_atual; --DATA E HORA ATUAL (YYYY-MM-DD HH:MM:SS)
SELECT NOW()::DATE data_atual; --APENAS A DATA ATUAL (YYYY-MM-DD)

SELECT  (primeiro_nome || ' ' || ultimo_nome) nome_completo,
		(NOW()::DATE - data_nascimento) idade --MOSTRA A IDADE EM DIAS
	FROM aluno;
	
SELECT  (primeiro_nome || ' ' || ultimo_nome) nome_completo,
		(NOW()::DATE - data_nascimento)/365 idade --MOSTRA A IDADE EM ANOS
	FROM aluno;
	
-- SE UTILIZANDO DA FUNÇÃO AGE() DO POSTGRESQL
SELECT	(primeiro_nome || ' ' || ultimo_nome) nome_completo,
		AGE(data_nascimento) idade --MOSTRA A IDADE COM DIAS, MESES E ANOS
	FROM aluno;

-- UTILIZANDO A FUNÇÃO EXTRACT PARA MOSTRAR APENAS OS ANOS
SELECT  (primeiro_nome || ' ' || ultimo_nome) nome_completo,
		EXTRACT(YEAR FROM AGE(data_nascimento)) --EXTRACT YEAR FROM VAI EXIBIR APENAS OS ANOS
	FROM aluno;
	
-- FUNÇÕES DE CONVERSÃO

SELECT  (primeiro_nome || ' ' || ultimo_nome) nome_completo,
		TO_CHAR(AGE(data_nascimento), 'YY')
	FROM aluno;
	
-- TO_CHAR()
SELECT TO_CHAR(NOW(), 'DD,  MONTH, YYYY');
SELECT TO_CHAR(NOW(), 'DD-MM-YYYY');
SELECT TO_CHAR(138.921, '999999D99') --FIXA 02 CASAS DECIMAIS