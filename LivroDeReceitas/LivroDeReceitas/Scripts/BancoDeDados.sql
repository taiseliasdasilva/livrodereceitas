-- usando base de dados criada
USE RECEITAS
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


--criando tabela de usuario
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tipo_receita')

  DROP TABLE tipo_receita
GO

create table tipo_receita(
	id int primary key identity (1,1) not null,
	nome  varchar(100) not null,
)

-- criando tabela de receitas
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'receitas')
   DROP TABLE receitas
GO

create table receitas (
	id int primary key identity(1,1) not null,
	nome varchar(100) not null,
	id_tipo integer  references tipo_receita(id),
	ingredientes varchar(max) not null,
	modo_preparo varchar(max) not null,
	url_video varchar (1000) ,
	foto varchar(1000)
);
go

-- criando tabela de visualizar
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'visualizar')
   DROP TABLE visualizar
GO

create table visualizar (
	id int primary key identity(1,1) not null,
	comentarios varchar(50) not null,
);
go




insert into tipo_receita values ('Salgada')
insert into  tipo_receita values ('Doce')

select*from receitas;
select*from visualizar;
select* from usuario;
select * from tipo_receita;