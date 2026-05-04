use little_lemon_db;
drop procedure if exists CancelBooking;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CancelBooking(in idBooking int)
BEGIN
DELETE FROM Bookings
WHERE BookingID = idBooking;
SELECT CONCAT('Booking ',idBooking,' cancelled') as "Confirmation";
END
//
DELIMITER ; 
CALL CancelBooking(9);