-- DIGITAL HOUSE - BANCO DE DADOS
-- ALUNA: THAYS GAMA
-- PROFESSORES: YANNA MENDES E FELLIPE SILVA
-- CHECKPOINT 2 - TURMA:3 - JULHO 2021

DROP DATABASE IF EXISTS ecommerce_thays;

-- ///////////////// --
-- CRIAÇÃO DA SCHEMA --
-- ///////////////// --
CREATE DATABASE ecommerce_thays;



-- /////////////////////////////////// --
-- DEFINIÇÃO DO SCHEMA A SER UTILIZADO --
-- /////////////////////////////////// --
USE ecommerce_thays;


-- ////////////////// --
-- CRIAÇÃO DE TABELAS --
-- ////////////////// --
CREATE TABLE categorias (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50),
    descricao TEXT,
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE descontos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50),
    situacao TINYINT(1),
    porcentagem DECIMAL(2,2),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE produtos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50),
    descricao TEXT,
    preco DECIMAL(6,2),
    marca VARCHAR(50),
    estoque SMALLINT,
    avaliacao DECIMAL(2,1),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    id_categoria INT,
    id_desconto INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id),
    FOREIGN KEY (id_desconto) REFERENCES descontos(id)
);

CREATE TABLE clientes (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50),
    sobrenome VARCHAR(150),
    email VARCHAR(150),
    senha VARCHAR(20),
    data_nascimento DATE,
    cpf CHAR(11),
    telefone VARCHAR(15),
	criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW()
);

CREATE TABLE enderecos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	logradouro VARCHAR(50),
    numero SMALLINT,
    complemento VARCHAR(50),
    cep CHAR(8),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    uf CHAR(2)
);

CREATE TABLE enderecos_clientes (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
	id_cliente INT,
    id_endereco INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_endereco) REFERENCES enderecos(id)
);

CREATE TABLE cartoes (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR(20),
    numero CHAR(16),
    validade DATE,
    codigo_seguranca CHAR(3),
    id_cliente INT,
    id_endereco_cobranca INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_endereco_cobranca) REFERENCES enderecos_clientes(id)
);

CREATE TABLE compras (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco_frete DECIMAL(6,2),
    preco_total DECIMAL(6,2),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_cliente INT,
    id_endereco_entrega INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_endereco_entrega) REFERENCES enderecos_clientes(id)
);

CREATE TABLE pagamentos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(6,2),
    situacao VARCHAR(50),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_cartao INT,
    id_compra INT,
    FOREIGN KEY (id_cartao) REFERENCES cartoes(id),
    FOREIGN KEY (id_compra) REFERENCES compras(id)
);

