-- Active: 1779904746551@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@EscolaDB
use EscolaDB;
-- quest 1
select * from Alunos;

--quest 2
select nome from Alunos;

--quest 3
select nome_curso from Cursos;

--quest 4
select nome from Alunos
where cidade = 'São Paulo';

--quest 5
select nome from Alunos
where idade > 20;

--quest 6
select nome_curso as CURSO from Cursos
where carga_horaria > 50;

--quest 7
select nome from Alunos
where idade >= 18 and idade <= 22;

--quest 8
select nome from Alunos 
where cidade = 'Curitiba';

--quest 9

select nome from Alunos 
where idade < 21;

--quest 10
select id_matricula from Matriculas;

--extra 
select * from Alunos
WHERE nome LIKE'%s%';

--NÍVEL 2

--quest 1
select A.nome, M.nota
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.nota > 8;

--quest 2
select A.nome, M.faltas
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
where M.faltas > 5;

--quest 3
select nome_curso, carga_horaria from Cursos
where carga_horaria = 80;

--quest 4
select nome from Alunos 
where cidade != 'São Paulo';

--quest 5
select nome from Alunos 
where nome like 'A%';

--quest 6
select nome from Alunos 
where nome like '%a';

--quest 7
select nome_curso from Cursos 
where nome_curso like '%Dados%';

--quest 8
select id_matricula, nota from Matriculas
where nota >=7 and nota <= 9;

--quest 9
select nome from Alunos 
where idade = 20;

--quest 10
select nome_curso, carga_horaria from Cursos
where carga_horaria <= 60;

--GROUP BY
-- quest 1
select count(nome), cidade from Alunos
group by cidade;

--quest 2
select avg(idade) as media_de_idade, cidade from Alunos 
group by cidade;

--quest 3
select count(M.id_matricula), C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso;

-- quest 4
select AVG(M.nota) as media, C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso;

--quest 5 
select sum(M.faltas), C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso;

--quest 6
select max(M.nota), C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso;

--quest 7 
select min(M.nota), C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso;

--quest 8
select sum(M.faltas) as soma_total, A.nome
from Matriculas as M
join Alunos as A on M.id_aluno = A.id_aluno
group by nome;

--quest 9
select avg(M.nota) as media, A.nome
from Matriculas as M
join Alunos as A on M.id_aluno = A.id_aluno
group by nome;

--group by 10
select count(nome), idade as faixa_etatia from Alunos
group by idade;

-- Questões avançadas

--quest 1
select count(id_aluno) as Alunos, cidade 
from Alunos
group by cidade
having count(id_aluno) > 2;

--quest 2
select avg(M.nota) as media_notas, C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso
having avg(M.nota) > 8;

-- quest 3
select count(M.id_matricula), C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso
having count(M.id_matricula) > 2;

-- quest 4
select A.nome as Alunos, sum(M.faltas) as total
from Alunos as A
join Matriculas as M on A.id_aluno = M.id_aluno
group by A.nome
having total > 5;

--quest 5
select min(M.nota) as notas, A.nome
from Matriculas as M
join Alunos as A on M.id_aluno = A.id_aluno
group by nome
having min(M.nota) > 6;

--quest 6
select nome_curso, carga_horaria from Cursos
order by carga_horaria desc;

--quest 7
select nome, idade from Alunos
order by idade desc;

--quest 8
select avg(M.nota) as media_notas, C.nome_curso
from Matriculas as M
join Cursos as C on M.id_curso = C.id_curso
group by nome_curso
order by media_notas desc;

--quest 9
select cidade, count(nome) as quant_alunos from Alunos
group by cidade
order by count(nome) asc;

-- quest 10
select avg(M.nota) as media, A.nome
from Matriculas as M
join Alunos as A on M.id_aluno = A.id_aluno
group by nome
having media > 7
order by media desc;