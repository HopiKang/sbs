use AdventureWorks2019

Production.Product 테이블을 활용하여 listprice가 0이면 판매금지 40보다작으면 50만원이하
크거나 같고 250보다 작으면 250만원이하 250보다 ㅡ거나 같고 1000보다 작으면 1000만원이하
아니면 1000만원 이상을 쿼리문으로 작성하시오

select * from Production.Product

select listprice, listprice = 
	case when listprice = 0 then N'판매금지'
		 when listprice < 40 then N'50만원이하'
		 when 40 <= listprice and listprice < 250 then N'250만원이하'
		 when 250 <= listprice and listprice < 1000 then N'1000만원이하'
		 when listprice = 0 then N''
	else N'100만원 이상' end
from Production.Product

-------------------------------------------------------------------------------------------------

while문

set @반복 = 0
set @누적 = 0
while(@반복 < 10) begin
	set @반복 = @반복 + 1
	set @누적 = @누적 + @반복
	end
	@반복 @누적 출력

declare @반복값 int, @누적값 int

set @반복값 = 0
set @누적값 = 0

while (@반복값 < 10) begin
	set @반복값 = @반복값 + 1
	set @누적값 = @누적값 + @반복값
	end
	select 반복값 = @반복값, 누적값 = @누적값

---------------------------------------------------------------------------------------

break
위예제에서 누적값이 40이상일때 중단하고싶을때

while (@반복값 < 10) begin
	set @반복값 = @반복값 + 1
	set @누적값 = @누적값 + @반복값
	if @누적값 >= 40 break
	end
	select 반복값 = @반복값, 누적값 = @누적값

-----------------------------------------------------------------------------------------

continue
위예제에서 반복값이 짝수일때만 보고싶을때

while (@반복값 < 10) begin
	set @반복값 = @반복값 + 1
	if @반복값 % 2 = 0 continue
	set @누적값 = @누적값 + @반복값
	end
	select 반복값 = @반복값, 누적값 = @누적값