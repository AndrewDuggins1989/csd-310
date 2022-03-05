*
    Title: whatabook.init.sql
    Author: Andrew Duggins
    Date: 03/05/2022
    Description: WhatABook database initialization script.
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('4020 Yarbrough Ave Winston Salem NC, 27106');

/*
    insert book records 
*/
INSERT INTO book(book_name, author)
    VALUES('Scoundrel', 'Sarah Weinman');

INSERT INTO book(book_name, author)
    VALUES('The Invisible Kingdom', 'Meghan O Rourke');
    
INSERT INTO book(book_name, author)
	Values('True Story: What Reality TV Says About Us', 'Danielle J. Lindemann');

INSERT INTO book(book_name, author)
    VALUES('Anthem', 'Noah Hawley');

INSERT INTO book(book_name, author)
    VALUES('Ogla Dies Dreaming', 'Xochitl Gonzalez');

INSERT INTO book(book_name, author)
    VALUES('To Paradise', 'Hanya Yanagihara');

INSERT INTO book(book_name, author)
    VALUES('How Civil Wars Start', 'Barbara F. Walters');

INSERT INTO book(book_name, author)
    VALUES('How High in The Dark', 'Seqouia Nagamatsu');

INSERT INTO book(book_name, author)
    VALUES('Notes On an Execution', 'Dayna Kukafka');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Andrew', 'Duggins');

INSERT INTO user(first_name, last_name)
    VALUES('Brittany', 'Ferro');

INSERT INTO user(first_name, last_name)
    VALUES('Lylah', 'Duggins');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Andrew'), 
        (SELECT book_id FROM book WHERE book_name = 'Scoundrel')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Brittany'),
        (SELECT book_id FROM book WHERE book_name = 'Anthem')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Lylah'),
        (SELECT book_id FROM book WHERE book_name = 'To Paradise')
    );
