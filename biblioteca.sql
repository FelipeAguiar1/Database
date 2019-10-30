CREATE DATABASE db_Biblioteca;

USE db_Biblioteca;

CREATE TABLE IF NOT EXISTS tbl_livro (
ID_Livro SMALLINT  AUTO_INCREMENT PRIMARY KEY,
Nome_Livro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13),
ISBN10 CHAR(10),
ID_Categoria SMALLINT,
ID_Autor SMALLINT NOT NULL,
ID_Editora SMALLINT,
Data_Pub DATE NOT NULL,
Preco_Livro DECIMAL(6,2) NOT NULL
);

CREATE TABLE tbl_autores (
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(50) NOT NULL,
Sobrenome_Autor VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_categorias (
ID_Categoria SMALLINT PRIMARY KEY,
Categoria VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_editoras (
ID_Editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome_Editora VARCHAR(50) NOT NULL
);

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Prentice Hall');
INSERT INTO tbl_editoras (Nome_Editora) VALUES ('O´Reilly');
INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Microsoft Press');
INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Wiley');
INSERT INTO tbl_editoras (Nome_Editora) VALUES ('McGraw-Hill Education');

INSERT INTO tbl_autores
VALUES
(1, 'Daniel', 'Barret'),
(2, 'Gerald', 'Carter'),
(3, 'Mark', 'Sobell'),
(4, 'William', 'Stanek'),
(5, 'Richard', 'Blum'),
(6, 'Jostein', 'Gaarder'),
(7, 'Umberto', 'Eco'),
(8, 'Neil', 'De Grasse Tyson'),
(9, 'Stephen', 'Hawking'),
(10, 'Stephen', 'Jay Gould'),
(11, 'Charles', 'Darwin'),
(12, 'Alan', 'Turing'),
(13, 'Simon', 'Monk'),
(14, 'Paul', 'Scherz');

INSERT INTO tbl_categorias
VALUES
(1, 'Tecnologia'),
(2, 'História'),
(3, 'Literatura'),
(4, 'Astronomia'),
(5, 'Botânica');

INSERT INTO tbl_Livro (Nome_Livro, ISBN13, ISBN10, Data_Pub, Preco_Livro, ID_Categoria, ID_Autor, ID_Editora)
VALUES
('Linux Command Line and Shell Scripting','9781118983843', '111898384X', '20150109', 68.35, 1, 5, 4),
('SSH, the Secure Shell','9780596008956', '0596008953', '20050517', 58.30, 1, 1, 2),
('Using Samba','9780596002565', '0596002564', '20031221', 61.45, 1, 2, 2),
('Fedora and Red Hat Linux', '9780133477436', '0133477436', '20140110', 62.24, 1, 3, 1),
('Windows Server 2012 Inside Out','9780735666313', '0735666318', '20130125', 66.80, 1, 4, 3),
('Microsoft Exchange Server 2010','9780735640610', '0735640610', '20101201', 45.30, 1, 4, 3),
('Practical Electronics for Inventors', '9781259587542', '1259587541', '20160324', 67.80, 1, 13, 5);

select * from tbl_editoras;
select * from tbl_livro;
select * from tbl_categorias;
select * from tbl_autores;

select * from tbl_livro
	where Preco_livro is NOT NULL;

select Nome_Livro from tbl_livro
	order by Nome_Livro;

select * from tbl_livro
	where ID_Categoria = 1;
    
select * from tbl_livro
	where Nome_Livro like 'Linux%';
    
select * from tbl_livro
	where Preco_livro between 50 and 70;
    
select * from tbl_livro
	where Preco_livro >= 30 and Preco_livro <= 60;
    
select * from tbl_autores
	where Nome_Autor like 'St%';
    
select * from tbl_autores
	where Nome_autor like '%a%';
    
select * from tbl_autores
	order by Nome_autor, Sobrenome_Autor;
    
select * from tbl_autores
	order by Nome_autor desc, Sobrenome_Autor desc;
    
select tbl_Livro.ID_Livro, tbl_Livro.Nome_Livro, 
tbl_Categorias.ID_Categoria, tbl_Categorias.Categoria 
from tbl_Livro, tbl_Categorias
	where tbl_Livro.ID_Categoria = tbl_Categorias.ID_Categoria;
    
select tbl_Livro.ID_Livro, tbl_Livro.Nome_Livro, 
tbl_Categorias.ID_Categoria, tbl_Categorias.Categoria,
tbl_Editoras.Nome_Editora
from tbl_Livro, tbl_Categorias, tbl_Editoras
	where tbl_Livro.ID_Categoria = tbl_Categorias.ID_Categoria
    and tbl_Livro.ID_Editora = tbl_Editoras.ID_Editora;
