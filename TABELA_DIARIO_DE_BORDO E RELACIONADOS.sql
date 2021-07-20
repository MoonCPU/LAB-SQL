-------------------------------------------CRIAÇÃO E INSERÇÃO DA TABELA DIARIO DE BORDO E RELACIONADOS----------------------------------------------


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA DIARIO_DE_BORDO
CREATE TABLE DIARIO_DE_BORDO (
	id_viagem varchar(9) PRIMARY KEY,
	motorista_principal varchar(5) FOREIGN KEY REFERENCES MOTORISTA(id_motorista),
	motorista_secundario varchar(5) FOREIGN KEY REFERENCES MOTORISTA(id_motorista),
	veiculo varchar(10) FOREIGN KEY REFERENCES VEICULOS(id_veiculo)
);
insert into DIARIO_DE_BORDO values ('0001C', '0001A', '0002A', '101B');
insert into DIARIO_DE_BORDO values ('0002C', '0003A', '0004A', '102B');
insert into DIARIO_DE_BORDO values ('0003C', '0005A', '0006A', '103B');
insert into DIARIO_DE_BORDO values ('0004C', '0007A', '0008A', '104B');


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA CARGA 
--carga transportada na viagem
CREATE TABLE CARGA (
	id_viagem varchar(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	tipo_carga VARCHAR(50) NOT NULL,
	peso_carga_kg INT NOT NULL
);
insert into CARGA values ('0001C', 'Móveis', 250);
insert into CARGA values ('0002C', 'Frutas', 100);
insert into CARGA values ('0003C', 'Frutas', 150);
insert into CARGA values ('0004C', 'Cargas Frigoríficas', 300);


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA MOTORISTAS_REPOUSOS
--turnos de 4h por cada motorista
CREATE TABLE MOTORISTAS_REPOUSOS (
	id_viagem varchar(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	turno_motorista_principal int,
	turno_motorista_secundario int
);
insert into MOTORISTAS_REPOUSOS values ('0001C', 2, 1);
insert into MOTORISTAS_REPOUSOS values ('0002C', 1, 1);
insert into MOTORISTAS_REPOUSOS values ('0003C', 2, 2);
insert into MOTORISTAS_REPOUSOS values ('0004C', 3, 2);


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA MULTAS
--multas por motorista da viagem
CREATE TABLE MULTAS (
	id_viagem varchar(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	multas_motorista_principal int,
	multas_motorista_secundario int
);
insert into MULTAS values ('0001C', 0, 0);
insert into MULTAS values ('0002C', 0, 0);
insert into MULTAS values ('0003C', 0, 1);
insert into MULTAS values ('0004C', 1, 0);


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA TRAJETORIA
--trajetória da viagem, de ponto de partida e destino final
CREATE TABLE TRAJETORIA (
	id_viagem VARCHAR(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	ponto_partida char(45) FOREIGN KEY REFERENCES dbo.GIS_TB07S001_CIDADES(cidade),
	ponto_chegada char(45) FOREIGN KEY REFERENCES dbo.GIS_TB07S001_CIDADES(cidade),
	horas_total int,
	quilometragem DECIMAL(10,2)
);
insert into TRAJETORIA values ('0001C', 'Adamantina', 'Altair', 12, 150.67);
insert into TRAJETORIA values ('0002C', 'Aguaí', 'Álvares Florence', 8, 103.50);
insert into TRAJETORIA values ('0003C', 'Alvinlândia', 'Altair', 16, 212.00);
insert into TRAJETORIA values ('0004C', 'Adamantina', 'Adolfo', 20, 249.59);


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA MOTORISTAS_REFEICAO
--valor das refeições por motoristas 
CREATE TABLE MOTORISTAS_REFEICAO (
	id_viagem VARCHAR(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	refeicao_motorista_principal DECIMAL(5,2),
	refeicao_motorista_secundario DECIMAL(5,2)
);
insert into MOTORISTAS_REFEICAO values ('0001C', 20.00, 18.00);
insert into MOTORISTAS_REFEICAO values ('0002C', 12.00, 15.00);
insert into MOTORISTAS_REFEICAO values ('0003C', 25.99, 22.50);
insert into MOTORISTAS_REFEICAO values ('0004C', 18.99, 27.00);


--CRIAÇÃO E INSERÇÃO DE DADO DA TABELA MANUTENCAO
--registrar eventuais manutenções do veiculo 
CREATE TABLE MANUTENCAO (
	id_viagem VARCHAR(9) FOREIGN KEY REFERENCES DIARIO_DE_BORDO(id_viagem),
	id_oficina varchar(10) FOREIGN KEY REFERENCES OFICINA(id_oficina),
	id_veiculo varchar(10) FOREIGN KEY REFERENCES VEICULOS(id_veiculo),
	valor decimal(10,2)
);
insert into MANUTENCAO values ('0001C', 'OFICINA1', '101B', 150.00);
insert into MANUTENCAO values ('0002C', null, null, null);
insert into MANUTENCAO values ('0003C', null, null, null);
insert into MANUTENCAO values ('0004C', 'OFICINA2', '104B', 150.00);