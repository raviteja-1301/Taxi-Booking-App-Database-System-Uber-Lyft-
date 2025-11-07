/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

-- Create the Final_project database
CREATE DATABASE Final_project_Team74;
----------------------------------------------------------------------------
-- Use the Final_project database
USE Final_project_Team74;
---------------------------------------------------------------------------------

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
-- Create Users Table
CREATE TABLE Users (
    user_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    dob DATE NULL,
    address TEXT NULL,
    registration_date DATE NOT NULL
);

-- Create Vehicles Table
CREATE TABLE Vehicles (
    vehicle_id INT NOT NULL PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    license_plate VARCHAR(20) NOT NULL UNIQUE,
    capacity INT NOT NULL
);

-- Create Drivers Table 
CREATE TABLE Drivers (
    driver_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    license_number VARCHAR(20) NOT NULL UNIQUE,
    vehicle_id INT UNIQUE, 
    phone VARCHAR(15) NOT NULL,
    dob DATE NULL,
    rating FLOAT NULL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id) 
);

-- Create Trips Table 
CREATE TABLE Trips (
    trip_id INT NOT NULL,
    user_id INT NOT NULL,
    driver_id INT NOT NULL,
    pickup_location TEXT NOT NULL,
    dropoff_location TEXT NOT NULL,
    trip_date DATETIME NOT NULL,
    fare DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    PRIMARY KEY (trip_id, user_id), -- Composite Primary Key
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Create Payments Table 
CREATE TABLE Payments (
    payment_id INT NOT NULL,
    trip_id INT NOT NULL,
    user_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    method VARCHAR(20) NOT NULL,
    PRIMARY KEY (payment_id, trip_id), -- Composite Primary Key
    FOREIGN KEY (trip_id, user_id) REFERENCES Trips(trip_id, user_id)
);

-- Create Feedback Table 
CREATE TABLE Feedback (
    feedback_id INT NOT NULL,
    trip_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL,
    comments TEXT NULL,
    PRIMARY KEY (feedback_id, trip_id), -- Composite Primary Key
    FOREIGN KEY (trip_id, user_id) REFERENCES Trips(trip_id, user_id)
);

------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

--Populating Users table
INSERT INTO Users (user_id, name, email, phone, dob, address, registration_date)
VALUES
(1, 'Rajesh Sharma', 'rajeshsharma@google.com', '9876543210', '1985-01-15', 'Delhi, India', '2023-01-01'),
(2, 'Priya Singh', 'priyasingh@outlook.com', '9876543211', '1990-05-20', 'Mumbai, Maharashtra', '2023-02-15'),
(3, 'Anil Kumar', 'anilkumar@outlook.com', '9876543212', '1982-11-10', 'Kolkata, West Bengal', '2023-03-10'),
(4, 'Meena Joshi', 'meenajoshi@google.com', '9876543213', '1993-07-25', 'Bangalore, Karnataka', '2023-04-05'),
(5, 'Vikram Mehta', 'vikrammehta@outlook.com', '9876543214', '1987-03-18', 'Hyderabad, Telangana', '2023-05-12'),
(6, 'Deepa Reddy', 'deepareddy@google.com', '9876543215', '1995-06-30', 'Chennai, Tamil Nadu', '2023-06-25'),
(7, 'Amit Khanna', 'amitkhanna@outlook.com', '9876543216', '1992-09-10', 'Jaipur, Rajasthan', '2023-07-15'),
(8, 'Sneha Nair', 'snehanair@outlook.com', '9876543217', '1988-12-22', 'Thiruvananthapuram, Kerala', '2023-08-18'),
(9, 'Ravi Gupta', 'ravigupta@guptha.com', '9876543218', '1991-04-05', 'Lucknow, Uttar Pradesh', '2023-09-10'),
(10, 'Sunita Desai', 'sunitadesai@google.com', '9876543219', '1994-02-14', 'Pune, Maharashtra', '2023-10-01');

--Populating Vehicles table
INSERT INTO Vehicles (vehicle_id, model, license_plate, capacity)
VALUES
(1, 'Hyundai i20', 'DL01AB1234', 4),
(2, 'Maruti Swift', 'MH02CD5678', 4),
(3, 'Toyota Innova', 'WB03EF9012', 7),
(4, 'Honda City', 'KA04GH3456', 4),
(5, 'Tata Nexon', 'TS05IJ7890', 5),
(6, 'Mahindra XUV500', 'TN06KL1234', 7),
(7, 'Kia Seltos', 'RJ07MN5678', 5),
(8, 'Renault Duster', 'KL08OP9012', 5),
(9, 'Ford EcoSport', 'UP09QR3456', 5),
(10, 'Volkswagen Polo', 'MH10ST7890', 4);

--Populating Drivers table
INSERT INTO Drivers (driver_id, name, license_number, vehicle_id, phone, dob, rating)
VALUES
(1, 'Manoj Pandey', 'DL0123456789', 1, '9876543201', '1980-02-14', 4.5),
(2, 'Ajay Verma', 'MH0234567890', 2, '9876543202', '1985-06-19', 4.2),
(3, 'Kishore Kumar', 'WB0345678901', 3, '9876543203', '1990-01-10', 4.7),
(4, 'Rakesh Jha', 'KA0456789012', 4, '9876543204', '1987-11-05', 4.1),
(5, 'Sameer Patil', 'TS0567890123', 5, '9876543205', '1982-08-22', 4.6),
(6, 'Santosh Reddy', 'TN0678901234', 6, '9876543206', '1993-09-12', 4.3),
(7, 'Narendra Tiwari', 'RJ0789012345', 7, '9876543207', '1988-04-15', 4.8),
(8, 'Ashok Nair', 'KL0890123456', 8, '9876543208', '1989-07-19', 4.4),
(9, 'Deepak Gupta', 'UP0901234567', 9, '9876543209', '1995-03-18', 4.5),
(10, 'Pankaj Deshmukh', 'MH1012345678', 10, '9876543210', '1992-12-25', 4.3);

--Populating Trips table
INSERT INTO Trips (trip_id, user_id, driver_id, pickup_location, dropoff_location, trip_date, fare, status)
VALUES
(1, 1, 1, 'Connaught Place, Delhi', 'Karol Bagh, Delhi', '2023-01-01 10:00:00', 200.00, 'Completed'),
(2, 2, 2, 'Andheri, Mumbai', 'Bandra, Mumbai', '2023-02-15 11:30:00', 250.00, 'Completed'),
(3, 3, 3, 'Salt Lake, Kolkata', 'Park Street, Kolkata', '2023-03-10 18:45:00', 300.00, 'Completed'),
(4, 4, 4, 'MG Road, Bangalore', 'Whitefield, Bangalore', '2023-04-05 08:30:00', 400.00, 'Completed'),
(5, 5, 5, 'Begumpet, Hyderabad', 'Hitech City, Hyderabad', '2023-05-12 14:20:00', 350.00, 'Completed'),
(6, 6, 6, 'Anna Nagar, Chennai', 'T Nagar, Chennai', '2023-06-25 10:15:00', 275.00, 'Completed'),
(7, 7, 7, 'Malviya Nagar, Jaipur', 'Amer Fort, Jaipur', '2023-07-15 12:10:00', 220.00, 'Completed'),
(8, 8, 8, 'Kovalam Beach, Kerala', 'Technopark, Trivandrum', '2023-08-18 16:50:00', 310.00, 'Completed'),
(9, 9, 9, 'Hazratganj, Lucknow', 'Charbagh, Lucknow', '2023-09-10 19:40:00', 180.00, 'Completed'),
(10, 10, 10, 'Kothrud, Pune', 'Viman Nagar, Pune', '2023-10-15 14:00:00', 300.00, 'Completed'),
(11, 1, 2, 'Delhi Cantt, Delhi', 'RK Puram, Delhi', '2023-11-01 09:10:00', 250.00, 'Completed'),
(12, 2, 3, 'Bandra West, Mumbai', 'Goregaon, Mumbai', '2023-12-02 18:00:00', 280.00, 'Completed'),
(13, 3, 4, 'Howrah, Kolkata', 'Esplanade, Kolkata', '2024-12-03 07:50:00', 260.00, 'Completed'),
(14, 4, 5, 'Koramangala, Bangalore', 'Indiranagar, Bangalore', '2024-02-04 14:45:00', 330.00, 'Completed'),
(15, 5, 6, 'Gachibowli, Hyderabad', 'Secunderabad, Hyderabad', '2024-03-05 17:20:00', 450.00, 'Completed'),
(16, 6, 7, 'Adyar, Chennai', 'Velachery, Chennai', '2023-06-25 10:45:00', 275.00, 'Completed'),
(17, 7, 8, 'Mansarovar, Jaipur', 'City Palace, Jaipur', '2023-07-20 11:30:00', 300.00, 'Completed'),
(18, 8, 9, 'Cochin Port, Kerala', 'Fort Kochi, Kerala', '2023-08-18 19:20:00', 260.00, 'Completed'),
(19, 9, 10, 'Gomti Nagar, Lucknow', 'Alambagh, Lucknow', '2023-09-12 18:40:00', 280.00, 'Completed'),
(20, 10, 1, 'Aundh, Pune', 'Hadapsar, Pune', '2023-10-20 16:10:00', 350.00, 'Completed'),
(21, 1, 3, 'Andheri East, Mumbai', 'Worli, Mumbai', '2023-11-05 09:50:00', 275.00, 'Completed'),
(22, 2, 5, 'Whitefield, Bangalore', 'HSR Layout, Bangalore', '2023-12-10 19:15:00', 400.00, 'Completed'),
(23, 3, 7, 'Dumdum, Kolkata', 'Park Street, Kolkata', '2024-11-11 06:45:00', 300.00, 'Completed'),
(24, 4, 9, 'Jubilee Hills, Hyderabad', 'Hitech City, Hyderabad', '2024-02-22 13:00:00', 320.00, 'Completed'),
(25, 5, 2, 'T Nagar, Chennai', 'Besant Nagar, Chennai', '2023-06-25 15:00:00', 290.00, 'Completed'),
(26, 6, 4, 'Amer Fort, Jaipur', 'Johri Bazaar, Jaipur', '2023-07-20 13:40:00', 240.00, 'Completed'),
(27, 7, 6, 'Alleppey, Kerala', 'Ernakulam, Kerala', '2023-08-20 20:30:00', 310.00, 'Completed'),
(28, 8, 8, 'Hazratganj, Lucknow', 'Aminabad, Lucknow', '2023-09-25 16:20:00', 200.00, 'Completed'),
(29, 9, 10, 'Baner, Pune', 'Kharadi, Pune', '2023-10-30 14:15:00', 320.00, 'Completed'),
(30, 10, 1, 'Delhi University, Delhi', 'AIIMS, Delhi', '2023-11-01 18:40:00', 350.00, 'Completed'),
(31, 1, 2, 'Goregaon, Mumbai', 'Khar, Mumbai', '2023-12-05 09:00:00', 280.00, 'Completed'),
(32, 2, 4, 'Salt Lake, Kolkata', 'Sealdah, Kolkata', '2024-10-08 10:20:00', 260.00, 'Completed'),
(33, 3, 6, 'Kothrud, Pune', 'Kalyani Nagar, Pune', '2024-09-05 12:30:00', 275.00, 'Completed'),
(34, 4, 8, 'MG Road, Bangalore', 'Electronic City, Bangalore', '2024-03-12 11:00:00', 390.00, 'Completed'),
(35, 5, 10, 'Adyar, Chennai', 'Anna Nagar, Chennai', '2024-08-20 18:45:00', 320.00, 'Completed');

--Populating Payments table
INSERT INTO Payments (payment_id, trip_id, user_id, payment_date, amount, method)
VALUES
(1, 1, 1, '2023-01-01 10:30:00', 200.00, 'UPI'),
(2, 2, 2, '2023-02-15 12:00:00', 250.00, 'Credit Card'),
(3, 3, 3, '2023-03-10 19:00:00', 300.00, 'Cash'),
(4, 4, 4, '2023-04-05 09:00:00', 400.00, 'Debit Card'),
(5, 5, 5, '2023-05-12 14:50:00', 350.00, 'Net Banking'),
(6, 6, 6, '2023-06-25 10:45:00', 275.00, 'UPI'),
(7, 7, 7, '2023-07-15 12:40:00', 220.00, 'Cash'),
(8, 8, 8, '2023-08-18 17:10:00', 310.00, 'UPI'),
(9, 9, 9, '2023-09-10 20:00:00', 180.00, 'Credit Card'),
(10, 10, 10, '2023-10-15 14:30:00', 300.00, 'Debit Card'),
(11, 11, 1, '2023-11-01 10:00:00', 250.00, 'UPI'),
(12, 12, 2, '2023-12-02 18:30:00', 280.00, 'Cash'),
(13, 13, 3, '2024-01-03 08:00:00', 260.00, 'Net Banking'),
(14, 14, 4, '2024-02-04 15:15:00', 330.00, 'Credit Card'),
(15, 15, 5, '2024-03-05 17:40:00', 450.00, 'UPI'),
(16, 16, 6, '2023-06-25 11:00:00', 275.00, 'Debit Card'),
(17, 17, 7, '2023-07-20 11:50:00', 300.00, 'UPI'),
(18, 18, 8, '2023-08-18 19:30:00', 260.00, 'Net Banking'),
(19, 19, 9, '2023-09-12 19:00:00', 280.00, 'Cash'),
(20, 20, 10, '2023-10-20 16:30:00', 350.00, 'UPI'),
(21, 21, 1, '2023-11-05 10:15:00', 275.00, 'Debit Card'),
(22, 22, 2, '2023-12-10 19:45:00', 400.00, 'UPI'),
(23, 23, 3, '2024-01-11 07:00:00', 300.00, 'Credit Card'),
(24, 24, 4, '2024-02-22 13:30:00', 320.00, 'Net Banking'),
(25, 25, 5, '2023-06-25 15:20:00', 290.00, 'UPI'),
(26, 26, 6, '2023-07-20 14:00:00', 240.00, 'Cash'),
(27, 27, 7, '2023-08-20 20:50:00', 310.00, 'Debit Card'),
(28, 28, 8, '2023-09-25 16:40:00', 200.00, 'Net Banking'),
(29, 29, 9, '2023-10-30 14:40:00', 320.00, 'UPI'),
(30, 30, 10, '2023-11-01 19:00:00', 350.00, 'Credit Card'),
(31, 31, 1, '2023-12-05 09:30:00', 280.00, 'UPI'),
(32, 32, 2, '2024-01-08 10:40:00', 260.00, 'Cash'),
(33, 33, 3, '2024-02-05 13:00:00', 275.00, 'Net Banking'),
(34, 34, 4, '2024-03-12 11:20:00', 390.00, 'Debit Card'),
(35, 35, 5, '2024-03-20 18:45:00', 320.00, 'Net Banking');

--Populating Feedback table
INSERT INTO Feedback (feedback_id, trip_id, user_id, rating, comments)
VALUES
(1, 1, 1, 5, 'Excellent service, driver was very polite.'),
(2, 2, 2, 4, 'Good ride but the driver arrived slightly late.'),
(3, 3, 3, 5, 'The car was clean and the ride was smooth.'),
(4, 4, 4, 2, 'The vehicle was not very clean, but the driver was nice.'),
(5, 5, 5, 4, 'Good service overall, but fare was slightly high.'),
(6, 6, 6, 5, 'Driver was punctual and polite, great experience.'),
(7, 7, 7, 5, 'Excellent! Will use the service again.'),
(8, 8, 8, 4, 'Good trip, but AC was not working well.'),
(9, 9, 9, 3, 'Driver was not very polite, but got me there on time.'),
(10, 10, 10, 5, 'Perfect ride, no issues at all.'),
(11, 11, 1, 2, 'The car could have been cleaner, but the trip was fine.'),
(12, 12, 2, 5, 'Driver was very professional and punctual.'),
(13, 13, 3, 4, 'The trip was good, but the fare was a bit high.'),
(14, 14, 4, 5, 'Excellent experience, driver was very polite.'),
(15, 15, 5, 4, 'Good service, but the AC was a little weak.'),
(16, 16, 6, 5, 'Great service, everything was perfect.'),
(17, 17, 7, 4, 'The car had some odor, but overall a good ride.'),
(18, 18, 8, 5, 'Fantastic ride, will definitely recommend.'),
(19, 19, 9, 1, 'The driver was a bit rude, but got me to my destination.'),
(20, 20, 10, 5, 'Very smooth ride, great driver.'),
(21, 21, 1, 5, 'The driver was very friendly and helpful.'),
(22, 22, 2, 4, 'Trip was good, but the fare was a bit too high.'),
(23, 23, 3, 5, 'Clean car and polite driver, excellent experience.'),
(24, 24, 4, 4, 'Overall good, but the driver took a longer route.'),
(25, 25, 5, 5, 'Wonderful experience, driver was excellent.'),
(26, 26, 6, 2, 'The car had a minor issue, but it didn’t affect the trip.'),
(27, 27, 7, 5, 'Perfect trip, driver was very professional.'),
(28, 28, 8, 4, 'Ride was comfortable, but the fare was slightly high.'),
(29, 29, 9, 3, 'The driver was late, but the ride was fine.'),
(30, 30, 10, 5, 'Very nice experience, highly recommend this service.'),
(31, 31, 1, 4, 'The car was good, but the driver was a bit unfriendly.'),
(32, 32, 2, 5, 'Perfect trip, no issues at all.'),
(33, 33, 3, 1, 'The driver was nice, but the AC was not working.'),
(34, 34, 4, 5, 'Amazing experience, driver was very courteous.'),
(35, 35, 5, 2, 'Good trip, but the car was not very clean.');
--------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

-- Show all tables data
SELECT * FROM Users;

SELECT * FROM Vehicles;

SELECT * FROM Drivers;

SELECT * FROM Trips;

SELECT * FROM Payments;

SELECT * FROM Feedback;

----------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

---Create three queries and convert them into views. Explain why you think would be
---useful to the user. All queries must be joined to one or more tables. Make sure you restrict the 
---data by using a where clause for each of the queries. 

--- veiw 1: View for Active Users' Trip Details

CREATE VIEW Active_Users_Trip_Details AS
SELECT 
    u.name AS user_name,
    d.name AS driver_name,
    t.pickup_location,
    t.dropoff_location,
    t.trip_date,
    t.fare,
    p.method AS payment_method
FROM 
    Trips t
JOIN Users u ON t.user_id = u.user_id
JOIN Drivers d ON t.driver_id = d.driver_id
JOIN Payments p ON t.trip_id = p.trip_id AND t.user_id = p.user_id
WHERE 
    t.trip_date >= DATEADD(MONTH, -6, GETDATE());

---view 2: View for High-Rated Drivers

CREATE VIEW High_Rated_Drivers AS
SELECT 
    d.name AS driver_name,
    v.model AS vehicle_model,
    COUNT(t.trip_id) AS total_trips,
    d.rating
FROM 
    Drivers d
JOIN Vehicles v ON d.vehicle_id = v.vehicle_id
JOIN Trips t ON d.driver_id = t.driver_id
WHERE 
    d.rating >= 4
    AND t.trip_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY 
    d.name, v.model, d.rating, d.driver_id;

---view 3: View for Feedback Analysis

CREATE VIEW Negative_Feedback_Analysis AS
SELECT 
    u.name AS user_name,
    d.name AS driver_name,
    t.trip_date,
    f.rating AS feedback_rating,
    f.comments
FROM 
    Feedback f
JOIN Trips t ON f.trip_id = t.trip_id AND f.user_id = t.user_id
JOIN Users u ON t.user_id = u.user_id
JOIN Drivers d ON t.driver_id = d.driver_id
WHERE 
    f.rating <= 3;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
----------Displaying Views created
SELECT *
FROM Active_Users_Trip_Details
ORDER BY trip_date DESC;

SELECT *
FROM High_Rated_Drivers

SELECT *
FROM Negative_Feedback_Analysis
ORDER BY trip_date DESC;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Droping Views
DROP VIEW Active_Users_Trip_Details;
DROP VIEW High_Rated_Drivers;
DROP VIEW Negative_Feedback_Analysis;

----------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Create an audit table for one of the lookup tables and demonstrate data saved to that audit table when data in 
--the original table is inserted, modified, or deleted. Include an additional column in the audit table that will 
--have a datetime field when the data was changed in the original table. Include the script to test all the operations.

--Audit Table
CREATE TABLE Vehicle_Audit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY, 
    vehicle_id INT NOT NULL,
    model VARCHAR(50),
    license_plate VARCHAR(20),
    capacity INT,
    operation_type VARCHAR(10),
    operation_timestamp DATETIME NOT NULL
);


