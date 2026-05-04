use little_lemon_db;
drop procedure if exists AddValidBooking;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS AddValidBooking(in bookdate date, in table_number int)
BEGIN
	DECLARE count_bookings int;
    START TRANSACTION;
	SELECT COUNT(*) into count_bookings
	from bookings where BookingDate = bookdate and TableNumber = table_number;

	IF count_bookings = 0 THEN
		INSERT INTO Bookings(BookingDate,TableNumber,CustomerID) VALUES(bookdate,table_number,1);
		SELECT CONCAT('Table ',table_number,' is now booked') as "Booking Status";
		COMMIT;

	ELSEIF count_bookings > 0 THEN
		ROLLBACK;
		SELECT CONCAT('Table ',table_number,' is already booked - booking cancelled') as "Booking Status";

	END IF;
END //
DELIMITER ;
CALL AddValidBooking("2022-10-10",5)