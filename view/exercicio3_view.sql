create database exercicio3;

use exercicio3;

create table funcionarios(
ID int primary key auto_increment,
nome varchar(255),
cargo varchar(255),
salario decimal(10.2)
);

insert into funcionarios(nome,cargo,salario)
values("Melissa","Empregada",21.00);

insert into funcionarios(nome,cargo,salario)
values("Mel","Doutora",2111.00);


create table vendas(
ID int primary key auto_increment,
ID_Funcionario int,
data_venda date,
valor_venda decimal(10.2)
);

insert into vendas(ID_Funcionario,data_venda,valor_venda)
values(1,"2022-10-02",2000);

insert into vendas(ID_Funcionario,data_venda,valor_venda)
values(2,"2023-08-11",1000);



create view relatorio_vendas_funcionario as
select F.nome as "Nome do Funcionário",
count(V.ID) as "Número de Vendas",
Sum(V.valor_venda) as "Valor Total das Vendas"
from funcionarios F 
left join vendas V
on F.ID = V.ID_Funcionario
group by F.nome;
