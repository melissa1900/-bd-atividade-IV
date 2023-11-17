create database exercicio2;

use exercicio2;

create table Produtos(
ID int primary key auto_increment, 
nome varchar (255), 
preco_unitario decimal(10.2), 
categoria varchar(255)
);

insert into Produtos(nome,preco_unitario,categoria)
values("perfume",12.00,"Higiene");

insert into Produtos(nome,preco_unitario,categoria)
values("Sabão",200.00,"Higiene");

create table Estoque(
ID int auto_increment primary key,
ID_Produto int, 
quantidade int,
foreign key (ID_Produto) references atv.Produtos(ID)
);

insert into Estoque(ID_Produto,quantidade)
values(1,6);

insert into Estoque(ID_Produto,quantidade)
values(2,11);



create view estoque_critico as
select P.nome as "Nome",
E.quantidade as "Quantidade"
from atv.Produtos P
inner join atv.Estoque E
on P.ID = E.ID_Produto
where Quantidade < 10;