/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Insert Trigger
CREATE TRIGGER after_vehicle_insert
ON Vehicles
AFTER INSERT
AS
BEGIN
    INSERT INTO Vehicle_Audit (vehicle_id, model, license_plate, capacity, operation_type, operation_timestamp)
    SELECT vehicle_id, model, license_plate, capacity, 'INSERT', GETDATE()
    FROM inserted;
END;
GO

--Update Trigger
CREATE TRIGGER after_vehicle_update
ON Vehicles
AFTER UPDATE
AS
BEGIN
    INSERT INTO Vehicle_Audit (vehicle_id, model, license_plate, capacity, operation_type, operation_timestamp)
    SELECT vehicle_id, model, license_plate, capacity, 'UPDATE', GETDATE()
    FROM inserted;
END;
GO

--Delete Trigger
CREATE TRIGGER after_vehicle_delete
ON Vehicles
AFTER DELETE
AS
BEGIN
    INSERT INTO Vehicle_Audit (vehicle_id, model, license_plate, capacity, operation_type, operation_timestamp)
    SELECT vehicle_id, model, license_plate, capacity, 'DELETE', GETDATE()
    FROM deleted;
END;
GO

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Test
--Insert
INSERT INTO Vehicles (vehicle_id, model, license_plate, capacity)
VALUES (11, 'Suzuki Baleno', 'DL11XY1234', 5);
--Update
UPDATE Vehicles
SET model = 'Suzuki Swift'
WHERE vehicle_id = 11;
--Delete
DELETE FROM Vehicles
WHERE vehicle_id = 11;

