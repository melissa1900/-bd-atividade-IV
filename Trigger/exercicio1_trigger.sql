create database exercicio1;

Use  exercicio1;

create table Livros(
ID int auto_increment primary key,
titulo varchar(255), 
autor varchar(255), 
quantidade_estoque int
);

insert into Livros(titulo,autor,quantidade_estoque)
values("Titulo","Melissa",10);

create table Emprestimos(
ID int auto_increment primary key,
id_livro int, 
data_emprestimo date, 
data_devolucao date,
foreign key (id_livro) references Livros(ID)
);


insert into Emprestimos(id_livro,data_emprestimo,data_devolucao)
values(1,"2020-10-22","2023-11-20");


DELIMITER //
CREATE TRIGGER atualiza_estoque 
AFTER INSERT ON Emprestimos
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE ID = NEW.id_livro;
END;
//
DELIMITER ;





