-- Procedures
use LojaFotos;
GO

-- Endereco
CREATE OR ALTER PROC InsertEndereco @cod_endereco int, @logradouro varchar(50), @numero int, @complemento varchar(50), @bairro varchar(20), @cep char(8), @cidade varchar(30), @estado char(2), @pais char(2)
AS 
BEGIN
INSERT INTO Endereco (cod_endereco, logradouro, numero, complemento, bairro, cep, cidade, estado, pais) VALUES (
    @cod_endereco, 
    @logradouro, 
    @numero, 
    @complemento, 
    @bairro, 
    @cep, 
    @cidade, 
    @estado, 
    @pais
)
END;

EXEC.InsertEndereco '2', 'Av Brasil', 23, null, "Quitandinha", '14000000', 'Araraquara', 'SP', 'BR'

CREATE OR ALTER PROC SelectAllEndereco 
AS
BEGIN
    SELECT * FROM Endereco
END;

EXEC.SelectAllEndereco

-- Funcionario

CREATE OR ALTER PROC InsertFuncionario @codigo_Funcionario int, @departamento varchar(30), @nome varchar(50), @funcao varchar(10), @cod_endereco INT
AS
BEGIN
INSERT INTO Funcionario (codigo_Funcionario, departamento, nome, funcao, cod_endereco) VALUES(
    @codigo_Funcionario, 
    @departamento, 
    @nome, 
    @funcao, 
    @cod_endereco
)
END;

EXEC.InsertFuncionario 2, 'rh', 'Joana', 'departamento pessoal', 2

CREATE OR ALTER PROC SelectAllFuncionario
AS
BEGIN
    SELECT * FROM Funcionario
END;

EXEC.SelectAllFuncionario

-- Pessoa Fisica

CREATE OR ALTER PROC InsertPessoaFisica @codigo_PessoaFisica int, @cpf char(11), @rg varchar(10), @sexo char(1), @dtNasc DATE, @nome VARCHAR(50), @cod_endereco int
AS
BEGIN
INSERT INTO PessoaFisica (codigo_PessoaFisica, cpf, rg, sexo, dtNasc, nome, cod_endereco) VALUES (
    @codigo_PessoaFisica, 
    @cpf, 
    @rg, 
    @sexo, 
    @dtNasc, 
    @nome, 
    @cod_endereco
)
END;

EXEC.InsertPessoaFisica 2, '44444444444', null, F, '2006-04-15', 'João', 2

CREATE OR ALTER PROC SelectAllFuncionario
AS
BEGIN
    SELECT * FROM PessoaFisica
END;

EXEC.SelectAllFuncionario

-- Produtos


CREATE OR ALTER PROC InsertProduto @codigo_Produto int, @tipo varchar(20), @descricao varchar(50), @precoCusto decimal, @precoVenda decimal, @qtMin int, @qtEstoque int
AS
BEGIN
INSERT INTO Produto (codigo_Produto, tipo, descricao, precoCusto, precoVenda, qtMin, qtEstoque) VALUES (
    @codigo_Produto, 
    @tipo, 
    @descricao, 
    @precoCusto, 
    @precoVenda, 
    @qtMin, 
    @qtEstoque
)
END;

EXEC.InsertProduto 2, 'cozinha', 'copo vidro', 3.00, 10.00, 50, 200

CREATE OR ALTER PROC SelectAllProduto
AS
BEGIN
    SELECT * FROM Produto
END;

EXEC.SelectAllProduto

-- Telefone - Pessoa Fisica

CREATE OR ALTER PROC InsertTelefonePessoaFisica @codigo_PessoaFisica int, @numero varchar(11), @tipo varchar(10)
AS
BEGIN
INSERT INTO Telefone_PessoaFisica (codigo_PessoaFisica, numero, tipo) VALUES (
    @codigo_PessoaFisica, 
    @numero, 
    @tipo
)
END;

EXEC.InsertTelefonePessoaFisica 2, '33445566', 'trabalho'

CREATE OR ALTER PROC SelectAllTelPessoaFisica
AS
BEGIN
    SELECT * FROM Telefone_PessoaFisica
END;

EXEC.SelectAllTelPessoaFisica

-- Vendas

CREATE OR ALTER PROC InsertVenda @id_venda int, @dataVenda DATETIME, @formaPgto varchar(15), @valor_Venda decimal, @codigo_Funcionario int, @codigo_PessoaFisica int, @codigo_PessoaJuridica int
AS
BEGIN
INSERT INTO Venda (id_venda, dataVenda, formaPgto, valor_Venda, codigo_Funcionario, codigo_PessoaFisica, codigo_PessoaJuridica) VALUES (
   @id_venda, 
   @dataVenda, 
   @formaPgto, 
   @valor_Venda, 
   @codigo_Funcionario, 
   @codigo_PessoaFisica, 
   @codigo_PessoaJuridica 
)
END;

EXEC.InsertVenda 2, '2014-09-16', 'pix', 390.00, 1, 2, null