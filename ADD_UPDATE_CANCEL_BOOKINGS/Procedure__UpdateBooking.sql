use little_lemon_db;
drop procedure if exists UpdateBooking;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS UpdateBooking(in BookID int, in date_booking date)
BEGIN
UPDATE Bookings
SET BookingDate = date_booking
WHERE BookingID = BookID;
SELECT CONCAT('Booking ',BookID,' updated') as "Confirmation";
END
//
DELIMITER ;
CALL UpdateBooking(9,"2022-12-17");