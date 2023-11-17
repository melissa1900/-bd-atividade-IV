create database exercicio1;

Use  exercicio1;


create table Clientes(
ID int primary key auto_increment, 
nome varchar(255), 
email varchar(255), 
telefone varchar(255)
);

insert into Clientes(nome,email,telefone)
values("Mel","melissa@gmail.com","(11) 11111-1111");

create table Pedidos(
ID int primary key auto_increment, 
ID_cliente int, 
data_pedido date,
valor_total float,
foreign key (ID_cliente) references Clientes(ID)
);

insert into Pedidos(ID_cliente,data_pedido,valor_total)
values(1,"2022-12-12",122);



create view relatorio_pedidos_cliente as
select C.nome as "Nome",
count(P.ID) as "Quantidade de Pedidos",
P.valor_total as "Valor total"
From  Clientes C
inner join  Pedidos P on C.ID = P.ID_Cliente;



