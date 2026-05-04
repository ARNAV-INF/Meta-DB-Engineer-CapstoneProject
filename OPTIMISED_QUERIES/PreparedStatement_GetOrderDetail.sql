PREPARE GetOrderDetail from "select orderid, quantity, totalcost from orders where orderid = ?";
set @id = 1;
execute GetOrderDetail using @id;

