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

--จงแสดงข้อมูลหมายเลขใบสั่งซื้อและชื่อบริษัทขนส่งสินค้าของใบสั่งซื้อหมายเลข 10275
--• Cartesian Product
SELECT CompanyName, OrderID
FROM Orders, Shippers
WHERE Shippers.ShipperID = Orders.Shipvia
AND OrderID = 10275
--• Join Operator
SELECT CompanyName, OrderID
FROM Orders JOIN Shippers
ON Shippers.ShipperID=Orders.Shipvia
WHERE OrderID=10275

--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ เอาสินค้าที่มาจาประเทศ USA,UK
SELECT 
    p.ProductID AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า,
    s.CompanyName AS บริษัทผู้จำหน่าย,
    s.Country AS ประเทศ
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
WHERE Country in ('usa','uk')
--ต้องการรหัสพนังงาน ชื่อพนักงาน รหัสใบสั่งซื้อืี่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
SELECT 
    e.EmployeeID AS รหัสพนักงาน,
    (e.FirstName + ' ' + e.LastName) AS ชื่อพนักงาน,
    o.OrderID AS รหัสใบสั่งซื้อ
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
ORDER BY e.EmployeeID;

--ต้องการรหัสสินค้า ชื่อสินค้า เมือง และประประเทศของบริษัทผู้จำหน่าย
SELECT 
    p.ProductID AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า,
    s.City AS เมือง,
    s.Country AS ประเทศ
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;

--จงแสดงหมายเลขใบสั่งซื้อ, ชื่อบริษัทลูกค้า,สถานที่ส่งของ, และพนักงานผู้ดูแล
--•Cartesian Product
SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
       E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O, Customers C, Employees E
WHERE O.CustomerID=C.CustomerID
    AND O.EmployeeID=E.EmployeeID
--•JOIN Operator
SELECT O.OrderID เลขใบสั่งซื้อ, C.CompanyName ลูกค้า,
       E.FirstName พนักงาน, O.ShipAddress ส่งไปที่
FROM Orders O
join Customers C on O.CustomerID=C.CustomerID

join Employees E on O.EmployeeID=E.EmployeeID
