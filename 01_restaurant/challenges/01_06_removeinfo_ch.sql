-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT * FROM Customers WHERE FirstName = 'Norby';

SELECT * FROM Reservations WHERE CustomerID = 64 
ORDER BY Date DESC;

DELETE FROM Reservations WHERE ReservationID = 2000;

-- or soft delete:
UPDATE Reservations SET Date = NULL WHERE ReservationID = 2000;

-- better solution with a join to retrieve the reservation ID
SELECT * FROM Reservations
JOIN Customers ON Reservations.CustomerID = Customers.CustomerID
WHERE Customers.FirstName = 'Norby' AND Reservations.CustomerID = 64;