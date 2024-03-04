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

select * from cursos

