-- criando base de dados
CREATE DATABASE RECEITAS
GO

-- usando base de dados criada
USE RECEITAS
GO

-- criando tabela de usuario
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'usuario')
   DROP TABLE usuario
GO

create table usuario (
	id int identity(1,1) not null,
	nome varchar(100) not null,
	email  varchar(50) not null,
	dataNascimento date not null,
	senha varchar(50) not null,
	sexo char(1),
	
	constraint [pk_usuario] primary key clustered (id)		
);
go

-- criando tabela de receitas
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'receitas')
   DROP TABLE receitas
GO

create table receitas (
	id int identity(1,1) not null,
	nome varchar(100) not null,
	tipo varchar(2) not null,
	ingredientes varchar(50) not null,
	modoPreparo varchar(50) not null,
	constraint [pk_receitas] primary key clustered (id)		
);
go

-- criando tabela de visualizar
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'visualizar')
   DROP TABLE visualizar
GO

create table visualizar (
	id int identity(1,1) not null,
	comentarios varchar(50) not null
	constraint [pk_visualizar] primary key clustered (id)		
);
go

--criando tabela de login
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'login')

  DROP TABLE login
GO

create table login(
	id int identity(1,1) not null,
	usuario varchar(100) not null,
	senha varchar(50) not null,
	constraint [pk_login] primary key clustered (id)		
);
go

--criando tabela de comentarios
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'comentarios')

  DROP TABLE comentarios
GO

create table comentarios(
	id int identity(1,1) not null,
	nome varchar(50) not null,
	ingredientes varchar(50) not null,
	modoPreparo varchar(50) not null,
	Comentarios varchar(50) not null
	constraint [pk_comentarios] primary key clustered (id)		
);
go



select *from usuario;
select*from receitas;
select*from visualizar;
select* from login;
select* from comentarios;


