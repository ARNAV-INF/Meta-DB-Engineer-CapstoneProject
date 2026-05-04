use little_lemon_db;
drop procedure if exists CancelOrder;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS CancelOrder(ID int)
BEGIN
delete from orders where OrderID = ID;
select concat('Order ',ID,' is deleted') as "Confirmation";
END
//
call CancelOrder(5);