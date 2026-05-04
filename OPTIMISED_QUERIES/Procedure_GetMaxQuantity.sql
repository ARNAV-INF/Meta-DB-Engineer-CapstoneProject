DELIMITER //
CREATE PROCEDURE IF NOT EXISTS GetMaxQuantity()
BEGIN
SELECT Quantity as "Max Quantity in Order" from Orders
where Quantity = (select max(quantity) from orders);
END
//
DELIMITER ;
CALL GetMaxQuantity();