select * from alunos
	where altura >= 1.7;
	
select * from alunos
	where altura between 1 and 1.7;
	
insert into alunos(nome) values('Crislaine Frangueiro');
insert into alunos(nome) values('João Marildo');
insert into alunos(nome) values('José Antonieto');
insert into alunos(nome) values('Maria José');
insert into alunos(nome) values('Daniel Ferreira');


select * from alunos
	where cpf is null;

select * from alunos
	where nome like 'D%'
	and cpf is not null;
	
select * from alunos
	where nome like 'Diego' 
	or nome like 'Daniel%'
	or nome like 'Diogo';
	
select * from alunos
	where nome like 'D%'
	and cpf is not null;
	
create table cursos(
	id integer primary key,
	nome varchar(255) not null
);

select * from cursos;

insert into cursos(id, nome) values(1, 'HTML');
insert into cursos(id, nome) values(2, 'Javascript');

drop table alunos;

create table alunos(
	id serial primary key,
	nome varchar(255) not null
);

select * from alunos;

insert into alunos(nome) values('Diogo');
insert into alunos(nome) values('Vinicius');

drop table cursos;

create table alunos_cursos(
	aluno_id integer,
	curso_id integer,
	primary key(aluno_id, curso_id),
	
	foreign key(aluno_id)
		references alunos(id),
	foreign key(curso_id)
		references cursos(id)
);

insert into alunos_cursos(aluno_id, curso_id) values(1, 2);
insert into alunos_cursos(aluno_id, curso_id) values(1, 1);
insert into alunos_cursos(aluno_id, curso_id) values(2, 1);

select 
	aluno_id as "Id do aluno",
	curso_id as "Id do curso"
from alunos_cursos;

select 
	alunos.id as "Id do aluno",
	alunos.nome as "Nome do aluno",
	cursos.id as "Id do curso",
	cursos.nome as "Nome do curso"
	from alunos
inner join alunos_cursos on alunos.id = alunos_cursos.aluno_id
inner join cursos        on cursos.id = alunos_cursos.curso_id;
	
insert into alunos(nome) values('Fernanda');

select 
	alunos.id as "ID do Aluno",
	alunos.nome as "Nome do Aluno",
	cursos.nome as "Nome do curso"
	from alunos
left join alunos_cursos on alunos.id = alunos_cursos.aluno_id
left join cursos	    on cursos.id = alunos_cursos.curso_id;

select 
	alunos.id as "ID do Aluno",
	alunos.nome as "Nome do Aluno",
	cursos.nome as "Nome do Curso"
	from alunos
right join alunos_cursos on alunos.id = alunos_cursos.aluno_id
right join cursos        on cursos.id = alunos_cursos.curso_id;

insert into cursos(id, nome) values(3, 'CSS');

select 
	alunos.id as "ID do Aluno",
	alunos.nome as "Nome do Aluno",
	cursos.nome as "Nome do Curso"
	from alunos
full join alunos_cursos on alunos.id = alunos_cursos.aluno_id
full join cursos        on cursos.id = alunos_cursos.curso_id;

select 
	alunos.id as "ID do aluno",
	alunos.nome as "Nome do Aluno",
	cursos.nome as "Nome do curso"
	from alunos
cross join cursos;

drop table alunos_cursos;

create table alunos_cursos(
	aluno_id integer,
	curso_id integer,
	primary key(aluno_id, curso_id),
	
	foreign key(aluno_id)
		references alunos(id)
		on delete cascade,
	foreign key(curso_id)
		references cursos(id)
);

insert into alunos(nome) values('teste');
insert into alunos_cursos(aluno_id, curso_id) values(7, 3);

select * from alunos;
select * from alunos_cursos;

delete from alunos where id = 6;

drop table alunos_cursos;

create table alunos_cursos(
	aluno_id integer,
	curso_id integer,
	primary key(aluno_id, curso_id),
	
	foreign key(aluno_id)
		references alunos(id)
		on delete cascade
		on update cascade,
	foreign key(curso_id)
		references cursos(id)
);

update alunos 
	set id = 4
	where id = 7;
	
select * from alunos;


create table funcionarios(
	id serial primary key,
	matricula varchar(10),
	nome varchar(255),
	sobrenome varchar(255)
);

insert into funcionarios(matricula, nome, sobrenome) values('M001', 'José', 'Amaral');
insert into funcionarios(matricula, nome, sobrenome) values('M002', 'João', 'Ferreira');
insert into funcionarios(matricula, nome, sobrenome) values('M003', 'Marilda', 'Matias');
insert into funcionarios(matricula, nome, sobrenome) values('M004', 'Antonieta', 'Costa');
insert into funcionarios(matricula, nome, sobrenome) values('M005', 'Alexandre', 'Silveira');
insert into funcionarios(matricula, nome, sobrenome) values('M006', 'Anazuila', 'Alves');

