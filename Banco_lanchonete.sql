create database lanchonete;

use lanchonete;

create table tipoproduto (
  idtipoproduto int not null auto_increment,
  tipo varchar(20) not null,
  primary key (idtipoproduto)
);

create table produto (
  idproduto int not null auto_increment,
  descricao varchar(50) not null,
  valor decimal (10,2) not null,
  idtipoproduto int not null,
  primary key (idproduto),
  foreign key (idtipoproduto) references tipoproduto(idtipoproduto)
);

create table  cliente (
  idcliente int not null auto_increment,
  nome varchar(50) not null,
  telefone char(10) not null,
  primary key (idcliente)
);

create table pedido (
  idpedido int not null auto_increment,
  data date not null,
  idcliente int not null,
  primary key (idpedido),
  foreign key (idcliente) references cliente (idcliente)
);

create table itempedido (
  iditempedido int not null auto_increment,
  idpedido int not null,
  idproduto int not null,
  quantidade int not null,
  valor  decimal(10,2),
  primary key (iditempedido),
  foreign key (idpedido) references pedido (idpedido),
  foreign key (idproduto) references produto (idproduto)
);

insert into tipoproduto (tipo) values 
('Bebida'),
('Massa'),
('Sanduiche');

insert into produto (descricao, valor, idtipoproduto) values
('Refrigerante 1L',6.5,1),
('Refrigerante 2L',8,1),
('Pizza Calabreza M',15,2),
('Pizza Calabreza G',20,2),
('Pizza Mussarela M',15,2),
('Pizza Mussarela G',20,2),
('Hamburger',8,3),
('Eggsburger',10,3),
('X Tudo',12,3);

insert into cliente (nome, telefone) values
('José','9911-1111'),
('Pedro','9922-2222'),
('Maria','9933-3333'),
('João','9944-4444'),
('Joana','9955-5555'),
('Luis','9966-6666');

insert into pedido (data, idcliente) values
('2018-11-01',3),
('2018-11-01',1),
('2018-11-03',6),
('2018-11-05',5),
('2018-11-10',4),
('2018-11-12',4),
('2018-11-14',1),
('2018-11-14',2);

insert into itempedido (idpedido, idproduto, quantidade, valor) values
(1,3,2,15), (1,2,1,8),
(2,8,1,10), (2,9,1,12), (2,1,1,6.5),
(3,6,1,20), (3,1,1,8),
(4,8,1,10), (4,9,1,12), (4,1,1,6.5),
(5,5,1,15), (5,2,1,8),
(6,4,1,20),
(7,7,1,8), (7,1,1,8),
(8,2,1,8), (8,4,1,20), (8,6,1,20);

show tables;

desc cliente;

select * from cliente;

select * from produto;

select * from itempedido;

select * from tipoproduto;

select idcliente, nome, telefone from cliente;

select idpedido, idproduto, quantidade from itempedido;

update produto set valor = valor + 1
	where idtipoproduto = 3;
    
update cliente set nome = "Luis Claudio"
	where idcliente = 6;

insert into produto (descricao, valor, idtipoproduto) values ('Lasanha', 25, 2);

insert into pedido (data, idcliente) values ('2018-11-15', 6);

insert into itempedido (idpedido, idproduto, quantidade, valor) 
values 
(9, 1, 1, 6.5), (9, 10, 1, 25);

