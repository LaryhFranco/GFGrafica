drop database dbGFGrafica;

create database dbGFGrafica;

use dbGFGrafica;

create table tbFuncionario(
idFunc int not null auto_increment,
nome varchar (50),
cpf char(14) unique,
telCel char(9) not null unique,
salario decimal(9,2) default 0 check(salario >=0),
cargo varchar(50),
carteiraTrabalho varchar (50) unique,
logradouro varchar(50),
cep char(9) unique,
numero char(30),
bairro varchar(50),
primary key (idFunc)
);

create table tbFornecedores(
idForn int not null auto_increment,
nome varchar (45),
logradouro varchar(50),
cep char(9) unique,
numero char(30),
bairro varchar(50),
cnpj varchar(30) unique,
primary key (idForn)
); 

create table tbProduto(
idProd int not null auto_increment,
nome varchar(50),
descricao varchar (100),
quant varchar(25),
primary key (idProd)
);


create table tbCliente(
idCli int not null auto_increment,
nome varchar(30),
cpf_cnpj varchar(30) unique,
telefone varchar(20) unique,
email varchar(30),
logradouro varchar(30),
numero varchar(15),
bairro varchar(30),
cep varchar(15),
primary key (idCli)
);

create table tbUsuario(
idUsu int not null auto_increment,
idFunc int not null,
nome varchar (100),
email varchar (100),
senha varchar(20),
primary key (idUsu),
foreign key (idFunc) references tbFuncionario (idFunc)
);

create table tbVenda(
idVenda int not null auto_increment,
idCli int not null,
idUsu int not null,
idProd int not null,
dataPedido date,
valor decimal(10,2),
Estatus varchar(30),
observacao varchar(200),
dataEntrega date,
FormaPagamento varchar (30),
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

insert into tbFuncionario(nome,cpf,telCel,salario,cargo,carteiraTrabalho,logradouro,cep,numero,bairro)
values("Adriana","187-478-658-47","11 97365-7985", 2000.00, "Dona Da Empresa","187-478-658-47","Rua: Antonio Carmim","05831-876",47,"Jardim Teles");

insert into tbFornecedores(nome,logradouro,cep,numero,bairro,cnpj)
values("A4 Folhas","Rua: Jasmin Roles","07943-789","874","Jardim Rosa","20.414.574-1000-04");

insert into tbCliente(nome,cpf_cnpj,telefone,email,logradouro,numero,bairro,cep)
values ("Rodrigo Silva Santos","737-785-203-93","11-97689-2054","rodrigo.silvas@gmail.com","Rua: José Rodrigues","604","Jardim Tule Alves","07989-432");

insert into tbUsuario(idFunc,nome,email,senha)
values (1,"Adriana","adrianagf.grafica@hotmail.com","078947");

insert into tbProduto(nome,descricao,quant)
values ("Folheto","Papel couche 150g, 4x4 cores, formato 10x14cm",1000);

insert into tbProduto(nome,descricao,quant)
values ("Banner","formato 90x60cm 4x0 cores lona 340g",1);

insert into tbProduto(nome,descricao,quant)
values ("Cartões de Visita","formato 90x60cm 4x0 cores lona 340g",1000);

insert into tbProduto(nome,descricao,quant)
values ("Blocos de pedido","formato 21x15cm, 1x0 cor, off-set 75g",10);

insert into tbVenda (idCli,idUsu,idProd,dataPedido,valor,Estatus,observacao,dataEntrega,FormaPagamento)
values (1, 1, 1,'01/02/2024',200.00, "pronto", "nao molhar", '05/02/2024', 'Faturado');



select * from tbFuncionario;
select * from tbFornecedores;
select * from tbUsuario;
select * from tbCliente;
select * from tbProduto;
select * from tbVenda;