--Verify
SELECT * FROM Vehicle_Audit;

------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

--Demonstrate a use of the one stored procedures and User Defined Function (UDF) for
--your database. Include create and drop scripts

--Stored Procedure: Fetch Trip Details by User ID
CREATE PROCEDURE GetTripsByUser
    @user_id_param INT -- Declare parameter with @ symbol
AS
BEGIN
    SELECT t.trip_id, 
           t.pickup_location, 
           t.dropoff_location, 
           t.trip_date, 
           t.fare, 
           t.status, 
           d.name AS driver_name
    FROM Trips t
    INNER JOIN Drivers d ON t.driver_id = d.driver_id
    WHERE t.user_id = @user_id_param;
END;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Calling Stored Procedure
EXEC GetTripsByUser @user_id_param = 1;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--Droping Stored Procedure
DROP PROCEDURE GetTripsByUser;


/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
--User Defined Function (UDF): Calculate Average Rating for a Driver

CREATE FUNCTION GetDriverAverageRatingDetails(@driver_id_param INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        d.driver_id,
        d.name AS driver_name,
        AVG(f.rating) AS average_rating
    FROM Drivers d
    INNER JOIN Trips t ON d.driver_id = t.driver_id
    INNER JOIN Feedback f ON t.trip_id = f.trip_id
    WHERE d.driver_id = @driver_id_param
    GROUP BY d.driver_id, d.name
);


