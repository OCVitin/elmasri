/* Conectando ao usuário */
ALTER ROLE vitor;
\connect uvv vitor
SET SEARCH_PATH TO elmasri, vitor, public;

/* Questão 1 */
SELECT departamento.nome_departamento, CAST (AVG (funcionario.salario) AS decimal (10,2)) AS media_salarial
FROM funcionario, departamento
WHERE (departamento.numero_departamento = funcionario.numero_departamento)
GROUP BY departamento.nome_departamento;

/* Questão 2 */
SELECT sexo, CAST (AVG (salario) AS decimal (10,2)) AS media_salarial
FROM funcionario
WHERE (sexo = sexo)
GROUP BY sexo;

/* Questão 3 */
SELECT d.nome_departamento, (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, f.data_nascimento, extract(year from age(f.data_nascimento)) AS idade, f.salario
FROM departamento AS d
INNER JOIN funcionario AS f
ON d.numero_departamento = f.numero_departamento;

/* Questão 4 */
SELECT (primeiro_nome||' '||nome_meio||' '||ultimo_nome) AS nome_funcionario, extract(year from age(data_nascimento)) AS idade, salario, CAST (salario * (1 + CASE
WHEN salario < 35000 THEN 0.2
ELSE 0.15
END) AS decimal (10,2)) AS salario_com_reajuste
FROM funcionario;

/* Questão 5 */
SELECT d.nome_departamento, CAST (CASE
WHEN d.cpf_gerente = f.cpf THEN (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome)
END AS varchar(31)) AS nome_gerente,
(f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, f.salario
FROM funcionario AS f
INNER JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario DESC;

/* Questão 6 */
SELECT (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, f.numero_departamento, depend.nome_dependente, extract(year from age(depend.data_nascimento)) AS idade, CAST (CASE
WHEN depend.sexo = 'M' THEN 'Masculino'
ELSE 'Feminino'
END AS varchar (10)) AS sexo
FROM funcionario AS f
INNER JOIN dependente AS depend
ON f.cpf = depend.cpf_funcionario;

/* Questão 7 */
SELECT (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, f.numero_departamento, f.salario
FROM funcionario AS f
WHERE f.cpf NOT IN (
    SELECT depend.cpf_funcionario
    FROM dependente AS depend
    );

/* Questão 8 */
SELECT d.nome_departamento, p.nome_projeto, (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, te.horas AS horas_trabalhadas
FROM departamento AS d
INNER JOIN funcionario AS f
ON d.numero_departamento = f.numero_departamento
INNER JOIN trabalha_em AS te
ON f.cpf = te.cpf_funcionario
INNER JOIN projeto AS p
ON p.numero_projeto = te.numero_projeto;

/* Questão 9 */
SELECT d.nome_departamento, p.nome_projeto, SUM (te.horas) AS horas_totais_trabalhadas
FROM departamento AS d
INNER JOIN projeto AS p
ON d.numero_departamento = p.numero_departamento
INNER JOIN trabalha_em AS te
ON p.numero_projeto = te.numero_projeto
GROUP BY d.nome_departamento, p.nome_projeto
ORDER BY d.nome_departamento ASC;

/* Questão 10 */
SELECT departamento.nome_departamento, CAST (AVG (funcionario.salario) AS decimal (10,2)) AS media_salarial
FROM funcionario, departamento
WHERE (departamento.numero_departamento = funcionario.numero_departamento)
GROUP BY departamento.nome_departamento;

/* Questão 11 */
SELECT (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, p.nome_projeto, (te.horas * 50) AS reais_por_hora
FROM funcionario AS f
INNER JOIN trabalha_em AS te
ON f.cpf = te.cpf_funcionario
INNER JOIN projeto AS p
ON te.numero_projeto = p.numero_projeto;

/* Questão 12 */
SELECT d.nome_departamento, p.nome_projeto, (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario
FROM departamento AS d
INNER JOIN funcionario AS f
ON f.numero_departamento = d.numero_departamento
INNER JOIN trabalha_em AS te
ON te.cpf_funcionario = f.cpf
INNER JOIN projeto AS p
ON p.numero_projeto = te.numero_projeto
WHERE te.horas is null;

/* Questão 13 */
SELECT (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome, f.sexo AS sexo, extract(year from age(f.data_nascimento)) AS idade
FROM funcionario AS f
UNION
SELECT depend.nome_dependente AS nome, depend.sexo AS sexo, extract(year from age(depend.data_nascimento)) AS idade
FROM dependente AS depend
ORDER BY idade desc;

/* Questão 14 */
SELECT d.nome_departamento, COUNT (f.cpf) AS numero_de_funcionarios
FROM departamento AS d
INNER JOIN funcionario AS f
ON f.numero_departamento = d.numero_departamento
GROUP BY d.nome_departamento;

/* Questão 15 */
SELECT (f.primeiro_nome||' '||f.nome_meio||' '||f.ultimo_nome) AS nome_funcionario, d.nome_departamento, p.nome_projeto
FROM funcionario AS f
INNER JOIN departamento AS d
ON f.numero_departamento = d.numero_departamento
INNER JOIN projeto AS p
ON p.numero_departamento = d.numero_departamento
GROUP BY nome_funcionario, d.nome_departamento, p.nome_projeto
ORDER BY nome_funcionario;