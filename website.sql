# Schema Definition
create schema website;
USE website;


#Table users
create table Users 
(
	User_id INT NOT NULL, 
    Username varchar(15) NOT NULL, 
    Passwords char not null,
    PRIMARY KEY (User_id, Username, Passwords)
);

#Table seller
create table Sellers
(
	Seller_id INT NOT NULL, 
    SName varchar(10) ,
    Address varchar(10),
    phone_number int not null,
    PRIMARY KEY (Seller_id), 

    FOREIGN KEY (Seller_id) References Users(User_id)
	ON UPDATE CASCADE On delete CASCADE
);


create table Product
(
	Product_id INT NOT NULL, 
    Colour char, 
    Size int,
    Cost int not null,
    Quantity int not null,
    Product_type char,
    Age_group char,
    Sells_by int,
    PRIMARY KEY (Product_id), 
    FOREIGN KEY (Sells_by) References Sellers(Seller_id)
    ON UPDATE CASCADE On delete restrict
);



create table Cart_Products
( 
    Date_added DATETIME,
    Quantity int not null,
    Purchase_status char,
    Has int not null,
    Add_to int not null,
    PRIMARY KEY (Has, Add_to),
    FOREIGN KEY (Add_to) References Product(Product_id)
    ON UPDATE CASCADE On delete restrict,
    
    FOREIGN KEY (Has) References Shopping_Cart(Cart_id)
    ON UPDATE CASCADE On delete restrict
);


create table Customers
(
	Customer_id INT NOT NULL, 
    CName varchar(10) not null,
    Address varchar(10),
    phone_number int not null,
    collects_in int not null,
    PRIMARY KEY (Customer_id),
    FOREIGN KEY (Customer_id) References Users(User_id)
    ON UPDATE CASCADE On delete CASCADE,
    FOREIGN KEY (collects_in) References Shopping_Cart(Cart_id)
    ON UPDATE CASCADE On delete CASCADE
);


create table Shopping_Cart 
(
	Cart_id INT NOT NULL, 
    PRIMARY KEY (Cart_id)
    
);


create table Payment
(
	Payment_id INT NOT NULL, 
    Total_amount INT NOT NULL, 
    Done_by INT NOT NULL, 
    Check_out INT NOT NULL, 
    Payment_date DATETIME,
    PRIMARY KEY (Payment_id), 
    FOREIGN KEY (Done_by) References Customers(Customer_id) 
    ON UPDATE CASCADE On delete restrict,
    
    FOREIGN KEY (Check_out) References Shopping_Cart(Cart_id)
    ON UPDATE CASCADE On delete restrict
);

#--------------------------------------------------------values insertion-----------------------------


INSERT into Users values
(1, 'lintaiqbal', 'lin12' ),
(2, 'maham06', 'mah34' ),
(3, 'ghazia_dua', 'gha56' ),
(4, 'muhammad_bin_iqbal', 'mbi78' );


INSERT into Sellers values
(1, 'linta', 'Multan', 03310177444),
(2, 'maham', 'lahore', 03006382278);


INSERT into Customers values
(3, 'ghazia_dua', 'karachi', 033912345, 1 ),
(4, 'muhammad_bin_iqbal', 'islamabad', 03457263471, 2);


INSERT into Shopping_Cart values
(001),
(002);

INSERT into Payment values
(01, 1000, 3, 001, 10-10-2001);

INSERT into Cart_Products values
(10-10-2001, 4, 'yes', 001, 5),
(09-10-2001, 5, 'no', 002, 5);

INSERT into Product values
(100, 'yellow', 5, 200, 4, 'small', '9', 1),
(101, 'red', 3, 400, 2, 'large', '3', 2);
