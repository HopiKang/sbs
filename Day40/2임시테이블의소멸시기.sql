-- 임시테이블
-- 하나의 프로시저에서 다른프로시저를 호출해서 사용할때 임시테이블의 소멸시점이 다르다

exec dbo.sp_160_main

alter procedure dbo.sp_160_main
	
as
begin

	set nocount on

	create table #임시1(
		칼럼1 nvarchar(30)
	)

	insert into #임시1(칼럼1) values
	('123')

	exec sp_160_sub

	select * from #임시2

end


create procedure dbo.sp_160_sub

as
begin

	set nocount on

	select * from #임시1

	create table #임시2(
		칼럼2 nvarchar(30)
	)

	insert into #임시2 (칼럼2) values
	('456')
end

-- main시작 > main 임시1 생성 및 입력 > sub시작 > sub #임시1 조회 > sub 임시2 생성 및 입력 > 임시2 소멸 > main 안에서 #임시2 조회