USE mercado_free;

INSERT INTO category (name) 
    VALUES
        ('Electrónicos'),
        ('Ropa'),
        ('Hogar y Jardín'),
        ('Deportes y Aire libre');

INSERT INTO product (name, category_id) 
    VALUES
        ('Smartphone X', 1),
        ('Camiseta Casual', 2),
        ('Aspiradora Potente', 3),
        ('Balón de Fútbol', 4);

INSERT INTO user (username, email, phone_number, account_type) 
    VALUES
        ('usuario1', 'usuario1@example.com', '123-456-7890', 'user'),
        ('vendedor1', 'vendedor1@example.com', '987-654-3210', 'seller'),
        ('ambos1', 'ambos1@example.com', '555-555-5555', 'both');

INSERT INTO seller (id_user, verified) VALUES (2, TRUE);

INSERT INTO stock_product (id_user, id_product, stock) 
    VALUES
        (2, 1, 50),
        (2, 2, 100),
        (2, 3, 30),
        (2, 4, 20);

INSERT INTO order_product (id_user, id_product, id_seller, quantity) 
    VALUES
        (1, 1, 1, 2),
        (1, 2, 1, 1),
        (1, 3, 1, 3),
        (1, 4, 1, 1);

INSERT INTO shipping (id_order_product, street, street_number, city, zip_code) 
    VALUES
        (1, 'Calle Principal', '123', 'Ciudad A', '12345'),
        (2, 'Avenida Secundaria', '456', 'Ciudad B', '67890'),
        (3, 'Calle Residencial', '789', 'Ciudad C', '34567'),
        (4, 'Camino Rural', '101', 'Ciudad D', '89012');

INSERT INTO customer_purchase (id_user, id_order_product) 
    VALUES
        (1, 1),
        (1, 2),
        (1, 3),
        (1, 4);





