-- Active: 1780255215409@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@EscolaDB
use EscolaDB;

-- SUBQUERY (Subconsulta)

-- quest 1
select nome from Alunos
where idade = (select max(idade) from Alunos);

-- quest 2
select avg(idade) from Alunos;

select nome, idade from Alunos
where idade < (select avg(idade) as media_idade from Alunos);

-- quest 3
select avg(carga_horaria) from Cursos;

select nome_curso from Cursos
where carga_horaria > (select avg(carga_horaria) from Cursos);

-- provavelmente o que foi pedido:
select nome_curso from Cursos
where carga_horaria = (select max(carga_horaria) from Cursos);

-- quest 4
select A.nome, M.nota 
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.nota = (select max(nota) from Matriculas);

-- quest 5
select avg(nota) from Matriculas;

select A.nome, M.nota
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.nota < (select avg(nota) from Matriculas);

-- quest 6
select avg(carga_horaria) from Cursos;

select nome_curso from Cursos
where carga_horaria < (select avg(carga_horaria) from Cursos);

-- quest 7
select nome, idade from Alunos
where idade = (select min(idade) from Alunos);

-- quest 8
select avg(faltas) from Matriculas;

select A.nome, M.id_matricula 
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.faltas > (select avg(faltas) from Matriculas);

-- quest 9
select nome_curso from Cursos
where carga_horaria != (select max(carga_horaria) from Cursos);

-- quest 10
select A.nome, M.nota 
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.nota = (select min(nota) from Matriculas);


-- Questões Intermediárias — Subquery com IN

-- quest 1




