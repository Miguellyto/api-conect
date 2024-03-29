CREATE DATABASE ecommerce
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS public.produtos
(
    sku integer NOT NULL DEFAULT nextval('produtos_produtosid_seq'::regclass),
    nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    quantidade integer NOT NULL,
    preco numeric(10,2),
    CONSTRAINT produtos_pkey PRIMARY KEY (sku)
)

CREATE TABLE pedidos (
	id_pedido SERIAL PRIMARY KEY NOT NULL,
	id_produto NUMERIC(11) NOT NULL,
	quantidade NUMERIC(11) NOT NULL
);

ALTER TABLE produtos RENAME TO products;

ALTER TABLE pedidos RENAME TO orders;

ALTER TABLE orders RENAME id_pedido TO id_order;

ALTER TABLE orders RENAME id_produto TO sku_produto;

describe orders;

show tables;

CREATE TABLE titles (
	id SERIAL PRIMARY KEY NOT NULL,
	title NUMERIC(11) NOT NULL
);

CREATE TABLE users (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(500) NOT NULL,
	email VARCHAR(500) NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP
);
SELECT * FROM users;
---
ALTER TABLE titles ALTER COLUMN title TYPE VARCHAR(500); 

ALTER TABLE titles
ADD COLUMN createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE titles ADD COLUMN updatedAt TIMESTAMP;

-------------Criando Gatilho para a coluna updatedAt no Postgres---------------

/* 
CREATE FUNCTION update_timestamp() RETURNS trigger AS $update_timestamp$
    BEGIN
        NEW.updatedAt := current_timestamp; ---//pode ser  NEW.updated
        RETURN NEW;
    END;
$update_timestamp$ LANGUAGE plpgsql;

----
CREATE TRIGGER update_timestamp BEFORE INSERT OR UPDATE ON products --//Inserir/Atualizar
--CREATE TRIGGER update_timestamp BEFORE UPDATE ON products --//Apenas quando Atualizar
    FOR EACH ROW EXECUTE PROCEDURE update_timestamp(); 

 */

SELECT * FROM titles;
SELECT * FROM orders;
SELECT * FROM products;

 --Verificando o tamanho das Bases de Dados no pg
SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;

--Tem também esse script que peguei (https://makandracards.com/zeroglosa/39955-consulta-postgres-para-ver-os-tamanhos-de-todos-os-bancos)
--, que mostra os bancos excluindo os bancos padrão do sistema e a soma do tamanho das bases no servidor.
(SELECT
	datname                                   AS banco,
	pg_database_size(datname)                 AS tamanho,
	pg_size_pretty(pg_database_size(datname)) AS tamanho_pretty
FROM pg_database
WHERE datname NOT IN ('template0', 'template1', 'postgres')
ORDER BY tamanho DESC, banco ASC)

UNION ALL

(SELECT
	'TOTAL'                                        AS banco,
	sum(pg_database_size(datname))                 AS tamanho,
	pg_size_pretty(sum(pg_database_size(datname))) AS tamanho_pretty
FROM pg_database
WHERE datname NOT IN ('template0', 'template1', 'postgres'));

