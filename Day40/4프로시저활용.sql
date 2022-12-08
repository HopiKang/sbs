-- 임시테이블을 만들어서 일, 월, 년의 집계 수량을 출력하는 sp
-- 1(일집계)2(월집계)3(년집계)을 입력값으로줌
-- 1을 입력값으로주면 일별로 집계 2를 입력값으로주면 달별로 집계 3이면 년별로 집계
	
exec dbo.sp_180_main
	 @in_조회넘버 = 1

create procedure dbo.sp_180_main

declare @in_조회넘버 int

create table #임시1(
	일자 nvarchar(30),
	수량 numeric(18,0)
)

insert into #임시1 (일자, 수량) values
('20200101',10),
('20200102',20),
('20200203',30),
('20200201',40),
('20200302',50),
('20200303',60),
('20210101',70)

as
begin

	set nocount on

	if @in_조회넘버 = 1
		begin
		exec dbo.sp_180_d
	end else if @in_조회넘버 = 2
		begin
		exec dbo.sp_180_m
	end else
		begin
		exec dbo.sp_180_y
	end
		

end




create procedure dbo.sp_180_d

as
begin

	set nocount on

	select DD = datepart(dd,일자), sum(수량) --datepart를 right나 substring을 사용해도된다 
	from #임시1
	group by datepart(dd,일자)

end

create procedure dbo.sp_180_m

as
begin

	set nocount on

	select MM = datepart(mm,일자), sum(수량)
	from #임시1
	group by datepart(mm,일자)

end

create procedure dbo.sp_180_y

as
begin

	set nocount on

	select YY = datepart(yy,일자), sum(수량)
	from #임시1
	group by datepart(yy,일자)

end



---------------------------------------------------------------------------------
--동적쿼리문

declare @txt_쿼리문장 nvarchar(2000),
		@txt_구분명 nvarchar(50),
		@txt_그룹 nvarchar(50)


set @txt_쿼리문장 = 'select 구분명 = 그룹, 집계수량 = sum(A.수량) from #임시1 A group by 그룹' -- print로 한번 확인가능함

if @in_조회넘버 = 1 begin
	set @txt_구분명 = 'DD'
	set @txt_그룹 = 'right(A.일자, 2)'
end else if @@in_조회넘버 = 2 begin
	set @txt_구분명 = 'MM'
	set @txt_그룹 = 'substring(A.일자, 5, 2)'
end else if @@in_조회넘버 = 2 begin
	set @txt_구분명 = 'YYYY'
	set @txt_그룹 = 'left(A.일자, 4)'
end else begin
	return -- 조회넘버가 1,2,3이 아닌경우 return
end

set @txt_쿼리문장 = REPLACE(@txt_쿼리문장, '구분명', @txt_구분명) -- 완성된문장을 구분명만 바꿔서 사용해준다

set @txt_쿼리문장 = REPLACE(@txt_쿼리문장, '그룹', @txt_그룹)

exec(@txt_쿼리문장)