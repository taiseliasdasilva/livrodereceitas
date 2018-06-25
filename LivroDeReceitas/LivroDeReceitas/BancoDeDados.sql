-- criando base de dados
CREATE DATABASE LivroDeReceitas
GO

-- usando base de dados criada
USE LivroDeReceitas
GO

-- criando tabela de usuario
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'usuario')
   DROP TABLE usuario
GO

create table usuario (
	id int  primary key identity(1,1) not null,
	nome varchar(100) not null,
	email  varchar(200) not null,
	dataNascimento date not null,
	senha varchar(50) not null,
	sexo char(1)
);
go

--criando tabela de tipos de receita
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tipo_receita')

  DROP TABLE tipo_receita
GO

create table tipo_receita(
	id int primary key identity (1,1) not null,
	nome  varchar(100) not null,
);
go

insert into tipo_receita values ('Salgada');
insert into tipo_receita values ('Doce');
go

-- criando tabela de receitas
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'receitas')
   DROP TABLE receitas
GO

create table receitas (
	id int primary key identity(1,1) not null,
	nome varchar(100) not null,
	id_tipo integer references tipo_receita(id),
	ingredientes varchar(max) not null,
	modo_preparo varchar(max) not null,
	url_video varchar (1000) ,
	foto varchar(1000),
	id_usuario integer not null references usuario(id)
);
go

-- criando tabela de comentários
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'comentarios')
   DROP TABLE comentarios
GO

create table comentarios (
	id int primary key identity(1,1) not null,
	id_receita integer not null references receitas(id),
	id_usuario integer not null references usuario(id),
	data_hora datetime not null default getdate(),
	texto varchar(2000) not null,
);
go

select * from usuario;
select * from receitas;
select * from tipo_receita;
select * from comentarios;