drop database dbGFGrafica;

create database dbGFGrafica;

use dbGFGrafica;

create table tbFuncionario(
idFunc int not null auto_increment,
nome varchar (50),
cpf char(14),
telCel char(9) not null unique,
salario decimal(9,2) default 0 check(salario >=0),
cargo varchar(50),
carteiraTrabalho varchar (50),
logradouro varchar(50),
cep char(9),
numero char(30),
bairro varchar(50),
primary key (idFunc)
);

create table tbFornecedores(
idForn int not null auto_increment,
nome varchar (45),
logradouro varchar(50),
cep char(9),
numero char(30),
bairro varchar(50),
cnpj varchar(30),
primary key (idForn)
); 

create table tbUsuario(
idUsu int not null auto_increment,
idFunc int not null,
nome varchar (100) not null,
senha varchar(10) not null,
primary key (idUsu),
foreign key (idFunc) references tbFuncionario (idFunc)
);

create table tbCliente(
idCli int not null auto_increment,
nome varchar(30),
cpf_cnpj varchar(30),
telefone varchar(20),
email varchar(30),
logradouro varchar(30),
numero varchar(15),
bairro varchar(30),
cep varchar(15),
primary key (idCli)
);

create table tbProduto(
idProd int not null auto_increment,
idForn int not null,
nome varchar(50),
formato varchar (50),
tipo varchar (30),
cores varchar (30),
primary key (idProd),
foreign key (idForn) references tbFornecedores(idForn)
);

create table tbVenda(
idVenda int not null auto_increment,
idCli int not null,
idUsu int not null,
idProd int not null,
dataPedido datetime,
valor decimal(10,2),
Estatus varchar(30),
observacao varchar(200),
dataHoraEntrega datetime,
primary key (idVenda),
foreign key (idCli) references tbCliente (idCli),
foreign key (idUsu) references tbUsuario (idUsu),
foreign key (idProd) references tbProduto (idProd)
);

show tables;


desc tbVenda;
desc tbFuncionario;
desc tbUsuario;
desc tbFornecedores;
desc tbCliente;
desc tbProduto;
