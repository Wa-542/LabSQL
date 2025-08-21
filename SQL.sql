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

--• ต้องการ รหัสพนักงาน ชื่อพนักงาน จ านวนใบสั่งซื้อที่เกี่ยวข้อง ผลรวมของค่าขนส่งในปี 1998

select e.EmployeeID, FirstName , count(*) as [จ านวน order]
       , sum(freight) as [Sum of Freight]
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(orderdate) = 1998
group by e.EmployeeID, FirstName

--ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
SELECT 
    s.CompanyName AS ชื่อบริษัทขนส่ง,
    COUNT(o.OrderID) AS จำนวนใบสั่งซื้อ
FROM Shippers s
JOIN Orders o ON s.ShipperID = o.ShipVia
GROUP BY s.CompanyName;


--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขาย
SELECT 
    p.ProductID AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า,
    SUM(od.Quantity) AS จำนวนทั้งหมดที่ขาย
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName;

--ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินค้า
SELECT 
    p.ProductID AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า,
    SUM(od.Quantity) AS จำนวนทั้งหมดที่ขาย
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE e.FirstName = 'Nancy'
GROUP BY p.ProductID, p.ProductName
ORDER BY p.ProductID;

--ต้องการชื่อบริษัทลูกค้า Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
SELECT DISTINCT 
    s.Country AS ประเทศที่ซื้อสินค้า
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE c.CompanyName = 'Around the Horn';

--บริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าอะไรบ้าง จำนวนเท่าใด
SELECT 
    p.ProductID AS รหัสสินค้า,
    p.ProductName AS ชื่อสินค้า,
    SUM(od.Quantity) AS จำนวนสินค้า
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE c.CompanyName = 'Around the Horn'
GROUP BY p.ProductID, p.ProductName

--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
SELECT 
    o.OrderID AS หมายเลขใบสั่งซื้อ,
    (e.FirstName + ' ' + e.LastName) AS ชื่อพนักงาน,
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS ยอดขายรวม
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.OrderID, e.FirstName, e.LastName
ORDER BY o.OrderID;