select * from funcionarios
	order by nome desc, sobrenome;

select * from funcionarios 
	order by 1;

select * from alunos
	inner join alunos_cursos on alunos.id = alunos_cursos.aluno_id
	inner join cursos on cursos.id = alunos_cursos.curso_id
	order by 6, 3;
	
select * from alunos
	full join alunos_cursos on alunos.id = alunos_cursos.aluno_id
	full join cursos on cursos.id = alunos_cursos.curso_id
	order by alunos.nome, cursos.nome;
	
insert into alunos(nome) values('Diogo Ferreira');
insert into alunos(nome) values('Diogo Almeida');
insert into alunos(nome) values('Diogo Samuel');

insert into alunos_cursos(aluno_id, curso_id) values(8, 3);
insert into alunos_cursos(aluno_id, curso_id) values(9, 3);
insert into alunos_cursos(aluno_id, curso_id) values(10, 2);

update alunos_cursos
	set curso_id = 1
where aluno_id = 9;

update alunos 
	set nome = 'Diogo Almeida'
	where id = 8 
	or id = 10;
	
select * from funcionarios
	order by id desc
	limit 4
	offset 2;

insert into funcionarios(matricula, nome, sobrenome) values('M007', 'Diogo', 'Mascarenhas');
insert into funcionarios(matricula, nome, sobrenome) values('M008', 'Nico', 'Stepamt');

-- count: retorna a quantidade de registros
-- sum: retorna a soma dos registros
-- max: retorna o maior registro
-- min: retorna o menor registro
-- avg: retorna a media dos registros (sum/count)

select count(id),
	sum(id),
	max(id),
	min(id),
	round(avg(id),1)
from funcionarios;


-- group by

select cursos.nome,
	   count(alunos.id)	
	from alunos
	join alunos_cursos on alunos.id = alunos_cursos.aluno_id
	join cursos on cursos.id = alunos_cursos.curso_id
group by cursos.nome
order by cursos.nome;

select alunos.nome,
	   count(cursos.id)
	   from alunos
full join alunos_cursos on alunos.id = alunos_cursos.aluno_id
full join cursos on cursos.id = alunos_cursos.curso_id
group by alunos.nome, alunos.id
order by alunos.id;

select * from alunos
	full join alunos_cursos on alunos.id = alunos_cursos.aluno_id
	full join cursos on cursos.id = alunos_cursos.curso_id
order by cursos.nome;

-- distinct: retorna o select sem os valores repetidos

insert into funcionarios(matricula, nome, sobrenome) values('M009', 'Diogo', 'Mascarenhas');
insert into funcionarios(matricula, nome, sobrenome) values('M010', 'Diogo', 'Vinicius');
insert into funcionarios(matricula, nome, sobrenome) values('M011', 'Diogo', 'Mascarenhas');

-- Aqui o distinct irá mostrar apenas um registro do Diogo já que ele repete 4 vezes e 
-- selecionei apenas por nome, então onde o nome se repetir vamos visualizar apenas 1
select distinct nome
from funcionarios;

-- O distinct pode ser usado com mais de um parametro, possibilitando uma filtragem mais 
-- refinada
select distinct 
	nome, sobrenome
	from funcionarios
order by nome;

select nome,
	   sobrenome,
	   count(nome)
	   from funcionarios
group by nome, sobrenome
order by nome;

select nome,
	   sobrenome,
	   count(id)
	   from funcionarios
group by (1, 2)
order by 1
limit 6;

select nome,
	   sobrenome,
	   count(nome)
	   from funcionarios
group by(nome, sobrenome)
order by(nome) 
limit 4
offset 0;

select cursos.nome,
	   count(alunos.id)
	   from alunos
inner join alunos_cursos on alunos.id = alunos_cursos.aluno_id
inner join cursos on alunos_cursos.curso_id = cursos.id
group by(1)
order by 1;

select * from alunos
full join alunos_cursos on alunos.id = alunos_cursos.aluno_id
full join cursos on alunos_cursos.curso_id = cursos.id;

SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome;
  
  
-- Função having: usado para fazer buscas dentro de agrupamentos

select nome,
	   count(id)
	   from funcionarios
group by(1)
having count(id) = 1
order by 1;

select * from funcionarios

insert into funcionarios(matricula, nome, sobrenome) values('M012', 'José', 'Ferreira');
insert into funcionarios(matricula, nome, sobrenome) values('M013', 'José', 'Ferreira');
insert into funcionarios(matricula, nome, sobrenome) values('M014', 'Nico', 'Santos');