-- 67040233103 นางาสวสิริสกุล คงคะรัศมี

-- sub Query 
-- 1 หาตำเเกน่ง ของ Nany ก่อน
 select title from Employees where FirstName = 'nacy'

 --ต้องการหาข้อมูลที่มีตำเเหน่งเดียวกับข้อ1
 select *
 from Employees
 where Title = (select title from Employees where FirstName = 'nacy')
 --ต้องการหาชื่อนามสกุลพนังงาน
 select FirstName , Lastname from Employees
 where BirthDate = (select min(BirthDate) from Employees)


 --ต้องการหาชื่่อสินค้ามากกว่าสินค้า Ikura
 select ProductName
 from Products 
 where UnitPrice > (select UnitPrice from Products
                     where ProductName =' Ikura')
 --ต้องการชื่่อบริบัทลูกค้าที่อยู่เมื่องเดียวกะบริษัทชื่อ thomas hardy
 select CompanyName from Customers 
 where City = (select City from Customers where CompanyName = 'Around the Horn')


 --ต้องการชื่่อสินค้าใบสั่งซื้อรายการเรก ในปี 1998
 
 select  * from Orders
 where OrderDate = (select min(OrderDate)from Orders
                    where year(OrderDate)=1998)

--ต้องการชื่่อนามสกุลพนักงานที่เข้างานคนล่าสุด
select FirstName, LastName
from Employees
where HireDate= (select max(HireDate)from Employees)

--ข้อมูลใบสั้งซื้อที่ถูกส่งไปประเทศที่ไม่ม่ลูกค้าตั้งอยู่
select* from Orders
where ShipCountry in (select distinct country from Suppliers)

--ต้องการข้อมูลสินค้าน้อยกว่า 50$

select top 10 ROW_NUMBER() OVER ( ORDER BY UnitPrice desc) as RowNum,
ProductID, ProductName ,UnitPrice
from Products
where UnitPrice <50


--ค่ำสั้ง DML (Insert update Delete)
select * from Shippers
--ตาราง มี pk  เป็น AutoIncrement (AutoNumber)
Insert into Shippers
values ('บริษัทขนส่ง เยอะจำกัด', '081-1234567')


Insert into Shippers(CompanyName)
values ('บริษัทขนมมหาศาลจำกัด')

select * from Customers


Insert into Customers(CustomerID,CompanyName,Phone)
values ('UDRU1','บริษัทซื้อ เยอะจำกัด','089-123456')

-- คำสั้ง updata
UPDATE Shippers set Phone = '0123456789' 
where CompanyName = 'บริษัทขนส่ง เยอะจำกัด'

UPDATE Shippers set Phone = '0987456123'

UPDATE Customers
set CompanyName = 'วรมินทร์',
    ContactTitle = 'HR',
    Address = 'thiland'
where CustomerID = 'UDRU1'

--ปรับปรุงจำนวนสินค้าคงเหลือสินค้ารหัส 1 เพิ่มจำนวนเข้าไป 100 ชิ้น
Update Products set UnitsInStock = UnitsInStock + 100
where ProductID = 1


-- คำสั่ง Delete 
-- ลบบริษัทขนส่งสินค้า รหัส 5
Delete from Products where ProductID = 70

Delete from Shippers where ShipperID = 70

delete from Customers where CustomerID = 'UDRU'

select * from Customers

select emp.FirstName ชื่อพนังงาน, boss.EmployeeID,boss.FirstName ชื่อหัวหน้า
from Employees emp left outer join Employees boss
on emp.ReportsTo = boss.EmployeeID
