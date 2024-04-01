CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecível BOOLEAN NOT NULL,
    marca VARCHAR(50),
    nacionalidade VARCHAR(50)
);

INSERT INTO Produtos (id_produto, nome, preço, estoque, perecível, marca, nacionalidade)
VALUES 
    (1, 'Arroz', 5.99, 100, FALSE, 'Tio João', 'Brasil'),
    (2, 'Feijão', 6.99, 80, FALSE, 'Camil', 'Brasil'),
    (3, 'Maçã', 3.49, 50, TRUE, 'Fuji', 'Brasil'),
    (4, 'Leite', 2.29, 120, TRUE, 'Nestlé', 'Brasil'),
    (5, 'Sabonete', 1.99, 200, FALSE, 'Dove', 'Estados Unidos');

SELECT * FROM Produtos;

SELECT COUNT(*) AS total_produtos FROM Produtos;

SELECT AVG(preço) AS preço_médio FROM Produtos;

SELECT perecível, AVG(preço) AS preço_médio
FROM Produtos
GROUP BY perecível;

SELECT nome, AVG(preço) AS preço_médio
FROM Produtos
GROUP BY nome;

SELECT AVG(preço) AS preço_médio, SUM(estoque) AS total_em_estoque
FROM Produtos;

SELECT nome, marca, estoque
FROM Produtos
WHERE preço = (SELECT MAX(preço) FROM Produtos);

SELECT *
FROM Produtos
WHERE preço > (SELECT AVG(preço) FROM Produtos);

SELECT nacionalidade, COUNT(*) AS quantidade
FROM Produtos
GROUP BY nacionalidade;