create database banco;

use banco;

create table tipoConta (
	idTipoConta int,
    Descricao varchar(45) not null,
    primary key(idTipoConta)
);

create table Cliente (
	idCliente int,
    nome varchar(45) not null,
	data_nascimento date,
    primary key(idCliente)
);

create table Conta (
	idConta int,
    data_abertura date not null,
    saldo decimal(10,2) not null,
    idTipoConta int not null,
    idCliente int not null,
    primary key(idConta),
    foreign key(idTipoConta) references tipoConta(idTipoConta),
    foreign key(idCliente) references Cliente(idCliente)
);

 create table Movimento (
	idMovimento int,
    data_hora datetime not null,
    credito_debito char(1) not null,
    numero_documento varchar(20) not null,
    valor decimal(10,2),
    idConta int not null,
    primary key(idMovimento),
    foreign key(idConta) references Conta(idConta)
 );
 
desc Movimento;
 
alter table Cliente
add cpf char(14) not null;
 
alter table Movimento
change column numero_documento NR_DOC varchar(30) not null;
 
alter table Movimento 
drop column credito_debito;

create table tipoMovimento (
	idTipoMovimento int,
	descricao varchar(20) not null,
    primary key (idTipoMovimento)
);

alter table Movimento
add column idTipoMovimento int not null;

alter table Movimento
add foreign key (idTipoMovimento) references tipoMovimento(idTipoMovimento);

desc Movimento;

create database biblioteca;

use biblioteca;

create table livro (
	idLivro int primary key,
    titulo varchar(45) not null
);

create table autor (
	idAutor int primary key,
    nome varchar(45),
    sobrenome varchar(45)
);

create table aluno (
	idaluno int primary key,
    nome varchar(45) not null,
    data_nasc date
);

create table livro_autor (
	livro_idlivro int,
    autor_idautor int,
    foreign key(livro_idlivro) references livro(idlivro),
    foreign key(autor_idautor) references autor(idautor)
);

create table exemplar (
	idexemplar int primary key,
    disponivel bit not null,
    idlivro int,
    foreign key(idlivro) references livro(idlivro)
);

create table emprestimo (
	idemprestimo int primary key,
    data_emprestimo date not null,
    data_devolucao date not null,
    idaluno int,
    exemplar_idexemplar int,
    multa numeric(10,2),
    foreign key(idaluno) references aluno(idaluno),
    foreign key(exemplar_idexemplar) references exemplar(idexemplar)
);