/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
-- calculating the average rating
SELECT * FROM dbo.GetDriverAverageRatingDetails(1);

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
-- Droping Function
DROP FUNCTION GetDriverAverageRatingDetails;

-----------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

--Demonstrate the use of one cursor for your database. Create and drop script for cursor

-- Declare and use a cursor in SQL Server
CREATE PROCEDURE ProcessUserDetails
AS
BEGIN
    -- Declare a cursor
    DECLARE user_cursor CURSOR FOR 
    SELECT user_id, name, email FROM Users;

    -- Declare variables to hold data fetched by the cursor
    DECLARE @current_user_id INT;
    DECLARE @current_name NVARCHAR(100);
    DECLARE @current_email NVARCHAR(100);

    -- Open the cursor
    OPEN user_cursor;

    -- Fetch the first row from the cursor
    FETCH NEXT FROM user_cursor INTO @current_user_id, @current_name, @current_email;

    -- Loop through the rows fetched by the cursor
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Print or process each row
        PRINT 'User ID: ' + CAST(@current_user_id AS NVARCHAR) + 
              ', Name: ' + @current_name + 
              ', Email: ' + @current_email;

        -- Fetch the next row
        FETCH NEXT FROM user_cursor INTO @current_user_id, @current_name, @current_email;
    END;

    -- Close and deallocate the cursor
    CLOSE user_cursor;
    DEALLOCATE user_cursor;
END;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
-- Execute the procedure to process user details
EXEC ProcessUserDetails;

/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/
-- Drop the procedure once it's no longer needed
DROP PROCEDURE ProcessUserDetails;





------------------------------------------------------------------------------------------------------------------
/*
Team - 74
Raviteja Buchaiahgari and Sanjay Pulluri
Final Project: Taxi Booking App (like Uber or Lyft).
Date: 06/12/2024
*/

-- Drop Feedback Table
DROP TABLE Feedback;

-- Drop Payments Table
DROP TABLE Payments;

-- Drop Trips Table
DROP TABLE Trips;

-- Drop Drivers Table
DROP TABLE Drivers;

-- Drop Vehicles Table
DROP TABLE Vehicles;

-- Drop Users Table
DROP TABLE Users;
--------------------------------------------------------------------------------------------------------------------------------