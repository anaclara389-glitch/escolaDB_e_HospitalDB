-- Active: 1779904746551@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@HospitalDB
select * from Pacientes
where tipo_sanguineo = 'B-';

select Medicos.nome,
    Medicos.crm,
    Especialidades.nome,
    Hospitais.nome,
    count(Consultas.id_consulta)
from Medicos, Especialidades, Hospitais, Consultas
where Medicos.id_especialidade = Especialidades.id_especialidade 
and Medicos.id_Hospital = 2 
and Hospitais.id_hospital = Medicos.id_hospital
and Consultas.id_medico = Medicos.id_medico
group by Medicos.id_medico, 
Medicos.nome, Medicos.crm, 
Especialidades.nome, 
Hospitais.nome;

--eu
select M.nome,
    M.salario,
    M.telefone,
    E.nome as especialidade,
    H.nome as hospital
from Medicos as M
join Especialidades as E
on M.id_especialidade = E.id_especialidade
join Hospitais as H
on M.id_hospital = H.id_hospital;

--Professor e turma
SELECT M.nome,
       max(M.salario),
       E.nome,
       M.crm 
FROM Medicos AS M
JOIN Especialidades AS E
ON M.id_especialidade=
   E.id_especialidade
   GROUP BY M.nome, E.nome,M.crm
   ORDER BY max(salario) desc;

--Amanda
SELECT M.nome as Medico,P.nome as Paciente,C.data_consulta
FROM Medicos AS M, Pacientes AS P, Consultas AS C
WHERE C.id_medico = M.id_medico
AND C.id_paciente = P.id_paciente;

--juliana (arrumar)
SELECT M.nome, M.email, E.nome, COUNT(C.id_consulta), M.salario
FROM Medicos AS M 
JOIN Especialidades AS E 
ON M.id_especialidade = E.id_especialidade
JOIN Consultas AS C 
ON M.id_medico = C.id_medico
GROUP BY M.id_medico;

-- Luiza
SELECT M.nome, M.email, M.telefone, E.nome as especialidade, H.nome as Hospital, COUNT(Exames.id_exame) as Exames_solicitados
FROM Medicos as M
JOIN Especialidades AS E ON M.id_especialidade = E.id_especialidade
JOIN Hospitais AS H ON M.id_hospital = H.id_hospital
JOIN Exames ON M.id_medico = Exames.id_medico
GROUP BY M.id_medico;


