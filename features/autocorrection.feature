Feature: Correção automática de provas
As a aluno
I want enviar minhas respostas de uma prova objetiva
So that eu possa receber automaticamente minha nota e registrar meu desempenho no sistema

Scenario: Corrigir automaticamente as provas
Given “Pedro” respondeu letra “a” e letra “e” para as questões “1” e “2” respectivamente
And o sistema aceita apenas alternativas entre “a”, ”b”, “c”, “d” e “e”
And o “EE1 de Cálculo” tem apenas essas duas questões
And a resposta esperada são letra “a” e letra “b” para essas duas questões respectivamente
When “Pedro” envia as respostas
Then o sistema exibe a nota “5.0” para Pedro

Scenario: Erro ao enviar a prova
Given “Pedro” respondeu letra “a” e letra “e” para as questões “1” e “2” respectivamente
And o sistema aceita apenas alternativas entre “a”, ”b”, “c”, “d” e “e”
And o “EE1 de Cálculo“ tem as questões “1”, “2” e “3”
When “Pedro” tenta enviar as respostas
Then o sistema exibe erro “Preencha todas as questões

Scenario: Cadastrar correção de prova
Given “Pedro” respondeu letra “a” e letra “e” para as questões “1” e “2” respectivamente
And o sistema aceita apenas alternativas entre “a”, ”b”, “c”, “d” e “e”
And o “EE1 de Cálculo” tem apenas essas duas questões
And a resposta esperada são letra “a” e letra “b” para essas duas questões respectivamente
When “Pedro” envia as respostas
Then o sistema cadastra a nota “5.0” para Pedro no “EE1 de Cálculo

Scenario: Prova incompleta
Given "Pedro" respondeu letra "f" para questão "1"
And o sistema aceita apenas alternativas entre "a", "b", "c", "d" e "e"
And o "EE1 de Cálculo" tem apenas a questão "1"
When "Pedro" tenta enviar as respostas
Then o sistema exibe o erro "Alternativa inválida, preencha entre a,b,c,d ou e"