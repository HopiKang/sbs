use AdventureWorks2019

AdventureWorks2019 데이터베이스에서
커서를 사용하여 Production.Product 테이블에서 제품 이름과
가격을 한건씩 출력하세요
단 조회시 select가 아닌 print 명령어를 사용하시오
(select로 조회시 여러개의 테이블이 보이기때문에 + 속도도느림, print를 사용하면 로그형식으로 보여준다)
use AdventureWorks2019

select * from Production.Product

select name, ListPrice
from Production.Product

declare cursor_product cursor for -- 커서생성
select name, ListPrice from Production.Product -- 커서가 사용할 테이블조회

open cursor_product -- 커서시작

declare @product_name nvarchar(100), @list_price decimal(18,0) -- 한행에 들어가는 변수선언

fetch next from cursor_product into -- 커서에 변수삽입
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

drop table #작업

fetch next from cursor_name into

@@fetch_status <> 0
-fetch 문 제일 마지막에 실행된다

0 fetch 문이 성공적으로 수행된것
-1 실패했거나 행이 결과 집의 범위를 벗어났을경우
-2 출력행이 없는경우
-9 커서의 패치 작업이 수행되지않았다


공급업체의 제품과 생산제품을 출력하는 커서문을 만드시오
select * from Purchasing.Vendor -- 판매자
select * from Purchasing.ProductVendor -- 제품 공급업체
select * from Production.Product -- 제품

select A.*, B.*, C.*  from Purchasing.ProductVendor B
full join Purchasing.Vendor A on B.BusinessEntityID = A.BusinessEntityID
full join Production.Product C on B.ProductID = C.ProductID


select ProductID, BusinessEntityID from Purchasing.ProductVendor B
join Purchasing.Vendor


declare @vendor_id int, @vendor_name nvarchar(50),
@message nvarchar(80), @product nvarchar(50)


print N'----------공급업체 제품 보고서---------------'

declare vendor_cursor cursor for
select BusinessEntityID, name from Purchasing.Vendor
where PreferredVendorStatus = 1
order by BusinessEntityID

open vendor_cursor

fetch next from vendor_cursor into @vendor_id, @vendor_name

while(@@FETCH_STATUS = 0)
	begin
	print ''
	select @message = N'-------공급업체의 제품 : ' + @vendor_name
	print @message

	declare product_cursor cursor for  -- 제품을 위한커서

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