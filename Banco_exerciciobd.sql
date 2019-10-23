create database exerciciobd;  -- criação do banco de dados

use exerciciobd;

create table cliente ( 
id_cliente  int,
nome_cliente  varchar(60)  not null,
cpf  char(11) not null unique,
endereco  varchar(60),
saldo  numeric(10,2) check (saldo>0),
uf  char(2)  check(uf in ("MA","CE","PI","RN")),
primary key(id_cliente)
);

create table departamento (
id_departamento integer,
nome_departamento varchar(60),
primary key(id_departamento)
);

create table empregado (
id_empregado integer, id_depto integer,
nome_empregado varchar(60),
primary key(id_empregado),
foreign key(id_depto) references
departamento(id_departamento)
);

show tables;

create table dvd (
id_dvd integer,
titulo varchar(100),
genero varchar(60),
primary key(id_dvd)
);

create table locacao (
id_locacao integer,
data varchar(10),
primary key(id_locacao)
);

create table item_locacao (
id_dvd integer,
id_locacao integer,
primary key(id_locacao,id_dvd),
foreign key(id_dvd) references dvd(id_dvd),
foreign key(id_locacao) references locacao(id_locacao)
);

alter table cliente add email
varchar(255);

alter table cliente modify column email varchar(100);

alter table cliente change column email e_mail varchar(120);

alter table cliente drop column e_mail;

describe cliente;

select * from cliente;

insert into cliente value (1, "Felipe", "65432198745", "Bacanga", 0, "MA");

insert into cliente value (2, "Tiago", "11111111111", "Cohama", 1000, "MA");

insert into cliente value (3, "Carlos", "22222222222", "Cohab", 2000, "MA");

update cliente set endereco = 'Anjo da Guarda'
	where id_cliente = 1;
    
update cliente set saldo = 100000
	where id_cliente = 1;

delete from cliente where id_cliente = 4;

update cliente set endereco = null where id_cliente = 1;