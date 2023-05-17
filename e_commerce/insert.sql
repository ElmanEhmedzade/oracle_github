INSERT INTO product ( name, description, SKU, category_id, inventory_id, price, discount_id, created_at, modified_at, deleted_at)
VALUES ( 'Product 1', 'Description 1', 'SKU001', 1, 1, 10.99, 1, SYSDATE, SYSDATE, NULL);

INSERT INTO product ( name, description, SKU, category_id, inventory_id, price, discount_id, created_at, modified_at, deleted_at)
VALUES ('Product 2', 'Description 2', 'SKU002', 2, 2, 19.99, 2, SYSDATE, SYSDATE, NULL);

INSERT INTO product ( name, description, SKU, category_id, inventory_id, price, discount_id, created_at, modified_at, deleted_at)
VALUES ('Product 3', 'Description 3', 'SKU003', 1, 3, 15.99, 1, SYSDATE, SYSDATE, NULL);
INSERT INTO product ( name, description, SKU, category_id, inventory_id, price, discount_id, created_at, modified_at, deleted_at)
VALUES ('Product 4', 'Description 4', 'SKU004', 2, 4, 12.99, 2, SYSDATE, SYSDATE, NULL);
INSERT INTO product ( name, description, SKU, category_id, inventory_id, price, discount_id, created_at, modified_at, deleted_at)
VALUES ('Product 5', 'Description 5', 'SKU005', 1, 5, 9.99, 1, SYSDATE, SYSDATE, NULL);


-------------------------------------------------------
INSERT INTO cart_item (session_id, product_id, quantity, created_at, modified_at)
VALUES (1, 1, 2, SYSDATE, SYSDATE);

INSERT INTO cart_item (session_id, product_id, quantity, created_at, modified_at)
VALUES (1, 2, 1, SYSDATE, SYSDATE);

INSERT INTO cart_item (session_id, product_id, quantity, created_at, modified_at)
VALUES (2, 3, 3, SYSDATE, SYSDATE);

INSERT INTO cart_item (session_id, product_id, quantity, created_at, modified_at)
VALUES (2, 4, 1, SYSDATE, SYSDATE);

INSERT INTO cart_item (session_id, product_id, quantity, created_at, modified_at)
VALUES (3, 5, 2, SYSDATE, SYSDATE);
---------------------------------------------------------------
INSERT INTO user1 (username, password, first_name, last_name, address, telephone, created_at, modified_at)
VALUES ('user1', 'password1', 'John', 'Doe', '123 Main St', 1234567890, SYSDATE, SYSDATE);

INSERT INTO user1 (username, password, first_name, last_name, address, telephone, created_at, modified_at)
VALUES ('user2', 'password2', 'Jane', 'Smith', '456 Elm St', 9876543210, SYSDATE, SYSDATE);

INSERT INTO user1 (username, password, first_name, last_name, address, telephone, created_at, modified_at)
VALUES ('user3', 'password3', 'Michael', 'Johnson', '789 Oak St', 5551234567, SYSDATE, SYSDATE);

INSERT INTO user1 (username, password, first_name, last_name, address, telephone, created_at, modified_at)
VALUES ('user4', 'password4', 'Emily', 'Brown', '567 Pine St', 8887654321, SYSDATE, SYSDATE);

----------------------------