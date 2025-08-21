--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select CategoryName, ProductName, UnitPrice
From Products as P, Categories as C
WHERE P.CategoryID = C.CategoryID
AND CategoryName = 'seafood'

--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select CategoryName, ProductName, UnitPrice
From Products as P, Categories as C
on  P.CategoryID = C.CategoryID
AND CategoryName = 'seafood'

--จงแสดงข้อมูลหมายเลขใบสั่งซื้อและชื่อบริษัทขนส่งสินค้า
--•Cartesian Product
SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia
--•Join Operator
SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID = Orders.Shipvia
