use little_lemon_db;
drop procedure if exists AddBooking;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS AddBooking(in bookid int, in bookingsdate date, in table_no int, in customer_id int)
BEGIN
INSERT INTO BOOKINGS VALUES(bookid, bookingsdate, table_no, customer_id);
SELECT CONCAT('New Booking Added') as "Confirmation";
END
//
DELIMITER ; 
CALL AddBooking(21,"2022-12-30",3,4);