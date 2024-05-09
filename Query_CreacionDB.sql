-- CREACION DE BASE DE DATOS PARA PRUEBA TECNICA
CREATE DATABASE prueba_tecnica;

-- UTILIZANDO BASE DE DATOS
USE prueba_tecnica;

-- CREACION DE TABLAS
CREATE TABLE olist_order_items(
	order_id NVARCHAR(255),
	order_item_id INT,
	product_id NVARCHAR(255),
	seller_id NVARCHAR(255), 
	shipping_limit_date DATETIME,
	price FLOAT,
	freight_value FLOAT
);

CREATE TABLE olist_products(
	product_id NVARCHAR(255) PRIMARY KEY,
	product_category_name NVARCHAR(80),
	product_name_lenght INT,
	product_description_lenght INT,
	product_photos_qty INT,
	product_weight_g INT,
	product_length_cm INT,
	product_height_cm INT,
	product_width_cm INT
);

CREATE TABLE olist_sellers(
	seller_id NVARCHAR(255) PRIMARY KEY,
	seller_zip_code_prefix NVARCHAR(5),
	seller_city NVARCHAR(100),
	seller_state NVARCHAR(2)
);

-- CREACION DE LLAVES FORANEAS
ALTER TABLE olist_order_items
ADD CONSTRAINT fk_orderitems_seller
FOREIGN KEY (seller_id)
REFERENCES olist_sellers(seller_id);

ALTER TABLE olist_order_items
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (product_id)
REFERENCES olist_products(product_id);