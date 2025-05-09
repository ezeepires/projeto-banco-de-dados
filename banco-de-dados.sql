-- Criando a tabela de alunos que vão se matricular nos cursos
CREATE TABLE alunos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(55) NOT NULL,
  email VARCHAR(55) NOT NULL,
  data_de_nascimento DATE
);

-- Inserindo alguns alunos fictícios só pra teste
INSERT INTO alunos (id, nome, email, data_de_nascimento)
VALUES 
(1, 'John Smith', 'john@gmail.com', '1991-05-18'),
(2, 'Emily Johnson', 'emily@gmail.com', '1999-10-03'),
(3, 'Michael Brown', 'michel@gmail.com', '1986-07-27'),
(4, 'Ashley Davis', 'ashley@gmail.com', '1994-02-11'),
(5, 'Daniel Miller', 'daniel@gmail.com', '1988-12-22');

-- Visualizando todos os alunos cadastrados
SELECT * FROM alunos;




-- Criando a tabela com os cursos disponíveis
CREATE TABLE cursos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome_curso VARCHAR(55) NOT NULL,
  carga_horaria TIME,
  preco_curso DECIMAL(10, 2)
);

-- Adicionando alguns cursos com nomes, cargas horárias e preços variados
INSERT INTO cursos (id, nome_curso, carga_horaria, preco_curso)
VALUES 
(1, 'Python', '23:30:00', 599.99),
(2, 'Artificial Intelligence', '41:35:00', 499.99),
(3, 'Pre-enem', '65:20:00', 399.99),
(4, 'Ingles', '19:30:00', 299.99),
(5, 'Espanhol', '18:30:00', 199.99);

-- Listando todos os cursos cadastrados
SELECT * FROM cursos;




-- Agora vamos registrar as matrículas dos alunos nos cursos
CREATE TABLE matriculas(
  id_matricula INT AUTO_INCREMENT PRIMARY KEY,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  data_matricula DATE NOT NULL,
  FOREIGN KEY (id_aluno) REFERENCES alunos(id),
  FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Inserindo algumas matrículas como exemplo
INSERT INTO matriculas (id_aluno, id_curso, data_matricula)
VALUES 
(1, 1, '2024-08-13'),  -- John no curso de Python
(2, 2, '2024-05-23'),  -- Emily em IA
(3, 5, '2024-03-26'),  -- Michael em Espanhol
(4, 4, '2024-09-22'),  -- Ashley em Inglês
(5, 3, '2024-02-05');  -- Daniel no curso pré-Enem

-- Conferindo todas as matrículas feitas
SELECT * FROM matriculas;




-- Criando tabela dos instrutores responsáveis pelos cursos
CREATE TABLE instrutores(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(55),
  especialidade VARCHAR(55)
);

-- Cadastrando alguns instrutores com suas respectivas especialidades
INSERT INTO instrutores (id, nome, especialidade)
VALUES 
(1, 'Igor Cazangi', 'Professor de TI'),
(2, 'Herildo', 'Professor de IA'),
(3, 'Welligton', 'Professor de Preparatorio Enem'),
(4, 'Isabela', 'Professoa de Ingles'),
(5, 'Rafaela', 'Professoa de Espanhol');

-- Mostrando todos os instrutores cadastrados
SELECT * FROM instrutores;




-- Criando a tabela das aulas, que estão associadas a cada curso
CREATE TABLE aulas(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_curso INT NOT NULL,
  titulo VARCHAR(100) NOT NULL,
  duracao_min TIME,
  FOREIGN KEY (id_curso) REFERENCES cursos(id)
);

-- Inserindo as primeiras aulas de cada curso
INSERT INTO aulas (id, id_curso, titulo, duracao_min)
VALUES 
(1, 1, 'Criando function com Python - AULA 01', '23:30:00'),
(2, 2, 'Iniciando aprendizado com LLM', '41:35:00'),
(3, 3, 'Como interpretar textos - AULA 01', '65:20:00'),
(4, 4, 'Aprendendo verbo "To Be"', '19:30:00'),
(5, 5, 'Ensinando o vocabulario Espanhol', '18:30:00');

-- Verificando todas as aulas cadastradas
SELECT * FROM aulas;




-- Consulta para ver quem está matriculado no curso de Espanhol (id 5)
SELECT * FROM matriculas WHERE id_curso = 5;




-- Consulta para ver os títulos das aulas do curso de Inteligência Artificial
SELECT aulas.titulo
FROM aulas 
JOIN cursos ON aulas.id_curso = cursos.id
WHERE cursos.nome_curso = 'Artificial Intelligence';




-- Consulta para encontrar cursos que custam mais de R$500
SELECT * FROM cursos WHERE preco_curso > 500.00;