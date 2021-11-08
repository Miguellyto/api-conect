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

ALTER TABLE titles ALTER COLUMN title TYPE VARCHAR(500); 

SELECT * FROM titles;
SELECT * FROM orders;
SELECT * FROM products;