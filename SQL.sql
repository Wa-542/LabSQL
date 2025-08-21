--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select CategoryName, ProductName, UnitPrice
From Products as P, Categories as C
WHERE P.CategoryID = C.CategoryID
--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select CategoryName, ProductName,UnitPrice
From Products Join Categories
On Products.CategoryID=Categories.C.CategoryID
