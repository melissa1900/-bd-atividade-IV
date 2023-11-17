create database exercicio3;

use exercicio3;

Create table Funcionarios(
ID int primary key auto_increment,
nome varchar(255),
data_admissao date
);

insert into Funcionarios(nome,data_admissao)
values("Melissa","2018-02-04");

insert into Funcionarios(nome,data_admissao)
values("Aline","2021-02-04");



DELIMITER //
CREATE TRIGGER verificar_data
BEFORE INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    IF New.data_admissao >"2023-11-14" THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROOO,A DATA DE ADMISSÃO TEM QUE SER MAIOR QUE A DATA ATUAL';
    END IF;
END;
//
DELIMITER ;