CREATE TABLE produtos_compra (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantidade SMALLINT,
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_compra INT,
    id_produto INT,
    FOREIGN KEY (id_compra) REFERENCES compras(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE entregas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	transportadora VARCHAR(50),
    codigo_rastreamento VARCHAR(50),
    data_envio DATE,
    data_prevista DATE,
	situacao VARCHAR(50),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_compra INT,
    FOREIGN KEY (id_compra) REFERENCES compras(id)
);

CREATE TABLE sessao_carrinhos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco_total DECIMAL(6,2),
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE produtos_carrinho (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantidade SMALLINT,
    criado_em TIMESTAMP NOT NULL,
    modificado_em TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	id_sessao_carrinho INT,
    id_produto INT,
    FOREIGN KEY (id_sessao_carrinho) REFERENCES sessao_carrinhos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);



-- ///////////////////////////// --
-- INSERÇÃO DE DADOS NAS TABELAS --
-- ///////////////////////////// --
INSERT INTO clientes (nome, sobrenome, email, senha, data_nascimento, cpf, telefone, criado_em)
VALUES
("Rachel","Green", "rachel@friends.com","123456", "1968-05-05", "02361829466", "85885466382", NOW()),
("Ross","Geller", "ross@friends.com","654321", "1967-10-18", "02361829460", "84885466382", NOW()),
("Monica","Geller", "monica@friends.com","162534", "1969-04-22", "02361829461", "83885466382", NOW()),
("Chandler","Bing", "chandler@friends.com","435261", "1968-04-08", "02361829462", "81885466382", NOW()),
("Phoebe","Buffay", "phoebe@friends.com","214365", "1967-02-16", "02361829469", "82885466382", NOW()),
("Joey","Tribbiani", "joey@friends.com","653412", "1968-01-01", "02361829465", "89885466382", NOW());

INSERT INTO enderecos (logradouro, numero, complemento, cep, bairro, cidade, uf)
VALUES
("Bedford Street", "90", "ap 20", "10014", "Greenwich Village", "New York", "NY" ),
("Bedford Street", "90", "ap 19", "10014", "Greenwich Village", "New York", "NY" );

INSERT INTO enderecos_clientes (nome, id_cliente, id_endereco)
VALUES
("Home", 1,1),
("Home", 3,1),
("Home", 4,2),
("Home", 6,2);

INSERT INTO cartoes (tipo, numero, validade, codigo_seguranca, id_cliente, id_endereco_cobranca)
VALUES
("debito", "1569845487264581", "2022-05-00", "253", 1, 1),
("credito", "1569845487896581", "2028-05-00", "253", 3, 2),
("credito", "1569623487264581", "2022-05-00", "253", 4, 3),
("credito", "1569845487264586", "2022-09-00", "283", 6, 4);

INSERT INTO categorias (nome, descricao, criado_em)
VALUES
("Percussão", "Pandeiro, pandeirola, tamborim", NOW()),
("Cordas", "Violão, guitarra, ukelele etc", NOW()),
("Teclas", "Teclado, piano etc", NOW());

INSERT INTO descontos (nome, situacao, porcentagem, criado_em)
VALUES
("Dia das mães", 0, 0.10, NOW()),
("Dia do consumidor", 1, 0.15, NOW());

INSERT INTO produtos (nome, descricao, preco, marca, estoque, 
avaliacao, criado_em, id_categoria, id_desconto)
VALUES
("Padeiro TP300", "Pele couro, 10 polegadas", 110.00, "Torelli", 50, 4.5, NOW(), 1, 1),
("Padeirola Meia Lua PML001", "Material: Policarbonato, Cor: Rosa", 40.00, "Liverpool", 20, 3.5, NOW(), 1, 1),
("Tamborim 207LT", "Alumínio 6 c/ Pele Estudo Muda e Baqueta 207LT", 70.00, "Contemporanea", 65, 4.6, NOW(), 1, 1),
("Violao Acustico N14NT", "Violão Estudo Start Nylon Natural", 362.95,"Giannini", 42, 4.8, NOW(), 2, 2),
("Guitarra Stratocaster G100 BK/WH", "Cor: Preta, Acabamento: Verniz Brilhante", 705.00,"Giannini", 10, 4.9, NOW(), 2, 1),
("Ukelele KAL220", "Ukelele Tenor 26 Tribes Natural Sapele", 485.00,"Kalani", 25, 4.3, NOW(), 2, 1),
("Teclado PSR-F51", "120 sons e 114 ritmos", 969.00,"Yamaha", 66, 4.7, NOW(), 3, 2),
("Piano Digital ARIUS YDP-144", "88 teclas", 7289.91,"Yamaha", 10, 5, NOW(), 3, 2);

INSERT INTO sessao_carrinhos (preco_total, criado_em, id_cliente)
VALUES
(1080.00, NOW(), 1),
(998.96, NOW(), 2),
(775.00, NOW(), 3);

INSERT INTO produtos_carrinho (quantidade, criado_em, id_sessao_carrinho, id_produto)
VALUES
(1, NOW(), 1, 1),
(2, NOW(), 1, 6),
(1, NOW(), 2, 4),
(1, NOW(), 2, 7),
(1, NOW(), 3, 3),
(1, NOW(), 3, 5);

INSERT INTO compras (preco_frete, preco_total, criado_em, 
id_cliente, id_endereco_entrega)
VALUES
(0,250.00, NOW(), 1, 1),
(20,997.21, NOW(), 3, 2),
(0,5467.43, NOW(), 4, 3),
(15,1468.50, NOW(), 6, 4),
(25,550.00, NOW(), 1, 1),
(40,352.21, NOW(), 3, 2);

INSERT INTO pagamentos (valor, situacao, criado_em, id_cartao, id_compra)
VALUES
(250.00,"pendente", NOW(), 1, 1),
(997.21,"aprovado" , NOW(), 2, 2),
(5467.43,"aprovado", NOW(), 3, 3),
(1468.50,"aprovado", NOW(), 4, 4),
(550.00,"aprovado", NOW(), 1, 5),
(352.21,"pendente", NOW(), 2, 6);

INSERT INTO produtos_compra (quantidade, criado_em, id_compra, id_produto)
VALUES
(1, NOW(), 1, 1),
(2, NOW(), 1, 3),
(1, NOW(), 2, 4),
(1, NOW(), 2, 5),
(1, NOW(), 3, 8),
(2, NOW(), 4, 7),
(1, NOW(), 5, 2),
(1, NOW(), 5, 6),
(1, NOW(), 6, 1),
(1, NOW(), 6, 4);

INSERT INTO entregas (transportadora, codigo_rastreamento, data_envio, 
data_prevista, situacao, criado_em, id_compra)
VALUES
("SEDEX","EX00AKDN", NULL , NULL,"pendente", NOW(), 1),
("CORREIO","YZ00AVDR","2021-07-02","2021-07-18","em transito" , NOW(), 2),
("CORREIO","AB00AGWN","2021-06-25","2021-07-05","entregue", NOW(), 3),
("CORREIO","RT00AKMI","2021-07-02","2021-07-20","em transito", NOW(), 4),
("SEDEX","GB00AWZN",NULL , NULL,"pendente", NOW(), 5),
("SEDEX","ED00EFJP","2021-06-25","2021-07-05","entregue", NOW(), 6);



-- /////////////////////////////// --
-- ATUALIZAÇÃO DE DADOS DE TABELAS --
-- /////////////////////////////// --
UPDATE clientes SET senha="s3nh4" WHERE id=1;
UPDATE entregas SET data_envio = "2021-07-06", data_prevista = "2021-07-30", situacao = "em transito"
WHERE situacao = "pendente";



-- //////////////////////////// --
-- EXCLUSÃO DE DADOS DAS TABELAS --
-- //////////////////////////// --
DELETE FROM clientes WHERE id = 5;



-- /////////////////////////// --
-- SELEÇÃO DE DADOS DE TABELAS --
-- /////////////////////////// --
-- SELECT * FROM cartoes; 
-- SELECT * FROM categorias; 
SELECT * FROM clientes; 
-- SELECT * FROM compras;
-- SELECT * FROM descontos; 
-- SELECT * FROM enderecos; 
-- SELECT * FROM enderecos_clientes;
-- SELECT * FROM entregas;
-- SELECT * FROM pagamentos;
-- SELECT * FROM produtos;
-- SELECT * FROM produtos_carinho;
-- SELECT * FROM produtos_compra; 
-- SELECT * FROM sessao_carrinhos; 