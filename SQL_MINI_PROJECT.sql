-- Create the Address table
CREATE TABLE Address5 (
    id INT PRIMARY KEY,
    address_1 VARCHAR(55),
    address_2 VARCHAR(55),
    city VARCHAR(15),
    state VARCHAR(15),
    zipcode VARCHAR(10),
    country VARCHAR(15)
);


-- Create the Hotel table
CREATE TABLE Hotel5 (
    Id INT PRIMARY KEY,
    name VARCHAR(25),
    number_of_rooms INT,
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address5(id)
);

-- Create the room_type table
CREATE TABLE room_type5 (
    id INT PRIMARY KEY,
    name VARCHAR(25),
    description CLOB,
    number_of_people INT
);

-- Create the Room table
CREATE TABLE Room5 (
    id INT PRIMARY KEY,
    room_number VARCHAR(10),
    hotel_id INT,
    price DECIMAL(10, 2),
    room_type_id INT,
    FOREIGN KEY (hotel_id) REFERENCES Hotel5(Id),
    FOREIGN KEY (room_type_id) REFERENCES room_type5(id)
);

-- Create the User table
CREATE TABLE user5 (
    id INT PRIMARY KEY,
    email VARCHAR(25),
    password VARCHAR(25),
    firstname VARCHAR(15),
    lastname VARCHAR(15)
);

-- Create the Booking table
CREATE TABLE Booking5 (
    id INT PRIMARY KEY,
    confirmation_number VARCHAR(20),
    user_id INT,
    check_in_date DATE,
    check_out_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES user5(id)
);

-- Create the room_booking table
CREATE TABLE room_booking5 (
    id INT PRIMARY KEY,
    booking_id INT,
    room_id INT,
    booked_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Booking5(id),
    FOREIGN KEY (room_id) REFERENCES Room5(id)
);

-- Create the Billing table
CREATE TABLE billing5 (
    id INT PRIMARY KEY,
    credit_card_id INT,
    amount DECIMAL(10, 2),
    status VARCHAR(20),
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES Booking5(id)
);

-- Insert data into the Address5 table
INSERT INTO Address5 (id, address_1, address_2, city, state, zipcode, country)
VALUES(1, '123 Main St', 'Apt 4B', 'Cityville', 'CA', '12345', 'USA');

INSERT INTO Address5 (id, address_1, address_2, city, state, zipcode, country)
VALUES(2, '456 Elm St', NULL, 'Townsville', 'NY', '54321', 'USA');

-- Insert data into the Hotel5 table
INSERT INTO Hotel5 (id, name, number_of_rooms, address_id)
VALUES(1, 'Luxury Inn', 100, 1);

INSERT INTO Hotel5 (id, name, number_of_rooms, address_id)
VALUES(2, 'Comfort Suites', 75, 2);

-- Insert data into the room_type5 table
INSERT INTO room_type5 (id, name, description, number_of_people)
VALUES(1, 'Single', 'A single bed room', 1);

INSERT INTO room_type5 (id, name, description, number_of_people)
VALUES(2, 'Double', 'A room with two beds', 2);

-- Insert data into the User5 table
INSERT INTO user5 (id, email, password, firstname, lastname)
VALUES(1, 'user1@example.com', 'password1', 'John', 'Doe');

INSERT INTO user5 (id, email, password, firstname, lastname)
VALUES(2, 'user2@example.com', 'password2', 'Jane', 'Smith');

-- Insert data into the Booking5 table
INSERT INTO Booking5 (id, confirmation_number, user_id, check_in_date, check_out_date, status)
VALUES (1, 'CONF123', 1, TO_DATE('15-NOV-23', 'DD-MON-YY'), TO_DATE('20-NOV-23', 'DD-MON-YY'), 'Confirmed');


INSERT INTO Booking5 (id, confirmation_number, user_id, check_in_date, check_out_date, status)
VALUES(2, 'CONF456', 2, TO_DATE('2023-12-10', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'Pending');
