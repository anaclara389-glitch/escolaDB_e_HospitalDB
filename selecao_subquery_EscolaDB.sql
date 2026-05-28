-- Active: 1779904746551@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@EscolaDB
use EscolaDB;

-- SUBQUERY (Subconsulta)

-- quest 1
select nome from Alunos
where idade = (select max(idade) from Alunos);

-- quest 2
select nome, avg(idade) as media_idade from Alunos
where = (select idade )