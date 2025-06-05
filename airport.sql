-- Table for storing information about airports
CREATE TABLE Airport (
    AirportCode CHAR(3) PRIMARY KEY,
    AirportName VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Table for storing information about airlines
CREATE TABLE Airline (
    AirlineCode CHAR(2) PRIMARY KEY,
    AirlineName VARCHAR(255) NOT NULL
);

-- Table for storing information about flights
CREATE TABLE Flight (
    FlightNumber VARCHAR(10) PRIMARY KEY,
    DepartureAirportCode CHAR(3) REFERENCES Airport(AirportCode),
    DestinationAirportCode CHAR(3) REFERENCES Airport(AirportCode),
    DepartureTime DATETIME NOT NULL,
    ArrivalTime DATETIME NOT NULL,
    AirlineCode CHAR(2) REFERENCES Airline(AirlineCode),
    AvailableSeats INT NOT NULL,
    Fare DECIMAL(10, 2) NOT NULL
);

-- Table for storing information about passengers
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

-- Table for storing reservations
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    PassengerID INT REFERENCES Passenger(PassengerID),
    FlightNumber VARCHAR(10) REFERENCES Flight(FlightNumber),
    ReservationDate DATETIME NOT NULL
);
-- Insert values into Airport table
INSERT INTO Airport (AirportCode, AirportName, Location) VALUES
('JFK', 'John F. Kennedy International Airport', 'New York'),
('LAX', 'Los Angeles International Airport', 'Los Angeles'),
('ORD', 'O\'Hare International Airport', 'Chicago'),
('DFW', 'Dallas/Fort Worth International Airport', 'Dallas'),
('ATL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta'),
('LHR', 'London Heathrow Airport', 'London'),
('CDG', 'Charles de Gaulle Airport', 'Paris'),
('HND', 'Tokyo Haneda Airport', 'Tokyo'),
('PEK', 'Beijing Capital International Airport', 'Beijing'),
('SYD', 'Sydney Airport', 'Sydney');

-- Insert values into Airline table
INSERT INTO Airline (AirlineCode, AirlineName) VALUES
('AA', 'American Airlines'),
('UA', 'United Airlines'),
('DL', 'Delta Air Lines'),
('LH', 'Lufthansa'),
('AF', 'Air France'),
('JL', 'Japan Airlines'),
('CA', 'Air China'),
('BA', 'British Airways'),
('QF', 'Qantas'),
('EK', 'Emirates');

-- Insert values into Flight table
INSERT INTO Flight (FlightNumber, DepartureAirportCode, DestinationAirportCode, DepartureTime, ArrivalTime, AirlineCode, AvailableSeats, Fare) VALUES
('AA101', 'JFK', 'LAX', '2024-01-15 08:00:00', '2024-01-15 11:00:00', 'AA', 150, 350.00),
('UA202', 'LAX', 'ORD', '2024-01-15 12:00:00', '2024-01-15 18:00:00', 'UA', 200, 250.00),
('DL303', 'DFW', 'ATL', '2024-01-16 10:00:00', '2024-01-16 14:00:00', 'DL', 180, 300.00),
('LH404', 'LHR', 'CDG', '2024-01-16 15:00:00', '2024-01-16 17:00:00', 'LH', 220, 400.00),
('AF505', 'HND', 'PEK', '2024-01-17 08:00:00', '2024-01-17 12:00:00', 'AF', 170, 350.00),
('JL606', 'PEK', 'HND', '2024-01-17 14:00:00', '2024-01-17 18:00:00', 'JL', 190, 320.00),
('CA707', 'SYD', 'HND', '2024-01-18 09:00:00', '2024-01-18 14:00:00', 'CA', 160, 380.00),
('BA808', 'CDG', 'LHR', '2024-01-18 16:00:00', '2024-01-18 18:00:00', 'BA', 210, 420.00),
('QF909', 'SYD', 'LAX', '2024-01-19 11:00:00', '2024-01-19 17:00:00', 'QF', 180, 350.00),
('EK1010', 'JFK', 'DXB', '2024-01-19 18:00:00', '2024-01-20 10:00:00', 'EK', 250, 500.00);

-- Insert values into Passenger table
INSERT INTO Passenger (PassengerID, FirstName, LastName, Email) VALUES
(1, 'John', 'Doe', 'john.doe@email.com'),
(2, 'Jane', 'Smith', 'jane.smith@email.com'),
(3, 'Michael', 'Johnson', 'michael.johnson@email.com'),
(4, 'Emily', 'Williams', 'emily.williams@email.com'),
(5, 'David', 'Brown', 'david.brown@email.com'),
(6, 'Sophia', 'Jones', 'sophia.jones@email.com'),
(7, 'Matthew', 'Miller', 'matthew.miller@email.com'),
(8, 'Olivia', 'Davis', 'olivia.davis@email.com'),
(9, 'Daniel', 'Garcia', 'daniel.garcia@email.com'),
(10, 'Ava', 'Rodriguez', 'ava.rodriguez@email.com');

-- Insert values into Reservation table
INSERT INTO Reservation (ReservationID, PassengerID, FlightNumber, ReservationDate) VALUES
(1, 1, 'AA101', '2024-01-15 09:30:00'),
(2, 2, 'UA202', '2024-01-15 13:45:00'),
(3, 3, 'DL303', '2024-01-16 11:20:00'),
(4, 4, 'LH404', '2024-01-16 16:30:00'),
(5, 5, 'AF505', '2024-01-17 09:45:00'),
(6, 6, 'JL606', '2024-01-17 15:10:00'),
(7, 7, 'CA707', '2024-01-18 10:55:00'),
(8, 8, 'BA808', '2024-01-18 17:15:00'),
(9, 9, 'QF909', '2024-01-19 12:30:00'),
(10, 10, 'EK1010', '2024-01-19 19:00:00');
-- Query to retrieve all reservations for a specific passenger
SELECT Reservation.ReservationID, Passenger.FirstName, Passenger.LastName, Flight.FlightNumber, Flight.DepartureAirportCode, Flight.DestinationAirportCode, Flight.DepartureTime, Flight.ArrivalTime
FROM Reservation, Passenger, Flight
WHERE Reservation.PassengerID = Passenger.PassengerID
AND Reservation.FlightNumber = Flight.FlightNumber
AND Passenger.FirstName = 'John' AND Passenger.LastName = 'Doe';

-- Query to find available flights from one city to another on a specific date:
SELECT Flight.FlightNumber, Flight.DepartureAirportCode, Flight.DestinationAirportCode, Flight.DepartureTime, Flight.ArrivalTime, Flight.AvailableSeats, Flight.Fare
FROM Flight
WHERE Flight.DepartureAirportCode = 'JFK' AND Flight.DestinationAirportCode = 'LAX' AND Flight.DepartureTime > '2024-01-15 12:00:00'
ORDER BY Flight.DepartureTime;
