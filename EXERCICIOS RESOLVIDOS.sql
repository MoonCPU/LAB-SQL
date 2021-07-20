---------------------------------------------------------EXERCICIOS RESOLVIDOS----------------------------------------------------------------------

--T0518A- PROJ002- Elaborar 2 queries simples.
--1) selecionar veículos cuja cor é amarelo
SELECT id_veiculo, tipo_veiculo, fabricante, placa FROM VEICULOS WHERE cor = 'amarelo';

--2) selecionar cidades que comecem com "AL"
SELECT cidade FROM dbo.GIS_TB07S001_CIDADES WHERE cidade like 'al%';


--T0518B- PROJ002- Elaborar 2 queries de baixa complexidade.
--1) selecionar os nomes dos motoristas principais de suas respectivas viagens 
SELECT MOTORISTA.nome_motorista 
FROM MOTORISTA 
join DIARIO_DE_BORDO ON DIARIO_DE_BORDO.motorista_principal = MOTORISTA.id_motorista;

--2) selecionar os nomes dos motoristas secundários
SELECT MOTORISTA.nome_motorista 
FROM MOTORISTA 
JOIN DIARIO_DE_BORDO ON DIARIO_DE_BORDO.motorista_secundario = MOTORISTA.id_motorista;

--T0518C- PROJ002- Elaborar 2 queries de média complexidade.
--1) mostrar dados das viagens, motoristas, valor das refeições, cargas, trajetoria e quilometragem
SELECT DIARIO_DE_BORDO.id_viagem, motorista_principal, motorista_secundario, veiculo, refeicao_motorista_principal, refeicao_motorista_secundario, tipo_carga, ponto_partida, ponto_chegada, quilometragem
FROM DIARIO_DE_BORDO
INNER JOIN CARGA ON CARGA.id_viagem = DIARIO_DE_BORDO.id_viagem
INNER JOIN MOTORISTAS_REFEICAO on MOTORISTAS_REFEICAO.id_viagem = DIARIO_DE_BORDO.id_viagem
INNER JOIN TRAJETORIA ON TRAJETORIA.id_viagem = DIARIO_DE_BORDO.id_viagem

--2) selecionar motoristas principais, cidades onde eles vivem que comecem o "AL", ordenar por números de multas em decrescente e veículos que eles dirigem 
select diario.id_viagem, id_motorista, nome_motorista, idade_motorista, multas_motorista_principal, cod_pais, uf, cidade, id_veiculo, placa, tipo_veiculo, fabricante
from MOTORISTA 
inner join dbo.GIS_TB07S001_CIDADES as residencia on MOTORISTA.cidade_residencia = residencia.cidade
inner join DIARIO_DE_BORDO as diario on diario.motorista_principal = MOTORISTA.id_motorista
inner join VEICULOS on diario.veiculo = VEICULOS.id_veiculo
inner join MULTAS ON diario.id_viagem = MULTAS.id_viagem
where residencia.cidade like 'al%';

--T0525A- PROJ002- Elaborar uma política de backup para as tabelas deste projeto.

--RESP) os backups vão acontecer mensalmente em 2 discos rígidos, pois não há muitas ocasiões de novos veículos ou funcionários serem adquiridos pela empresa.

--T0525B- PROJ002- Elaborar  uma lista de autorizações  por tabela  para cada função/cargo

--RESP) Os comandos INSERT, DELETE e UPDATE das tabelas VEICULOS, MOTORISTAS E OFICINA são permitidos somente para o administrador do banco de dados do grupo GIS, enquanto os comandos INSERT, DELETE, UPDATE da tabela DIARIO_DE_BORDO é permitido somente para o registrador de viagens. O comando SELECT é permitido para todos.

--T0525C- PROJ002- Com base na lista de autorizações,  elaborar um script  com os comandos Grant e Revoke de concessão de autorizações.

GRANT SELECT, INSERT, DELETE, UPDATE ON VEICULOS TO ADMINISTRADOR;
GRANT SELECT, INSERT, DELETE, UPDATE ON MOTORISTAS TO ADMINISTRADOR;
GRANT SELECT, INSERT, DELETE, UPDATE ON OFICINA TO ADMINISTRADOR;
REVOKE INSERT, DELETE, UPDATE ON DIARIO_DE_BORDO TO ADMINISTRADOR;

GRANT SELECT, INSERT, DELETE, DELETE ON DIARIO_DE_BORDO TO REGISTRADOR;
REVOKE INSERT, DELETE, UPDATE ON VEICULOS TO REGISTRADOR;
REVOKE INSERT, DELETE, UPDATE ON MOTORISTAS TO REGISTRADOR;
REVOKE INSERT, DELETE, UPDATE ON OFICINA TO REGISTRADOR;

--T0601A- PROJ002- Elaborar ao menos uma stored procedure, sem passagem de parâmetros, que faça uso das tabelas.

--RESP) criar um procedimento para selecionar todos os valores da tabela MOTORISTAS	sem parâmetros
CREATE PROCEDURE Busca
AS 
SELECT * FROM MOTORISTA;

EXEC Busca;

--T0601B- PROJ002- Elaborar ao menos uma stored procedure, com passagem de parâmetros, que faça uso das tabelas.

--RESP) criar um procedimento para selecionar todos os valores da tabela VEICULOS de parâmetros: @cor = 'amarela' e @fabricante = 'Ford'.
CREATE PROCEDURE Filtro
@cor varchar(30), @fabricante varchar(30)
AS 
SELECT * FROM VEICULOS WHERE cor = @cor and fabricante = @fabricante;

EXEC Filtro @cor = 'amarelo', @fabricante = 'Ford';

-- T0601C- PROJ002- Para a tabela de MOTORISTAS, mostrar os cálculos de volumetria.

sp_spaceused 'MOTORISTA';

--T0608A- PROJ002- Gerar o script para a construção de ao menos  um índice secundário para uma tabela.

--1)criar indice para a coluna "id_viagem" da tabela DIARIO_DE_BORDO
CREATE INDEX indice_cidades ON dbo.GIS_TB07S001_CIDADES(cidade);

--2)criar indice para as colunas "id_motorista", "nome_motorista", "idade_motorista" da tabela MOTORISTA
CREATE INDEX indice_motorista ON MOTORISTA(id_motorista, nome_motorista, idade_motorista);

--T0608B- PROJ002- Gerar o script para a construção de ao menos  um índice alternado  para uma tabela.

--1)criar indice alternado para a coluna "id_viagem" da tabela DIARIO_DE_BORDO
CREATE UNIQUE INDEX unique_indice_viagem ON DIARIO_DE_BORDO(id_viagem);

--2)criar indice alternado para a coluna "id_veiculo" da tabela VEICULOS
CREATE UNIQUE INDEX unique_indice_motorista ON VEICULOS(id_veiculo);

-- T0608C- PROJ002- Gerar o script para a construção de ao menos uma view (visão).
CREATE VIEW [MOTORISTAS] AS 
SELECT nome_motorista, idade_motorista
FROM MOTORISTA
WHERE idade_motorista BETWEEN 20 AND 30;

SELECT * FROM [MOTORISTAS];

-- T0608D- PROJ002- Implementar a regra Cascade em pelo menos uma tabela

--RESP) Eu poderia adicionar o comando ON DELETE SET NULL (ON DELETE CASCADE) para a chave estrangeira "id_viagem" da tabela DIARIO_DE_BORDO, para deletar todos os dados das colunas que estão ligadas por "id_viagem" de tabelas relacionadas à tabela DIARIO_DE_BORDO.