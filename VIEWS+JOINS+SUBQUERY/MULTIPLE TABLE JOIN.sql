use little_lemon_db;
CREATE VIEW CustomerDetailsView AS
select Customers.CustomerID, concat(Customers.FirstName,' ',Customers.LastName) as "FullName",
orders.OrderID, orders.TotalCost,
Menu.Category as "MenuName",
menuitems.ItemName, menuitems.ItemCategory
from customers inner join orders inner join menu inner join menuitems
on customers.customerid = orders.customerid and orders.menuid = menu.MenuID and menu.MenuItemsID = menuitems.MenuItemsID
where orders.TotalCost > 150 order by totalcost asc;
select * from CustomerDetailsView;
