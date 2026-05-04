USE little_lemon_db;
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN book_date DATE, IN table_no INT)
BEGIN
DECLARE booking_count INT;
SELECT COUNT(*) 
INTO booking_count 
FROM Bookings 
WHERE BookingDate = book_date AND TableNumber = table_no;
IF booking_count > 0 THEN
SELECT CONCAT('Table ', table_no, ' is already booked') AS 'Booking status';
ELSE
SELECT CONCAT('Table ', table_no, ' is available') AS 'Booking status';
END IF;
END //
DELIMITER ;
call CheckBooking("2022-11-12",3);