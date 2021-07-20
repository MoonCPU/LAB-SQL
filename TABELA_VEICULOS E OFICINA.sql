------------------------------------------------CRIAÇÃO E INSERÇÃO DA TABELA VEICULOS E OFICINA--------------------------------------------------------

--CRIAÇÃO E INSERÇÃO DA TABELA VEICULOS 
CREATE TABLE VEICULOS (
	id_veiculo VARCHAR(10) PRIMARY KEY,
	tipo_veiculo VARCHAR(30) NOT NULL,
	fabricante VARCHAR(30) NOT NULL,
	placa VARCHAR(9) UNIQUE,
	cor VARCHAR(30) NOT NULL,
	Ano_de_Fabricacao INT NOT NULL,
	idade_veiculo INT NOT NULL
);

insert into VEICULOS values ('101B', 'TOCO', 'BMW', '101201D', 'azul', 2016, 5);
insert into VEICULOS values ('102B', 'Cavalo Mecânico', 'Ford', '102202D', 'preto', 2012, 9);
insert into VEICULOS values ('103B', 'Bitrem', 'Volvo', '103203D', 'amarelo', 2019, 2);
insert into VEICULOS values ('104B', 'Rodotrem', 'Mercedes-Benz', '104204D', 'vermelho', 2018, 3);
insert into VEICULOS values ('105B', 'Guincho', 'Volkswagen', '105205D', 'vermelho', 2010, 11);
insert into VEICULOS values ('106B', 'Truck', 'Hyundai', '106206D', 'branco', 2020, 1);
insert into VEICULOS values ('107B', 'Guincho', 'Ford', '107207D', 'amarelo', 2017, 4);


--CRIAÇÃO E INSERÇÃO DA TABELA OFICINA
CREATE TABLE OFICINA (
	id_oficina VARCHAR(10) PRIMARY KEY,
	quantidade_funcionarios INT,
	cidade_oficina CHAR(45) FOREIGN KEY REFERENCES dbo.GIS_TB07S001_CIDADES(cidade)
);

--INSERT EM MASSA
insert into OFICINA values ('OFICINA1', 20, 'Adamantina'), ('OFICINA2', 30, 'Álvares Machado'), ('OFICINA3', 25, 'Americana');