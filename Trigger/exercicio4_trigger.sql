create database exercicio4;

use exercicio4;

Create table Produtos(
ID int primary key auto_increment,
nome varchar(255),
quantidade_estoque int
);

insert into Produtos(nome,quantidade_estoque)
values("Perfume",2);

Create table Vendas(
ID int primary key auto_increment,
data_venda date
);

insert into Vendas(data_venda)
values("2021-06-10");

create table Itens_venda(
ID int primary key auto_increment,
ID_Venda int,
ID_Produto int,
Quantidade int,
foreign key (ID_venda) references Vendas(ID),
foreign key (ID_Produto) references Produtos(ID)
);

insert into atividade.Itens_venda(ID_Venda,ID_Produto,Quantidade)
values(1,1,3);

DELIMITER //

CREATE TRIGGER verificar_estoque
BEFORE INSERT ON Itens_venda
FOR EACH ROW
BEGIN
  IF (
        SELECT quantidade_estoque
        FROM produtos
        WHERE ID = NEW.id_produto
    ) < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Quantidade em estoque insuficiente para o produto.';
    END IF;
END;
//
DELIMITER ;
