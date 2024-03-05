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


create table tbCliente(
idCli int not null auto_increment,
nome varchar(30),
cpf_cnpj varchar(30) unique,
telefone varchar(20) unique,
email varchar(30),
senha varchar(30),
logradouro varchar(30),
numero varchar(15),
bairro varchar(30),
cep varchar(15),
primary key (idCli)
);

create table tbProdFinal(
idProdFinal int not null auto_increment,
nome varchar (45),
primary key (idProdFinal)
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

create table tbProduto(
idProd int not null auto_increment,
idForn int not null,
nome varchar(50),
quant int,
dataEntrada date,
primary key (idProd),
foreign key (idForn) references tbFornecedores (idForn)
);


create table tbVenda(
idVenda int not null auto_increment,
idCli int not null,
idUsu int not null,
idProdFinal int not null,
ProdVend varchar (50),
quant int,
dataPedido date,
valor decimal(10,2),
Estatus varchar(30),
observacao varchar(200),
dataEntrega date,
FormaPagamento varchar (30),
primary key (idVenda),
foreign key (idCli) references tbCliente (idCli),
foreign key (idUsu) references tbUsuario (idUsu),
foreign key (idProdFinal) references tbProdFinal (idProdFinal)
);

show tables;

desc tbVenda;
desc tbFuncionario;
desc tbUsuario;
desc tbFornecedores;
desc tbProdFinal;
desc tbCliente;
desc tbProduto;

insert into tbFuncionario(nome,cpf,telCel,salario,cargo,carteiraTrabalho,logradouro,cep,numero,bairro)
values("Adriana","187-478-658-47","11 97365-7985", 2000.00, "Dona Da Empresa","187-478-658-47","Rua: Antonio Carmim","05831-876",47,"Jardim Teles");

insert into tbFornecedores(nome,logradouro,cep,numero,bairro,cnpj)
values("Advance","Rua: Jasmin Roles","07943-789","874","Jardim Rosa","20.414.574-1000-04");

insert into tbFornecedores(nome,logradouro,cep,numero,bairro,cnpj)
values("DupliCop","Rua: Ana Tira","07343-832","874","Jardim Rui","30.414.364-1000-78");

insert into tbCliente(nome,cpf_cnpj,telefone,email,senha,logradouro,numero,bairro,cep)
values ("Rodrigo Silva Santos","737-785-203-93","11-97689-2054","rodrigo.silvas@gmail.com","12489","Rua: Jose Rodrigues",604,"Jardim Tule Alves","07989-432");

insert into tbProdFinal(nome)
values("Folheto");

insert into tbUsuario(idFunc ,nome,email,senha)
values (1,"Adriana","adrianagf.grafica@hotmail.com","078947");

insert into tbProduto(idForn,nome,quant,dataEntrada)
values (1,"Folha A5",150,'2024/02/08');

insert into tbProduto(idForn,nome,quant,dataEntrada)
values (1,"Folha A4",200,'2024/07/30');

insert into tbProduto(idForn,nome,quant,dataEntrada)
values (2,"Tinta",20,'2024/10/20');

insert into tbVenda (idCli,idUsu,idProdFinal,ProdVend,quant,dataPedido,valor,Estatus,observacao,dataEntrega,FormaPagamento)
values (1,1,1,"Folheto",10,'2024/10/18',200.00, "pronto", "nao molhar", '2024/10/30', 'Faturado');



select * from tbFuncionario;
select * from tbFornecedores;
select * from tbCliente;
select * from tbProdFinal;
select * from tbUsuario;
select * from tbProduto;
select * from tbVenda;


