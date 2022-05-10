# *Pset 2*

Nessa pasta do repositório está a minha resolução do Pset 2, passado para mim na faculdade. O Pset 2 é parte do mesmo projeto do Pset 1, também nesse diretório. Falando especificamente do Pset 2, acima você deve encontrar dois arquivos: um deles é o script do banco de dados (postgre.sql), o outro é o script com as respostas do Pset 2. O scipt do Postgre era o primero Pset, mas decidi deixar ele aqui também para maior facilidade e praticidade na hora do professor rodar o script. O arquivo "respostas_pset2.sqp" é uma sequência de comandos de SELECT, com diversas restrições e especificações, que atendem às questões da atividade. No final desse README deixarei o link para o pdf da atividade, caso queiram entender o propósito desses comandos. No final desse README deixarei as perguntas do Pset, para os visitantes do meu repositório entederem o propósito dos comandos.

No projeto do Elmasri, eu pude fazer a atividade tanto no Postgre, quanto no MariaDB, mas escolhi usar o Postgre por uma preferência pessoal. Os dois scripts devem ser rodados no terminal da máquina, começando pelo script do Postgre. Para os forasteiros, que encontraram meu trabalho por acaso e querem executar em seu computador, recomendo ter instalado o PGadmin, ele facilita muito na visualização do script e nas etapas durante sua execução. O terminal deve pedir a senha de um usuário chamado "vitor", logo depois da criação do banco de dados "uvv", a senha é "12345". Após rodar o script do Postgre, o script das respostas deve rodar perfeitamente. Se houver o problema do terminal dizer que uma relação não existe, pode ser que você tenha errado em alguma parte do processo, recomendo dar um DROP no banco de dados uvv e tentar novamente do zero. Esse erro ocorreu algumas vezes comigo, por causa de um bug recorrente no sistema, por isso preferi deixar avisado.

Nesse trabalho tive a companhia de outros alunos, como: Lucas Zanon Guarnier, André Coco Pereira Melotti.

>**Questões do Pset2**:
>
>**QUESTÃO 01:** prepare um relatório que mostre a média salarial dos funcionários de cada departamento.
>
>**QUESTÃO 02:** prepare um relatório que mostre a média salarial dos homens e das mulheres.
>
>**QUESTÃO 03:** prepare um relatório que liste o nome dos departamentos e, para cada departamento, inclua as seguintes informações de seus funcionários: o nome completo, a data de .nascimento, a idade em anos completos e o salário.
>
>**QUESTÃO 04:** prepare um relatório que mostre o nome completo dos funcionários, a idade em anos completos, o salário atual e o salário com um reajuste que obedece ao seguinte critério: se o salário atual do funcionário é inferior a 35.000 o reajuste deve ser de 20%, e se o salário atual do funcionário for igual ou superior a 35.000 o reajuste deve ser de 15%.
>
>**QUESTÃO 05:** prepare um relatório que liste, para cada departamento, o nome do gerente e o nome dos funcionários. Ordene esse relatório por nome do departamento (em ordem crescente) e por salário dos funcionários (em ordem decrescente). 
>
>**QUESTÃO 06:** prepare um relatório que mostre o nome completo dos funcionários que têm dependentes, o departamento onde eles trabalham e, para cada funcionário, também liste o nome completo dos dependentes, a idade em anos de cada dependente e o sexo (o sexo NÃO DEVE aparecer como M ou F, deve aparecer como “Masculino” ou “Feminino”).
>
>**QUESTÃO 07:** prepare um relatório que mostre, para cada funcionário que NÃO TEM dependente, seu nome completo, departamento e salário.
>
>**QUESTÃO 08:** prepare um relatório que mostre, para cada departamento, os projetos desse departamento e o nome completo dos funcionários que estão alocados em cada projeto. Além disso inclua o número de horas trabalhadas por cada funcionário, em cada projeto.
>
>**QUESTÃO 09:** prepare um relatório que mostre a soma total das horas de cada projeto em cada departamento. Obs.: o relatório deve exibir o nome do departamento, o nome do projeto e a soma total das horas.
>
>**QUESTÃO 10:** prepare um relatório que mostre a média salarial dos funcionários de cada departamento.
>
>**QUESTÃO 11:** considerando que o valor pago por hora trabalhada em um projeto é de 50 reais, prepare um relatório que mostre o nome completo do funcionário, o nome do projeto e o valor total que o funcionário receberá referente às horas trabalhadas naquele projeto.
>
>**QUESTÃO 12:** seu chefe está verificando as horas trabalhadas pelos funcionários nos projetos e percebeu que alguns funcionários, mesmo estando alocadas à algum projeto, não registraram nenhuma hora trabalhada. Sua tarefa é preparar um relatório que liste o nome do departamento, o nome do projeto e o nome dos funcionários que, mesmo estando alocados a algum projeto, não registraram nenhuma hora trabalhada.
>
>**QUESTÃO 13:** durante o natal deste ano a empresa irá presentear todos os funcionários e todos os dependentes (sim, a empresa vai dar um presente para cada funcionário e um presente para cada dependente de cada funcionário) e pediu para que você preparasse um relatório que listasse o nome completo das pessoas a serem presenteadas (funcionários e dependentes), o sexo e a idade em anos completos (para poder comprar um presente adequado). Esse relatório deve estar ordenado pela idade em anos completos, de forma decrescente.
>
>**QUESTÃO 14:** prepare um relatório que exiba quantos funcionários cada departamento tem.
>
>**QUESTÃO 15:** como um funcionário pode estar alocado em mais de um projeto, prepare um relatório que exiba o nome completo do funcionário, o departamento desse funcionário e o nome dos projetos em que cada funcionário está alocado. Atenção: se houver algum funcionário que não está alocado em nenhum projeto, o nome completo e o departamento também devem aparecer no relatório.

## **Fim!**
