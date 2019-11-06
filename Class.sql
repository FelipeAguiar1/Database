CREATE DATABASE ACME;

USE ACME;

CREATE TABLE Departamento (
  idDepartamento INT NOT NULL,
  Nome VARCHAR(20) NOT NULL,
  Local VARCHAR(20) NOT NULL,
  idFuncionario INT NULL,
  PRIMARY KEY (idDepartamento)
);

CREATE TABLE  Funcionario (
  idFuncionario INT NOT NULL,
  Nome VARCHAR(40) NOT NULL,
  Sobrenome VARCHAR(20) NOT NULL,
  DataNasc DATE NOT NULL,
  Cargo VARCHAR(20) NOT NULL,
  Salario DECIMAL(12,2) NOT NULL,
  idDepartamento INT NOT NULL,
  PRIMARY KEY (idFuncionario),
  FOREIGN KEY (idDepartamento) REFERENCES Departamento (idDepartamento)
);

CREATE TABLE Projeto (
  idProjeto INT NOT NULL,
  Descricao VARCHAR(40) NOT NULL,
  HorasPrev VARCHAR(45) NOT NULL,
  idFuncionario INT NOT NULL,
  PRIMARY KEY (idProjeto),
  FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario)
);

insert into Departamento (idDepartamento,Nome,Local,idFuncionario) values (101,'Administração','Matriz',1006);
insert into Departamento (idDepartamento,Nome,Local,idFuncionario) values (102,'Vendas','Filial',1001);
insert into Departamento (idDepartamento,Nome,Local,idFuncionario) values (103,'Recursos Humanos','Matriz',1008);
insert into Departamento (idDepartamento,Nome,Local,idFuncionario) values (104,'Diretoria','Matriz',1003);
insert into Departamento (idDepartamento,Nome,Local,idFuncionario) values (105,'CPD','Matriz',1009);

insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1001,'Alberto','Silva','1970-01-05','Supervisor',5000,102);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1002,'Silvia','Pires','1985-05-13','Vendedor',2500,102);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1003,'Mário','Oliveira','1970-11-20','Diretor',10000,104);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1004,'Roberto','Albuquerque','1981-03-05','Supervisor',5300,101);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1005,'Horácio','Almeida','1973-10-18','Gerente',8000,103);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1006,'Fabiana','Rossi','1980-08-07','Gerente',8000,101);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1007,'Maria','Silva','1979-03-07','Vendedor',2700,102);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1008,'Joana','Pereira','1965-04-17','Supervisor',8000,103);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1009,'Márcia','Sousa','1968-12-05','Gerente',8500,105);
insert into Funcionario (idFuncionario,Nome,Sobrenome,DataNasc,Cargo,Salario,idDepartamento) values (1010,'Antônio','Santos','1988-02-07','Programador',3500,105);

insert into Projeto (idProjeto,Descricao,HorasPrev,idFuncionario) values (1,'Ampliação do setor de vendas',100,1001);
insert into Projeto (idProjeto,Descricao,HorasPrev,idFuncionario) values (2,'Implantação do sistema de RH',80,1009);
insert into Projeto (idProjeto,Descricao,HorasPrev,idFuncionario) values (3,'Auditoria interna',120,1004);

select * from Departamento;
select * from Funcionario;
select * from Projeto;

/*1*/
select Nome, Sobrenome from Funcionario
	order by Sobrenome;
    
/*2*/
select * from Funcionario
	order by idDepartamento;
    
/*3*/
select Nome, Salario from Funcionario
	where Salario > 5000
    order by Nome;
    
/*4*/
select DataNasc, nome from Funcionario
	order by DataNasc desc;
    
/*5*/
select sum(Salario) as 'Total folha de pagamento' from Funcionario;

/*6*/
select f.Nome, d.Nome, f.Cargo from Funcionario as f, Departamento as d
	where f.idDepartamento = d.idDepartamento;

/*7*/
select f.Nome, d.Nome from Funcionario as f, Departamento as d
	where d.idDepartamento = f.idDepartamento;
    
/*8*/
select d.nome, 
(select sum(salario) from Funcionario as f where f.idDepartamento = d.idDepartamento) as 'Folha de pagamento'
from Departamento as d;

/*9*/
select d.Nome, f.nome from Funcionario as f, Departamento as d
	where f.idDepartamento = d.idDepartamento and
    Cargo = 'Supervisor';

/*10*/
select count(*) as 'Total func' from Funcionario;

/*11*/
select avg(salario) as 'media salarial' from Funcionario;

/*12*/
select d.nome, 
(select min(f.salario) from funcionario as f 
where f.idDepartamento = d.idDepartamento) as 'Menor salario'
	from Departamento as d;


