create database exercicio2;

use exercicio2;

create table Contas(
ID int auto_increment primary key,
nome varchar(255),
saldo decimal(10.2)
);

insert into Contas(nome,saldo)
values("Matheus",1000);

insert into Contas(nome,saldo)
values("Marcio",700);

create table Transacoes(
ID int auto_increment primary key,
id_conta int, 
tipo varchar(255), 
valor decimal(10.2),
foreign key (id_conta) references Contas(ID)
);

insert into Transacoes(id_conta,tipo,valor)
values(1,"Entrada",1000);

insert into Transacoes(id_conta,tipo,valor)
values(2,"Saída",10.00);




DELIMITER //
CREATE TRIGGER atualizar_estoque_apos_emprestimo
AFTER INSERT ON Transacoes
FOR EACH ROW
BEGIN
    IF New.tipo="Entrada" THEN
    UPDATE Contas
    SET saldo = saldo + new.valor
    WHERE ID = NEW.id_conta;
    ELSE
    UPDATE Contas
    SET saldo = saldo - new.valor
    WHERE  ID = NEW.id_conta;
    END IF;
END;
//
DELIMITER ;