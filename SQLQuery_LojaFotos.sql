-- criacao banco
CREATE DATABASE LojaFotos;

--criacao das tabelas
CREATE TABLE Endereco(
    cod_endereco int not null,
    logradouro VARCHAR(50) NOT NULL,
    numero INT,
    complemento VARCHAR(50),
    bairro VARCHAR(20) NOT NULL,
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    pais char(2) NOT NULL,

    CONSTRAINT PK_Endereco PRIMARY KEY (cod_endereco)
);

CREATE TABLE PessoaFisica(
    codigo_PessoaFisica INT NOT NULL,
    cpf CHAR(11) NOT NULL,
    rg VARCHAR(10), 
    sexo CHAR(1),
    dtNasc DATE,
    nome VARCHAR(50) NOT NULL,
    cod_endereco int,

    CONSTRAINT PK_PessoaFisica PRIMARY KEY (codigo_PessoaFisica),
    CONSTRAINT UN_PessoaFIsica_CPF UNIQUE (cpf),
    CONSTRAINT FK_Funcionario_Endereco FOREIGN KEY (cod_endereco) REFERENCES Endereco (cod_endereco)
);

CREATE TABLE Telefone_PessoaFisica(
    codigo_PessoaFisica int NOT NULL,
    numero VARCHAR(11) NOT NULL,
    tipo VARCHAR(10) NOT NULL,

    CONSTRAINT PK_TelefonePessoaFisica PRIMARY KEY (codigo_PessoaFisica, numero),
    CONSTRAINT FK_TelefonePessoaFisica_PessoaFisica FOREIGN KEY (codigo_PessoaFisica) references PessoaFisica (codigo_PessoaFisica)
);

CREATE TABLE PessoaJuridica(
    codigo_PessoaJuridica INT NOT NULL,
    cnpj CHAR(14) NOT NULL,
    inscricaoEstadual CHAR(9), 
    nomeResponsavel VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    cod_endereco int,

    CONSTRAINT PK_PessoaJuridica PRIMARY KEY (codigo_PessoaJuridica),
    CONSTRAINT UN_PessoaJuridica_cnpj UNIQUE (cnpj)
);

CREATE TABLE Telefone_PessoaJuridica(
    codigo_PessoaJuridica INT NOT NULL,
    numero VARCHAR(11) NOT NULL,
    tipo VARCHAR(10) NOT NULL,

    CONSTRAINT PK_TelefonePessoaJuridica PRIMARY KEY (codigo_PessoaJuridica, numero),
    CONSTRAINT FK_TelefonePessoaJuridica_PessoaJuridica FOREIGN KEY (codigo_PessoaJuridica) references PessoaJuridica (codigo_PessoaJuridica)
);

CREATE TABLE Funcionario(
    codigo_Funcionario INT NOT NULL,
    departamento VARCHAR(30),
    nome VARCHAR(50) NOT NULL,
    funcao VARCHAR(10) NOT NULL,
    cod_endereco int,

    CONSTRAINT PK_Funcionario PRIMARY KEY (codigo_Funcionario),
    CONSTRAINT FK_Funcionarios_Endereco FOREIGN KEY (cod_endereco) REFERENCES Endereco (cod_endereco)
);

CREATE TABLE Telefone_Funcionario(
    codigo_Funcionario INT NOT NULL,
    numero VARCHAR(11) NOT NULL,
    tipo VARCHAR(10) NOT NULL,

    CONSTRAINT PK_TelefoneFuncionario PRIMARY KEY (codigo_Funcionario, numero),
    CONSTRAINT FK_codigo_Funcionario FOREIGN KEY (codigo_Funcionario) REFERENCES Funcionario (codigo_Funcionario)
);

CREATE TABLE Produto(
    codigo_Produto INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    precoCusto DECIMAL (12,2) NOT NULL,
    precoVenda DECIMAL (12,2) NOT NULL,
    qtMin INT NOT NULL,
    qtEstoque INT NOT NULL,

    CONSTRAINT PK_Produto PRIMARY KEY (codigo_Produto)
);

CREATE TABLE Venda(
    id_venda INT NOT NULL,
    dataVenda DATETIME NOT NULL,
    formaPgto VARCHAR(15) NOT NULL,
    valor_Venda DECIMAL (12,2),
    codigo_Funcionario int NOT null,
    codigo_PessoaFisica int,
    codigo_PessoaJuridica int,

    CONSTRAINT PK_Venda PRIMARY KEY (id_venda),
    CONSTRAINT FK_Venda_Funcionario FOREIGN KEY (codigo_Funcionario) references Funcionario (codigo_Funcionario),
    CONSTRAINT FK_Venda_PessoaFisica FOREIGN KEY (codigo_PessoaFisica) references PessoaFisica (codigo_PessoaFisica),
    constraint FK_Venda_PessoaJuridica FOREIGN KEY (codigo_PessoaJuridica) references PessoaJuridica (codigo_PessoaJuridica)
);

CREATE TABLE Item_Venda(
    id_itens int not NULL,
    id_venda INT NOT NULL,
    codigo_Produto int not NULL,
    quantidade int not null,
    preco_venda decimal (12,2) not null,
    valor_total_item decimal (12,2),

    CONSTRAINT Pk_ItemVenda PRIMARY KEY (id_itens),
    CONSTRAINT FK_ItemVenda_Venda FOREIGN KEY (id_venda) REFERENCES Venda (id_venda),
    CONSTRAINT FK_ItemVenda_Produto FOREIGN KEY (codigo_Produto) references Produto (codigo_Produto)
);

-- inserir e recuperar dados para teste

-- Endereco
INSERT INTO Endereco (cod_endereco, logradouro, numero, complemento, bairro, cep, cidade, estado, pais) values(
    1,
    'Av Feijo',
    null,
    123,
    'Centro',
    '14000000',
    'Araraquara',
    'SP',
    'BR'
);

SELECT * FROM Endereco;

-- Funcionario
INSERT INTO Funcionario (codigo_Funcionario, departamento, nome, funcao, cod_endereco) values(
    1,
    'vendas',
    'Duait',
    'vendedor',
    1
);

SELECT * FROM Funcionario;

--Pessoa Fisica

INSERT INTO PessoaFisica (codigo_PessoaFisica, cpf, rg, sexo, dtNasc, nome, cod_endereco) values (
    1,
    '33333333333',
    null,
    null,
    '2001-03-21',
    'Maria',
    1
);

SELECT * FROM PessoaFisica;

-- Produto

INSERT INTO Produto (codigo_Produto, tipo, descricao, precoCusto, precoVenda, qtMin, qtEstoque) VALUES (
    1,
    'casa e lazer',
    'almofada',
    20.00,
    50.00,
    5,
    100
);

SELECT * FROM Produto;

-- Telefone Pessoa Fisica
INSERT INTO Telefone_PessoaFisica (codigo_PessoaFisica, numero, tipo) VALUES (
    1,
    '33442323',
    'celular'
);

SELECT * FROM Telefone_PessoaFisica;

-- Venda

INSERT INTO Venda (id_venda, dataVenda, formaPgto, valor_Venda, codigo_Funcionario, codigo_PessoaFisica, codigo_PessoaJuridica) VALUES (
    1,
    '2001-06-12',
    'debito',
    500.00,
    1,
    1,
    null
);

SELECT * FROM Venda;