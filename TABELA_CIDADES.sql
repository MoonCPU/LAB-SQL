---------------------------CRIAÇÃO E INSERÇÃO DA TABELA dbo.GIS_TB07S001_CIDADES DO PROJETO 1-----------------------------------------

CREATE TABLE dbo.GIS_TB07S001_CIDADES (
  cod_pais     numeric (3, 0)  NOT NULL ,
  uf           char    (3)     NOT NULL ,
  cidade       char    (45)    PRIMARY KEY NOT NULL ,
  area_km2     numeric (8, 3)      NULL ,
  data_fund    char    (10)        NULL ,
  obs          varchar (72)        NULL
);

--EU DECIDI POPULAR A TABELA APENAS COM ALGUMAS CIDADES DE SÃO PAULO
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Adamantina', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Adolfo', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Aguaí', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Águas da Prata', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Águas de Lindóia', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Águas de Santa Bárbara', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Águas de São Pedro', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Agudos', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Alambari', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Alfredo Marcondes', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Altair', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Altinópolis', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Alto Alegre', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Alumínio', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Álvares Florence', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Álvares Machado', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Álvaro de Carvalho', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Alvinlândia', NULL, NULL, NULL);
Insert into dbo.GIS_TB07S001_CIDADES values
  (31, 'SP', 'Americana', NULL, NULL, NULL);
