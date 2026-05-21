-- Active: 1779300064094@@mysql-1c959a5e-estudante-af5b.h.aivencloud.com@18971@HospitalDB
use database HostpitalDB;
SELECT id_paciente as paciente,
       data_consulta as valor_diario,
       SUM(valor)
FROM Consultas
GROUP BY id_paciente,
         data_consulta;



-- Teste 1
SELECT id_paciente,
       SUM(valor)
FROM Consultas
WHERE valor>200
GROUP BY id_paciente;

--Teste 2
select id_paciente as paciente,
    data_consulta as data,
    sum(valor) as total_diario
from Consultas
group by id_paciente, data_consulta;


--Teste 3
select id_paciente, sum(valor) as total
from Consultas
group by id_paciente
having sum(valor) > 200;

select * from Consultas;

--Teste 4
SELECT id_medico, COUNT(*) AS TotalConsultas
FROM Consultas
GROUP BY id_medico
HAVING COUNT(*)>5;

SELECT E.nome_especialidade,
COUNT(C.id_consulta)AS TotalConsultas,
       AVG(C.valor)AS MediaConsultas,
       SUM(C.valor)AS Faturamento
FROM Consultas AS C
JOIN Medicos AS M ON C.id_medico= M.id_medico
JOIN Especialidades AS E ON M.id_especialidade= E.id_especialidade
GROUP BY E.nome_especialidade
HAVING SUM(C.valor)>1000
ORDER BY Faturamento DESC;
