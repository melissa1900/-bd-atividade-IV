create database exercicio5;

use exercicio5;

create table Clientes_2(
ID int primary key auto_increment, 
nome varchar(255), 
endereco varchar(255), 
cidade varchar(255)
);

insert into Clientes(nome,endereco,cidade)
values("Matheus","Rua 1","Salvador");

insert into Clientes(nome,endereco,cidade)
values("Macita","Rua 2","São Paulo");


create table Pagamento(
ID int primary key auto_increment,
ID_Cliente int,
data_pagamento date,
valor_pagamento float,
foreign key (ID_Cliente) references Clientes(ID)
);

insert into Pagamento(ID_Cliente,data_pagamento,valor_pagamento)
values(1,"2022-10-22",1000);

insert into Pagamento(ID_Cliente,data_pagamento,valor_pagamento)
values(2,"2022-08-10",3000);



create view relatorio_pagamentos_cidade as
select C.nome as "Nome do Cliente",
C.cidade as "Cidade do Cliente",
sum(P.valor_pagamento) as "Valor total de pagamentos"
from Clientes C
inner join Pagamento P
on C.ID = P.ID_Cliente
group by C.nome;