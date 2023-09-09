-- create user departments
CREATE TABLE USER (
    id uuid NOT NULL,
    name varchar(255),
    email varchar(255) ,
    password varchar(255) ,
     phone_number varchar(255),
     gender ENUM('male', 'female'),
     address varchar(255) ,
     zip_code bigint,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

-- create PRODUCT table
CREATE TABLE PRODUCT (
    id int NOT NULL,
    name varchar(255),
    size varchar(255),
    category_id bigint,
    description varchar(255), 
    quantity bigint,
    price float,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(id)
    PRIMARY KEY (id)
)

-- create ADMIN table
CREATE TABLE ADMIN (
    id int NOT NULL,
    token varchar(255),
    user_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USER(id),
    PRIMARY KEY (id)
)

-- create ADMIN_PRODUCT table
CREATE TABLE ADMIN_PRODUCT (
    id int,
    product_id int,
    admin_id int,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id),
    FOREIGN KEY (admin_id) REFERENCES ADMIN(id),
    PRIMARY KEY (id)
)

-- create  CATEGORY table
CREATE TABLE CATEGORY (
    id int,
    name varchar(255),
    description varchar(255),
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)

-- create ORDERED_PRODUCT table
CREATE TABLE ORDERED_PRODUCT (
    id int,
    order_id int,
    product_id_id int,
    FOREIGN KEY (order_id) REFERENCES ORDER(id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(id),
    PRIMARY KEY (id)
)

-- create ORDER table
CREATE TABLE ORDER (
    id int,
    user_id int,
    admin_id_id int,
    quantity bigint,
    address varchar(255),
    order_date datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USER(id),
    FOREIGN KEY (admin_id) REFERENCES ADMIN(id),
    PRIMARY KEY (id)
)

-- create PAYMENT tables
CREATE TABLE PAYMENT (
    id bigint,
    order_id bigint,
    user_id bigint,
    payment_date  datetime DEFAULT CURRENT_TIMESTAMP,
    amount float,
    FOREIGN KEY (order_id) REFERENCES ORDER(id),
    FOREIGN KEY (user_id) REFERENCES USER(id),
    PRIMARY KEY (id)
)

-- create SHIPMENT table
CREATE TABLE SHIPMENT (
    id bigint,
    address varchar(255),
    zip_code bigint,
    order_id bigint,
    user_id bigint,
    payment_id bigint,
    delivery_date datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES ORDER(id),
    FOREIGN KEY (user_id) REFERENCES USER(id),
    FOREIGN KEY (payment_id) REFERENCES PAYMENT(id),
    PRIMARY KEY (id)
)

-- create FEEDBACK table 
CREATE TABLE FEEDBACK (
    id int,
     user_id bigint,
    order_id bigint,
    order_p-id bigint
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USER(id),
    FOREIGN KEY (order_id) REFERENCES ORDER(id),
    FOREIGN KEY (order_P-id) REFERENCES ORDERED_PRODUCT(id),
    PRIMARY KEY (id)
)


-- insert into entities
insert into USER 
(id, name, email,phone_number) 
values (1, 'Cosmas', 'name@gmail.com', '+234....')

insert into PRODUCT 
(id, name, size, price) 
values (2, 'prada cleo', 'medium', 5.00)


insert into ORDER
(id, amount, product_id, quantity) 
values (3, 450.65, 2, 1)


-- selecting from entities
select name,size,price from PRODUCT
select name,email,phone_number from USER
select * from ORDER

-- updating entities
update PRODUCT 
set name = 'prada galleria' 
where id = 2

update ORDER 
set amount= 250.65 
where id = 3


-- deleting entities
delete from PRODUCT
where id = 2

delete from USER
where id = 1
