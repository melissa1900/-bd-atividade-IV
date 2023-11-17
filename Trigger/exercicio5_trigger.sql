create database exercicio5;

use exercicio5;

Create table atividade.Aluno(
ID int primary key auto_increment, 
Nome varchar(255), 
Data_nascimento date, 
Serie int
);

insert into atividade.Aluno(Nome,Data_nascimento,Serie)
values("Melissa","2002-10-02",1);

Create table atividade.Matriculas(
ID int primary key auto_increment,
ID_Aluno int,
Data_matricula date,
Status varchar(255),
foreign key (ID_Aluno) references atividade.Aluno(ID)
);

insert into atividade.Matriculas(ID_Aluno,Data_matricula,Status)
values(1,"2023-10-02","Matricula");

DELIMITER //

Create trigger verificador_idade2
BEFORE INSERT ON Matriculas
FOR each row
begin
IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 1 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2017-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2019-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 2 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2016-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2018-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 3 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2015-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2017-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 4 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2014-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2016-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 5 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2013-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2015-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 6 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2012-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2014-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 7 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2011-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2013-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 8 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2010-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2012-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT Serie from Aluno where ID = new.ID_Aluno) = 9 and (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno) < "2009-01-01" OR (SELECT Data_nascimento from Aluno where ID = new.ID_Aluno)  > "2011-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END;


//
DELIMITER ;