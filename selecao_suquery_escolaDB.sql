-- Active: 1780941416778@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@EscolaDB
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
select nome from Alunos
where id_aluno in 
(select id_aluno from Matriculas);

-- quest 2 
select nome_curso from Cursos
where id_curso in (select id_curso from Matriculas);

-- quest 3
select nome, id_aluno from Alunos
where id_aluno in (select id_matricula from Matriculas
where id_curso = 1);

-- quest 4
select A.nome, A.id_aluno from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.id_curso in (select id_curso from Cursos
where carga_horaria > 60);

-- quest 5
select nome_curso from Cursos 
where id_curso in (select id_curso from Matriculas
where nota > 8);

-- quest 6
select nome from Alunos
where id_aluno in (select id_aluno from Matriculas
group by id_aluno
having count(id_matricula) > 1);

-- quest 7
select nome_curso from Cursos
where id_curso not in (select id_curso from Matriculas);

-- quest 8
select nome from Alunos
where id_aluno in (select id_aluno from Matriculas
group by id_aluno
having sum(faltas) > 5);

-- quest 9
select C.nome_curso from Cursos as C
join Matriculas as M on M.id_curso = C.id_curso
where M.id_aluno in (select id_aluno from Alunos where cidade = 'Curitiba');

-- quest 10
select A.nome, A.id_aluno from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.id_curso in (select id_curso from Cursos
where carga_horaria = (select max(carga_horaria) from Cursos));

-- Avançadas

-- quest 1
select nome from Alunos 
where idade > (select avg(idade) from Alunos 
where cidade = 'São paulo');

-- quest 2
select nome_curso, avg(M.nota) as media from Cursos as C
join Matriculas as M on M.id_curso = C.id_curso
group by M.id_curso, C.nome_curso
having avg(M.nota) > (select avg(nota) from Matriculas);

-- quest 3
select A.nome, sum(M.faltas) as faltas from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
group by A.id_aluno, A.nome
having sum(M.faltas) > (select avg(faltas) from Matriculas);

select avg(faltas) from Matriculas;

-- quest 4
select C.nome_curso, max(M.nota) as maior_nota from Cursos as C
join Matriculas as M on C.id_curso = M.id_curso 
group by C.nome_curso
having max(M.nota) = (select max(nota) from Matriculas);

-- quest 5
select A.nome, avg(M.nota) as media from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
group by A.nome
having avg(M.nota) < (select avg(nota) from Matriculas);
