-- criando e conectando o usuário, criando database
CREATE USER 'vitor'@'localhost';
CREATE DATABASE uvv 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
USE uvv;
GRANT CREATE, INSERT, SELECT ON uvv.* to 'vitor'@'localhost';

-- criando a tabela funcionario
CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                cpf_supervisor CHAR(11),
                numero_departamento INT NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(100),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                PRIMARY KEY (cpf)
);

-- comentando as colunas
ALTER TABLE funcionario MODIFY COLUMN cpf CHAR(11) COMMENT 'CPF do funcionário. Será a PK da tabela.';

ALTER TABLE funcionario MODIFY COLUMN cpf_supervisor CHAR(11) COMMENT 'CPF do supervisor. Será uma FK para a própria tabela (um auto-relacionamento).';

ALTER TABLE funcionario MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN primeiro_nome VARCHAR(15) COMMENT 'Primeiro nome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN nome_meio CHAR(1) COMMENT 'Inicial do nome do meio.';

ALTER TABLE funcionario MODIFY COLUMN ultimo_nome VARCHAR(15) COMMENT 'Sobrenome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(100) COMMENT 'Endereço do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN salario DECIMAL(10, 2) COMMENT 'Salário do funcionário.';

-- criando a tabela departamento
CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
);
-- comentando as colunas
ALTER TABLE departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É a PK desta tabela.';

ALTER TABLE departamento MODIFY COLUMN nome_departamento VARCHAR(15) COMMENT 'Nome do departamento. Deve ser único.';

ALTER TABLE departamento MODIFY COLUMN cpf_gerente CHAR(11) COMMENT 'CPF do gerente do departamento. É uma FK para a tabela funcionários.';

ALTER TABLE departamento MODIFY COLUMN data_inicio_gerente DATE COMMENT 'Data do início do gerente no departamento.';


CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

-- criando a tabela projeto
CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                numero_departamento INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local VARCHAR(15),
                PRIMARY KEY (numero_projeto)
);
-- comentando as colunas
ALTER TABLE projeto MODIFY COLUMN numero_projeto INTEGER COMMENT 'Número do projeto. É a PK desta tabela.';

ALTER TABLE projeto MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É uma FK para a tabela departamento.';

ALTER TABLE projeto MODIFY COLUMN nome_projeto VARCHAR(15) COMMENT 'Nome do projeto. Deve ser único.';

ALTER TABLE projeto MODIFY COLUMN local VARCHAR(15) COMMENT 'Localização do projeto.';


CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

-- criando a tabela localizações de departamento
CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);
-- comentando as colunas
ALTER TABLE localizacoes_departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. Faz parta da PK desta tabela e também é uma FK para a tabela departamento.';

ALTER TABLE localizacoes_departamento MODIFY COLUMN local VARCHAR(15) COMMENT 'Localização do departamento. Faz parte da PK desta tabela.';

-- criando a tabela dos funcionarios que trabalham em tal projeto
CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL,
                horas DECIMAL(3,1),
                PRIMARY KEY (cpf_funcionario, numero_projeto)
);
-- comentando as colunas
ALTER TABLE trabalha_em MODIFY COLUMN cpf_funcionario CHAR(11) COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';

ALTER TABLE trabalha_em MODIFY COLUMN numero_projeto INTEGER COMMENT 'Número do projeto. Faz parte da PK desta tabela e é uma FK para a tabela projeto.';

ALTER TABLE trabalha_em MODIFY COLUMN horas DECIMAL(3, 1) COMMENT 'Horas trabalhadas pelo funcionário neste projeto.';

-- criando a tabela de dependentes
CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(8),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);
-- comentando as colunas
ALTER TABLE dependente MODIFY COLUMN cpf_funcionario CHAR(11) COMMENT 'CPF do funcionário. Faz parte da PK desta tabela e é uma FK para a tabela funcionário.';

ALTER TABLE dependente MODIFY COLUMN nome_dependente VARCHAR(15) COMMENT 'Nome do dependente. Faz parte da PK desta tabela.';

ALTER TABLE dependente MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do dependente.';

ALTER TABLE dependente MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do dependente.';

ALTER TABLE dependente MODIFY COLUMN parentesco VARCHAR(8) COMMENT 'Descrição do parentesco do dependente com o funcionário.';

-- criando as relações
ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- inserindo na tabela funcionario
INSERT INTO funcionario(primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES	('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', '55000', NULL, 1),
		('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa 34, São Paulo, SP', 'M', '40000', '88866555576', 5),
		('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', '30000', '33344555587', 5),
		('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', '43000', '88866555576', 4),
		('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', '25000', '98765432168', 4),
		('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', '25000', '98765432168', 4),
		('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', '38000', '33344555587', 5),
		('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', '25000', '33344555587', 5);

-- inserindo na tabela departamento
INSERT INTO departamento(nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES  ('Pesquisa', 5, '33344555587', '1988-05-22'),
		('Administração', 4, '98765432168', '1995-01-01'),
		('Matriz', 1, '88866555576', '1981-06-19');

-- inserindo na tabela localizacoes_departamento
INSERT INTO localizacoes_departamento(numero_departamento, local)
VALUES  (1, 'São Paulo'),
		(4, 'Mauá'),
		(5, 'Santo André'),
		(5, 'Itu'),
		(5, 'São Paulo');

-- inserindo na tabela projeto
INSERT INTO projeto(nome_projeto, numero_projeto, local, numero_departamento)
VALUES  ('ProdutoX', 1, 'Santo André', 5),
		('Produto Y', 2, 'Itu', 5),
		('ProdutoZ', 3, 'São Paulo', 5),
		('Informatização', 10, 'Mauá', 4),
		('Reorganização', 20, 'São Paulo', 1),
		('Novosbeneficios', 30, 'Mauá', 4);

-- inserindo na tabela dependente
INSERT INTO dependente(cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES  ('33344555587', 'Alicia', 'F', '05-04-1986', 'Filha'),
		('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
		('33344555587', 'Janaina', 'F', '1958-05-03', 'Esposa'),
		('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
		('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
		('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
		('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

-- inserindo na tabela trabalha_em
INSERT INTO trabalha_em(cpf_funcionario, numero_projeto, horas)
VALUES  ('12345678966', 1, 32.5), 
		('12345678966', 2, 7.5),
		('66688444476', 3, 40),
		('45345345376', 1, 20),
		('45345345376', 2, 20),
		('33344555587', 2, 10),
		('33344555587', 3, 10),
		('33344555587', 10, 10),
		('33344555587', 20, 10),
		('99988777767', 30, 30),
		('99988777767', 10, 10),
		('98798798733', 10, 35),
		('98798798733', 30, 5),
		('98765432168', 30, 20),
		('98765432168', 20, 15),
		('88866555576', 20, null);
