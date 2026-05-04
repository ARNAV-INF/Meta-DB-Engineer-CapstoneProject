use little_lemon_db;
create view OrdersView as
SELECT OrderID, Quantity, TotalCost
from orders where Quantity > 2;
select * from OrdersView;