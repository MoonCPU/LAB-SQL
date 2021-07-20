-----------------------------------------------CRIAÇÃO E INSERÇÃO DA TABELA MOTORISTA E FICHA MEDICA------------------------------------

-- CRIAÇÃO E INSERÇÃO DA TABELA MOTORISTA
CREATE TABLE MOTORISTA (
	id_motorista VARCHAR(5) PRIMARY KEY,
	nome_motorista VARCHAR(50) NOT NULL,
	idade_motorista INT NOT NULL,
	cidade_residencia CHAR(45) FOREIGN KEY REFERENCES dbo.GIS_TB07S001_CIDADES(cidade)
);

insert into MOTORISTA values ('0001A', 'João da Silva', 32, 'Adamantina');
insert into MOTORISTA values ('0002A', 'Ricardo Matias', 40, 'Americana');
insert into MOTORISTA values ('0003A', 'João Ribeiros', 29, 'Aguaí');
insert into MOTORISTA values ('0004A', 'Ricardo Martins', 27, 'Aguaí');
insert into MOTORISTA values ('0005A', 'Maurício Solsa', 34, 'Alvinlândia');
insert into MOTORISTA values ('0006A', 'Lucas Rodrigues', 30, 'Agudos');
insert into MOTORISTA values ('0007A', 'Tiago Moraes', 27, 'Altinópolis');
insert into MOTORISTA values ('0008A', 'Mateus Júnior', 42, 'Alvinlândia');


--CRIAÇÃO E INSERÇÃO DA TABELA MOTORISTAS_FICHA_MEDICA 
CREATE TABLE MOTORISTAS_FICHA_MEDICA (
	id_ficha varchar(10) PRIMARY KEY,
	id_motorista varchar(5) FOREIGN KEY REFERENCES MOTORISTA(id_motorista),
	problemas_saude VARCHAR(50),
	medicamentos VARCHAR(50),
	peso_kg DECIMAL(4,1),
	altura DECIMAL(3,2)
);

insert into MOTORISTAS_FICHA_MEDICA values ('FICHA1', '0001A', 'Nenhuma anormalidade', 'Nenhum', 65.0, 1.75);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA2', '0002A', 'Hipertensão', 'Nenhum', 81.5, 1.73);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA3', '0003A', 'Nenhuma anormalidade', 'Nenhum', 60.0, 1.78);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA4', '0004A', 'Nenhuma anormalidade', 'Nenhum', 61.5, 1.80);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA5', '0005A', 'Diabetes ', 'Remédio para diabetes', 89.9, 1.69);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA6', '0006A', 'Nenhuma anormalidade', 'Nenhum', 72.7, 1.56);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA7', '0007A', 'Nenhuma anormalidade', 'Nenhum', 70.0, 1.91);
insert into MOTORISTAS_FICHA_MEDICA values ('FICHA8', '0008A', 'Dor crônica de costas', 'Gel massageador', 81.3, 1.68);