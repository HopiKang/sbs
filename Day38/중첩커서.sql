use AdventureWorks2019

AdventureWorks2019 �����ͺ��̽�����
Ŀ���� ����Ͽ� Production.Product ���̺��� ��ǰ �̸���
������ �ѰǾ� ����ϼ���
�� ��ȸ�� select�� �ƴ� print ��ɾ ����Ͻÿ�
(select�� ��ȸ�� �������� ���̺��� ���̱⶧���� + �ӵ�������, print�� ����ϸ� �α��������� �����ش�)
use AdventureWorks2019

select * from Production.Product

select name, ListPrice
from Production.Product

declare cursor_product cursor for -- Ŀ������
select name, ListPrice from Production.Product -- Ŀ���� ����� ���̺���ȸ

open cursor_product -- Ŀ������

declare @product_name nvarchar(100), @list_price decimal(18,0) -- ���࿡ ���� ��������

fetch next from cursor_product into -- Ŀ���� ��������
@product_name,
@list_price

while(@@fetch_status = 0)
	begin
	print @product_name + cast(@list_price as nvarchar)
	fetch next from cursor_product into
	@product_name, @list_price
end

close cursor_product
deallocate cursor_product

---------------------------------------------------------------------------

drop table #�۾�

fetch next from cursor_name into

@@fetch_status <> 0
-fetch �� ���� �������� ����ȴ�

0 fetch ���� ���������� ����Ȱ�
-1 �����߰ų� ���� ��� ���� ������ ��������
-2 ������� ���°��
-9 Ŀ���� ��ġ �۾��� ��������ʾҴ�


���޾�ü�� ��ǰ�� ������ǰ�� ����ϴ� Ŀ������ ����ÿ�
select * from Purchasing.Vendor -- �Ǹ���
select * from Purchasing.ProductVendor -- ��ǰ ���޾�ü
select * from Production.Product -- ��ǰ

select A.*, B.*, C.*  from Purchasing.ProductVendor B
full join Purchasing.Vendor A on B.BusinessEntityID = A.BusinessEntityID
full join Production.Product C on B.ProductID = C.ProductID


select ProductID, BusinessEntityID from Purchasing.ProductVendor B
join Purchasing.Vendor


declare @vendor_id int, @vendor_name nvarchar(50),
@message nvarchar(80), @product nvarchar(50)


print N'----------���޾�ü ��ǰ ����---------------'

declare vendor_cursor cursor for
select BusinessEntityID, name from Purchasing.Vendor
where PreferredVendorStatus = 1
order by BusinessEntityID

open vendor_cursor

fetch next from vendor_cursor into @vendor_id, @vendor_name

while(@@FETCH_STATUS = 0)
	begin
	print ''
	select @message = N'-------���޾�ü�� ��ǰ : ' + @vendor_name
	print @message

	declare product_cursor cursor for  -- ��ǰ�� ����Ŀ��

	select PD.name from Purchasing.ProductVendor PV, Production.Product PD
	where PV.productid = PD.productid
	and PV.BusinessEntityID = @vendor_id

	open product_cursor

	fetch next from product_cursor into @product

	if @@FETCH_STATUS <> 0
		print '       [NONE]'

	while(@@FETCH_STATUS = 0)
		begin
		select @message = '                  ' + @product
		print @message
		fetch next from product_cursor into @product

	end

	close product_cursor
	deallocate product_cursor

	fetch next from vendor_cursor into @vendor_id, @vendor_name

end
close vendor_cursor
deallocate vendor_cursor