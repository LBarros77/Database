create database if not exists Logistica;
use Logistica;

create table Clientes (
	IdCliente int(11) primary key, # int(11) is deprecated and will be removed in a future release
    NomeCliente varchar(40) not null,
    Endereco varchar(40) not null,
    Cidade varchar(30) default "São Paulo",
    Estado varchar(30) default "São Paulo",
    Obs text
);
alter table Clientes modify IdCliente int;

insert into Clientes values
	(0001, "José Reicen", "Rua das Mães, 234", "Osasco", "São Paulo", default),
    (0010, "Keila Martins", "AV. Constantim, 432", "Belém", "Pará", default),
    (0011, "Carme Luciola de Souza", "Jardim America, Rua Palmitos, 31", "Brasil", "Brasilia", default),
    (0100, "Divaldo Almeida", "Cantares, AV. Floriano, 902", "Belo Horizonte", "Minas Gerais", default),
    (0101, "Pedro Well", "Jardim das Oliveiras, 09, 762", default, default, default),
    (0110, "Di Maria Clementino", "AV. JP Alves, 402", "Guaruja", default, default);

create table Transportadoras (
	IdTransportadora int primary key,
    NomeTransportadora varchar(30) not null,
    Edereco varchar(40) not null,
    Cidade varchar(30) default "São Paulo",
    Atividade varchar(40) default "Transporte de cargas"
);

insert into Transportadoras values
	(2010, "TransAmeric", "Lapa, Rua Montinho, 39", "Rio de Janeiro", "Cargas pesadas"),
    (3287, "Levo Já", "Jardim Patricia, Rua Cornete, 221", "Uberlândia", "Cargas médias"),
    (4021, "Trans Norte", "Nobrezim, AV. Camarões, 49", "Abaré", "Carga peso pena"),
    (7811, "TRANSCAR", "Centro, Av. jão silva, 732", "Vista Alegre", default),
    (2399, "TRANSCAR", "Vila M, Rua Jane, 2015", "Belo Horizonte", default),
    (9120, "TRPMG", "Carapicuiba, Rua São Beneditot, 1004", default, "Cargas médias");

create table Produtos (
	IdProduto int primary key auto_increment,
    NomeProduto varchar(40) not null,
    Descricao text,
    Preco float(8,2),# Is deprecated and will be removed in a future release
    Quantidade int unsigned
);
alter table Produtos modify Preco float not null;

insert into Produtos values
	(default, "Esmerilhadeira Bosch", "Verde, 220w", 400.00, 3),
	(default, "Furadeira Dewalt", "Amarela, martelete", 499.99, 2),
	(default, "Serra circular Dewalt", "Amarela, diamtro de disco 5/8'", 549.90, 1),
	(default, "Retifica Bosch", "Verde", 320.50, 2),
    (default, "Serra linear Bosch", "Verde, modo turbo", 280.78, 1),
    (2311, "SPMW34", null, 200, 6);

create table Pedidos (
	IdPedido int primary key auto_increment,
    IdCliente int not null,
    IdTransportadora int not null,
    Data date not null,
    Obs text,
    foreign key (IdCliente) references Clientes(IdCliente),
    foreign key (IdTransportadora) references Transportadoras(IdTransportadora)
);

insert into Pedidos values
	(9022, 110, 9120, "2020-03-12", null),
    (7382, 100, 7811, "2021-04-02", null),
    (9923, 101, 4021, "2020-04-03", null),
	(3255, 011, 3287, "2021-09-14", null),
    (3256, 010, 3287, "2021-09-14", null);

create table OrdemPedido (
	IdOrdemPedido int primary key auto_increment,
    IdProduto int not null,
    IdPedido int not null,
    Quantidade int unsigned,
    constraint ID_Produto foreign key (IdProduto) references Produtos(IdProduto),
    constraint ID_Pedido foreign key (IdPedido) references Pedidos(IdPedido),
    constraint check_quantidade check (Quantidade > 0)
);

insert into OrdemPedido values
	(2781, 4, 3255, 8),
    (3222, 2, 7382, 10),
    (8743, 1, 9022, 5),
    (1983, 3, 9923, 14),
    (8015, 2311, 3256, 4);

# Question 1
select distinct NomeCliente from Clientes Cli inner join Pedidos Ped on Cli.IdCliente = Ped.IdCliente;

# Question 2
select distinct NomeCliente from Clientes where IdCliente in (select IdCliente from Pedidos);

# Question 3
select distinct transp.NomeTransportadora as "Transportadoras"
from Transportadoras transp inner join Pedidos on transp.IdTransportadora = Pedidos.IdTransportadora;

# Question 4
select max(Quantidade) from OrdemPedido;

# Question 5
select min(Quantidade) from OrdemPedido;

# Question 6
select sum(Quantidade) from OrdemPedido;

# Question 7
select min(Quantidade) from Produtos;

# Question 8
select avg(Quantidade) from OrdemPedido;

# Question 9
select NomeProduto from Clientes inner join Produtos on Clientes.Estado = "São Paulo";

# Question 10
select trp.NomeTransportadora from Transportadoras trp inner join Clientes
on Clientes.Cidade = "Campinas" inner join Pedidos
on Clientes.IdCliente = Pedidos.IdCliente and trp.IdTransportadora = Pedidos.IdTransportadora;

# Question 11
select count(IdPedido) from Pedidos inner join Clientes on Clientes.Cidade = "São Paulo";

# Question 12
select NomeProduto as "Produto", (Preco * 1.15) as "Valor com acressimo de 15%" from Produtos;

# Question 13
select P.NomeProduto, T.NomeTransportadora
from Produtos P inner join Transportadoras T inner join Pedidos
on T.IdTransportadora = Pedidos.IdTransportadora inner join Clientes 
on Clientes.Cidade = "São Paulo" and Clientes.IdCliente = Pedidos.IdCliente;

# Question 14
select Produtos.NomeProduto from Produtos inner join Pedidos
on Pedidos.IdTransportadora inner join Transportadoras T
on T.NomeTransportadora = "TRANSCAR" and T.IdTransportadora;

# Question 15
select NomeCliente from Clientes inner join Pedidos
on Pedidos.IdCliente = Clientes.IdCliente inner join Produtos
on Produtos.NomeProduto = "SPMW34" and Produtos.IdProduto = 2311;