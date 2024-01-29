CREATE DATABASE mercado_free;

USE mercado_free;

CREATE TABLE category (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE product (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    category_id SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE user (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    account_type ENUM('user', 'seller', 'both') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_user PRIMARY KEY (id),
    CONSTRAINT uq_user_username UNIQUE (username),
    CONSTRAINT uq_user_email UNIQUE (email)
);

CREATE TABLE seller (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_user SMALLINT UNSIGNED NOT NULL,
    verified BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT pk_seller PRIMARY KEY (id),
    CONSTRAINT fk_seller_user FOREIGN KEY (id_user) REFERENCES user (id)
);

CREATE TABLE stock_product (
    id_user SMALLINT UNSIGNED NOT NULL,
    id_product SMALLINT UNSIGNED NOT NULL,
    stock SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT pk_stock_product PRIMARY KEY (id_user),
    CONSTRAINT fk_stock_product_user FOREIGN KEY (id_user) REFERENCES user (id),
    CONSTRAINT fk_stock_product_product FOREIGN KEY (id_product) REFERENCES product (id)
);

CREATE TABLE order_product (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_user SMALLINT UNSIGNED NOT NULL,
    id_product SMALLINT UNSIGNED NOT NULL,
    id_seller SMALLINT UNSIGNED NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT pk_order_product PRIMARY KEY (id),
    CONSTRAINT fk_order_product_user FOREIGN KEY (id_user) REFERENCES user (id),
    CONSTRAINT fk_order_product_product FOREIGN KEY (id_product) REFERENCES product (id),
    CONSTRAINT fk_order_product_seller FOREIGN KEY (id_seller) REFERENCES seller (id)
);

CREATE TABLE shipping (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_order_product SMALLINT UNSIGNED NOT NULL,
    status ENUM('pending', 'shipped', 'delivered') NOT NULL DEFAULT 'pending',
    street VARCHAR(50) NOT NULL,
    street_number VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    CONSTRAINT pk_shipping PRIMARY KEY (id),
    CONSTRAINT fk_shipping_order_product FOREIGN KEY (id_order_product) REFERENCES order_product (id)
);

CREATE TABLE customer_purchase (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_user SMALLINT UNSIGNED NOT NULL,
    id_order_product SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT pk_customer_purchase PRIMARY KEY (id),
    CONSTRAINT fk_customer_purchase_user FOREIGN KEY (id_user) REFERENCES user (id),
    CONSTRAINT fk_customer_purchase_order_product FOREIGN KEY (id_order_product) REFERENCES order_product (id)
);
