-- @BLOCK
CREATE DATABASE airbnb;
-- @BLOCK
CREATE TABLE Users(
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  bio TEXT,
  country VARCHAR(2)
);
-- @BLOCK
DROP TABLE Users2;
-- @BLOCK
INSERT INTO Users (email, bio, country)
VALUES (
    'chandler@gmail.com',
    'Can I be any funnier',
    'US'
  );
-- @BLOCK
-- Adding multiple values 
INSERT INTO Users(email, bio, country)
VALUES ('joey@gmail.com', 'How you doing ?', 'US'),
  (
    'jack@gmail.com',
    'Dont you dare read my bio',
    'UK'
  ),
  ('duke@gmail.com', 'Hey yo its duke', 'AU');
-- @BLOCK
SELECT *
FROM Users;
-- @BLOCK
-- Query with better filtering
SELECT email,
  bio,
  country
FROM Users
WHERE country = 'US';
-- @BLOCK
-- Limit clause
-- Query with better filtering
SELECT email,
  bio,
  country
FROM Users
WHERE country = 'US'
LIMIT 1;
-- @BLOCK
-- Oerder by clause
-- Query with better filtering
SELECT email,
  bio,
  country
FROM Users
WHERE country = 'US'
ORDER BY id DESC;
-- @BLOCK
-- Conditional AND 
-- Oerder by clause
-- Query with better filtering
SELECT email,
  id,
  country
FROM Users
WHERE country = 'US'
  AND id < 3
ORDER BY id DESC;
-- @BLOCK
-- Conditional AND 
-- Like clause
-- Oerder by clause
-- Query with better filtering
SELECT email,
  id,
  country
FROM Users
WHERE country = 'US'
  AND email LIKE 'c%'
ORDER BY id DESC;
-- @BLOCK 
-- Creating indexes
CREATE INDEX email_index ON Users(email);
-- @BLOCK Update column value
UPDATE Users
SET bio = 'How you doin ??'
WHERE id = 2;
-- @BLOCK Update column Value
ALTER TABLE Users
  RENAME COLUMN country TO country_code;
-- @BLOCK
-- Creating Relationships  between two tables
-- Foreign key reference will prevents the data from beign deleted which holds data about the relationship
-- So it becomes impossible to delete users who have an associated room at the same time
CREATE TABLE Rooms(
  id INT AUTO_INCREMENT,
  street VARCHAR(255),
  owner_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (owner_id) REFERENCES Users(id)
);
-- @BLOCK
-- Insert Single ROOM
INSERT INTO Rooms(owner_id, street)
VALUES (2, 'Madison Square garnder');
-- @BLOCK
-- Insert new rooms
INSERT INTO Rooms(owner_id, street)
VALUES (5, 'Park Avenue'),
  (5, 'Times square'),
  (5, 'Bolt street'),
  (5, 'Central Park');
-- @BLOCK
SELECT *
FROM Rooms;
-- JOINS --
-- @BLOCK
-- INNER JOIN
SELECT *
FROM Users
  INNER JOIN Rooms on Rooms.owner_id = Users.id;
-- @BLOCK
-- LEFT JOIN
SELECT *
FROM Users
  LEFT JOIN Rooms ON Rooms.owner_id = Users.id;
-- @BLOCK
-- RIGHT JOIN
SELECT *
FROM Users
  LEFT JOIN Rooms ON Rooms.owner_id = Users.id;
-- @BLOCK 
SELECT Users.id as user_id,
  Rooms.id as room_id,
  email,
  street
FROM Users
  LEFT JOIN Rooms ON Rooms.owner_id = Users.id;
-- @BLOCK Creating Booking table
-- User booking a Room from another user with the help of third intermediate table called bookings
-- Relation: user has booked many rooms or room has been booked by many users
CREATE TABLE Bookings(
  id INT AUTO_INCREMENT,
  guest_id INT NOT NULL,
  room_id INT NOT NULL,
  check_in DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (guest_id) REFERENCES Users(id),
  FOREIGN KEY (room_id) REFERENCES Rooms(id)
);
-- @BLOCK Add new Booking
INSERT INTO Bookings(guest_id, room_id, check_in)
VALUES();
-- @BLOCK Rooms a user has booked
SELECT guest_id,
  street,
  check_in
FROM Bookings
  INNER JOIN Rooms on Rooms.owner_id = guest_id
WHERE guest_id = 2;
-- @BLOCK Guest who stayed in a room
SELECT room_id,
  guest_id,
  email,
  bio
FROM Bookings
  INNER JOIN Users on Users.id = guest_id;
-- @BLOCK Drop databases
DROP DATABASE Dummy;