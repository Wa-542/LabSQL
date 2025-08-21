--แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า
Select CategoryName, ProductName, UnitPrice
From Products as P, Categories as C
On P.CategoryID=C.CagetgoryID
