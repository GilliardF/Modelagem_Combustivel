
CREATE TABLE Produto (
                id_produto INT NOT NULL,
                tipo VARCHAR(15) NOT NULL,
                unidade_medida VARCHAR(15) NOT NULL,
                valor_compra VARCHAR(10) NOT NULL,
                coleta DATE NOT NULL,
                PRIMARY KEY (id_produto)
);

ALTER TABLE Produto COMMENT 'Tabela para armazenar dados referente a produtos.';

ALTER TABLE Produto MODIFY COLUMN id_produto INTEGER COMMENT 'Coluna refente ao identificador do produto do tipo inteiro.';

ALTER TABLE Produto MODIFY COLUMN tipo VARCHAR(15) COMMENT 'Coluna descreve o tipo/nome do produto.';

ALTER TABLE Produto MODIFY COLUMN unidade_medida VARCHAR(15) COMMENT 'Referente a unidade de medida do produto por venda.';

ALTER TABLE Produto MODIFY COLUMN coleta DATE COMMENT 'Coluna referente ao dia da coleta do(s) produto(s).';


CREATE TABLE Vendas (
                id_venda INT NOT NULL,
                produto_venda INT NOT NULL,
                valor_venda VARCHAR(10) NOT NULL,
                PRIMARY KEY (id_venda)
);

ALTER TABLE Vendas COMMENT 'Tabela referente aos dados de vendas armazenados.';

ALTER TABLE Vendas MODIFY COLUMN id_venda INTEGER COMMENT 'identificador da venda, podendo ser o numero da nota fiscal.';

ALTER TABLE Vendas MODIFY COLUMN produto_venda INTEGER COMMENT 'Coluna refente ao identificador do produto do tipo inteiro.';

ALTER TABLE Vendas MODIFY COLUMN valor_venda VARCHAR(10) COMMENT 'Coluna referente ao ao valor da venda do(s) produto(s).';


CREATE TABLE localidade (
                id_localidade INT NOT NULL,
                regiao VARCHAR(2) NOT NULL,
                estado VARCHAR(2) NOT NULL,
                municipio VARCHAR(20) NOT NULL,
                PRIMARY KEY (id_localidade)
);

ALTER TABLE localidade COMMENT 'Tabela referente a localidade da empresa.';

ALTER TABLE localidade MODIFY COLUMN id_localidade INTEGER COMMENT 'Campo referente a identificação da localidade da empresa.';

ALTER TABLE localidade MODIFY COLUMN regiao VARCHAR(2) COMMENT 'Campo referente a região onde a empresa se localiza.';

ALTER TABLE localidade MODIFY COLUMN estado VARCHAR(2) COMMENT 'Campo referente ao estado onde a empresa se localiza.';

ALTER TABLE localidade MODIFY COLUMN municipio VARCHAR(20) COMMENT 'Campo referente ao municipio onde a empresa se localiza.';


CREATE TABLE Empresa (
                id_empresa INT NOT NULL,
                localidade INT NOT NULL,
                razao_social VARCHAR(30) NOT NULL,
                venda INT NOT NULL,
                bandeira VARCHAR(12) NOT NULL,
                PRIMARY KEY (id_empresa)
);

ALTER TABLE Empresa MODIFY COLUMN id_empresa INTEGER COMMENT 'Identificador da empresa.';

ALTER TABLE Empresa MODIFY COLUMN localidade INTEGER COMMENT 'Campo referente a identificação da localidade da empresa.';

ALTER TABLE Empresa MODIFY COLUMN razao_social VARCHAR(30) COMMENT 'Campo para armazenar dados referente ao nome da empresa.';

ALTER TABLE Empresa MODIFY COLUMN venda INTEGER COMMENT 'Identificador da venda, podendo ser o numero da nota fiscal.';

ALTER TABLE Empresa MODIFY COLUMN bandeira VARCHAR(12) COMMENT 'Coluna referente a bandeira do posto de gasolina.';


ALTER TABLE Vendas ADD CONSTRAINT produto_vendas_fk
FOREIGN KEY (produto_venda)
REFERENCES Produto (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Empresa ADD CONSTRAINT vendas_empresa_fk
FOREIGN KEY (venda)
REFERENCES Vendas (id_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Empresa ADD CONSTRAINT localidade_empresa_fk
FOREIGN KEY (localidade)
REFERENCES localidade (id_localidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
