create database loja;

use loja;

create table cliente (
  cod_cliente int not null auto_increment,
  nome varchar(50) not null,
  fone varchar(14),
  primary key (cod_cliente)
);

create table produto (
  cod_prod int not null auto_increment,
  descricao varchar(50),
  valor_unit numeric(10,2),
  primary key (cod_prod)
);

create table nota_fiscal (
  id_nf int not null auto_increment,
  data_venda date not null,
  cod_cliente int not null,
  primary key (id_nf),
  foreign key (cod_cliente) references cliente (cod_cliente)
);

create table item_nota_fiscal (
  id_nf int not null,
  id_item int not null,
  cod_prod int not null,
  valor_unit decimal (10,2),
  quantidade int not null,
  desconto decimal (5,2),
  primary key (id_nf, id_item),
  foreign key (id_nf) references nota_fiscal (id_nf),
  foreign key (cod_prod) references produto (cod_prod)
);

insert into cliente (nome, fone) values ('João das Neves', '(98)98888-8888');
insert into cliente (nome, fone) values ('Kalel de Oliveira', '(98)98877-7777');
insert into cliente (nome, fone) values ('Leia Organa', '(98)98866-6666');

insert into produto (descricao, valor_unit) values ('Display LCD', 25);
insert into produto (descricao, valor_unit) values ('Protoboard 400 pontos', 13.5);
insert into produto (descricao, valor_unit) values ('Modulo wifi', 15);
insert into produto (descricao, valor_unit) values ('Rolo de solda', 10);
insert into produto (descricao, valor_unit) values ('Ferro de solda', 30);

insert into nota_fiscal (data_venda, cod_cliente) values ('2018-05-27',3);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-05-28',1);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-05-28',3);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-06-01',2);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-06-01',1);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-06-01',3);
insert into nota_fiscal (data_venda, cod_cliente) values ('2018-06-02',2);

insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (1,1,1, 25.00,10,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (1,2,2, 13.50,3);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (1,3,3, 15.00,2);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (1,4,4, 10.00,1);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (1,5,5, 30.00,1);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (2,1,3,15.00,4);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (2,2,4,10.00,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (2,3,5,30.00,7);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (3,1,1,25.00,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (3,2,4,10.00,4);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (3,3,5,30.00,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (3,4,2,13.50,7);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (4,1,5,30.00,10,15);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (4,2,4,10.00,12,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (4,3,1,25.00,13,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (4,4,2,13.50,15,5);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (5,1,3,15.00,3);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade) values (5,2,5,30.00,6);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (6,1,1,25.00,22,15);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (6,2,3, 15.00,25,20);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (7,1,1,25.00,10,3);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (7,2,2,13.50,10,4);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (7,3,3,15.00,10,4);
insert into item_nota_fiscal ( id_nf, id_item, cod_prod, valor_unit, quantidade, desconto) values (7,4,5,30.00,10,1);

select * from produto;
select * from cliente;
select * from item_nota_fiscal;

show tables;

desc produto;

/*having: filtro (ou checagem) para o group by*/

select c.nome, count(n.id_nf) from cliente as c, nota_fiscal as n
	where c.cod_cliente = n.cod_cliente
    group by c.nome having count(n.id_nf) > 2;
    
select n.id_nf, n.data_venda, sum(i.valor_unit*i.quantidade) as 'Total' from
	nota_fiscal as n, item_nota_fiscal as i
    where n.id_nf = i.id_nf
    group by n.id_nf, n.data_venda having sum(i.valor_unit*i.quantidade) > 500;
    
