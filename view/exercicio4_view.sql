create database exercicio4;

use exercicio4;

create table categorias(
ID int primary key auto_increment,
Nome varchar(255),
descricao text
);

insert into categorias(Nome,descricao)
values("Tenis","Azul");

insert into acategorias(Nome,descricao)
values("Vestidos","Amarelos");


create table produtos_2(
ID int primary key auto_increment, 
nome varchar (255), 
preco_unitario decimal(10.2), 
ID_Categoria int,
foreign key (ID_Categoria) references categorias(ID)
);

insert into produtos_2(nome,preco_unitario,ID_Categoria)
values("Nike",1200,2);

insert into produtos_2(nome,preco_unitario,ID_Categoria)
values("Adidas",112.00,1);



create view relatorio_produtos_categoria as
select C.nome as "Nome",
count(P.ID) as "Quantidade de Produtos"
from categorias C
left join produtos_2 P
on C.ID = P.ID_Categoria
group by C.nome;
