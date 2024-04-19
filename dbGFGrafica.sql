drop database dbGFGrafica;

create database dbGFGrafica;

use dbGFGrafica;

create table tbFuncionario(
idFunc int not null auto_increment,
nome varchar (50),
sexo char(1) not null default "F" check(sexo in("F","M")),
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

create table tbFornecedorPapel(
idFornPapel int not null auto_increment,
nome varchar (45),
quant char(30),
logradouro varchar(50),
cep char(9) unique,
numero char(30),
bairro varchar(50),
cnpj varchar(30) unique,
primary key (idFornPapel)
); 

create table tbFornecedorTinta(
idFornTinta int not null auto_increment,
nome varchar (45),
quant char(30),
logradouro varchar(50),
cep char(9) unique,
numero char(30),
bairro varchar(50),
cnpj varchar(30) unique,
primary key (idFornTinta)
);

create table tbCliente(
idCli int not null auto_increment,
nome varchar(30),
sexo char(1) not null default "F" check(sexo in("F","M")),
cpf_cnpj varchar(30) unique,
telefone varchar(20) unique,
email varchar(30) unique, 
senha varchar(30),
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
sexo char(1) not null default "F" check(sexo in("F","M")),
email varchar (50) unique,
senha varchar(20),
primary key (idUsu),
foreign key (idFunc) references tbFuncionario (idFunc)
);

create table tbProdFinal(
idProdFinal int not null auto_increment,
nome varchar (45),
idFornPapel int,
idFornTinta int,
primary key (idProdFinal),
foreign key (idFornTinta) references tbFornecedorTinta (idFornTinta),
foreign key (idFornPapel) references tbFornecedorPapel (idFornPapel)
);

create table tbProduto(
idProd int not null auto_increment,
idFornTinta int,
idFornPapel int,
nome varchar(50),
quant int,
dataEntrada date,
primary key (idProd),
foreign key (idFornTinta) references tbFornecedorTinta (idFornTinta),
foreign key (idFornPapel) references tbFornecedorPapel (idFornPapel)
);


create table tbVenda(
idVenda int not null auto_increment,
idCli int not null,
idUsu int not null,
idProdFinal int not null,
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
desc tbFornecedorPapel;
desc tbFornecedorTinta;
desc tbProdFinal;
desc tbCliente;
desc tbProduto;

insert into tbFuncionario(nome,sexo,cpf,telCel,salario,cargo,carteiraTrabalho,logradouro,cep,numero,bairro)
values("Adriana",'F',"187-478-658-47","11 97365-7985", 2000.00, "Dona Da Empresa","187-478-658-47","Rua: Antonio Carmim","05831-876",47,"Jardim Teles");

insert into tbFornecedorPapel(nome,quant,logradouro,cep,numero,bairro,cnpj)
values("Advance",100,"Rua: Jasmin Roles","07943-789","874","Jardim Rosa","20.414.574-1000-04");

insert into tbFornecedorTinta(nome,quant,logradouro,cep,numero,bairro,cnpj)
values("DupliCop",100,"Rua: Ana Tira","07343-832","874","Jardim Rui","30.414.364-1000-78");

insert into tbFornecedorTinta(nome,quant,logradouro,cep,numero,bairro,cnpj)
values("TintasLegal",100,"Rua: Ana Tira","07343-187","056","Jardim Rosa","30.414.574-1840-04");

insert into tbCliente(nome,sexo,cpf_cnpj,telefone,email,senha,logradouro,numero,bairro,cep)
values ("Rodrigo Silva Santos","M","737-785-203-93","11-97689-2054","rodrigo.silvas@gmail.com","12489","Rua: Jose Rodrigues",604,"Jardim Tule Alves","07989-432");

insert into tbProdFinal(nome,idFornPapel,idFornTinta)
values("Folheto",1,1);

insert into tbUsuario(idFunc,nome,sexo,email,senha)
values (1,"Adriana","F","adrianagf.grafica@hotmail.com","078947");

insert into tbProduto(idFornPapel,nome,quant,dataEntrada)
values (1,"Folha A5",150,'2024/02/08');

insert into tbProduto(idFornPapel,nome,quant,dataEntrada)
values (1,"Folha A4",200,'2024/07/30');

insert into tbProduto(idFornPapel,nome,quant,dataEntrada)
values (1,"Folha A1000",200,'2024/07/30');

insert into tbProduto(idFornTinta,nome,quant,dataEntrada)
values (1,"Tinta",20,'2024/10/20');

insert into tbVenda (idCli,idUsu,idProdFinal,quant,dataPedido,valor,Estatus,observacao,dataEntrega,FormaPagamento)
values (1,1,1,10,'2024/10/18',2000.00, "pronto", "nao molhar", '2024/10/30', 'Faturado');

select * from tbFuncionario;
select * from tbFornecedorTinta;
select * from tbFornecedorPapel;
select * from tbCliente;
select * from tbProdFinal;
select * from tbUsuario;
select * from tbProduto;
select * from tbVenda;

-- somando registros nas tabela

select sum(quant) from tbFornecedorTinta;
-- alterando registros nas tabela

update tbVenda set valor = 240.00 where idCli = 1;


-- Utilizando o delete
delete from tbProduto where nome = "Folha A1000";


select idVenda,valor from tbVenda where idCli = 1;


select * from tbProduto;