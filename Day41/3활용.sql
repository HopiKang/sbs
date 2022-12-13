1. while문을 사용하여 홀수의 합을 구하라

create procedure dbo.sp180_홀수합계

as
begin

	set nocount on

	declare @순번 int = 1,
			@합계 int = 0

	create table #결과(
		순번 int,
		합계 int
	)

	while(@순번 < 100)
		set @합계 = @순번 + @합계
		insert into #결과 (순번, 합계) values (@순번, @합계)
		set @순번 = @순번 + 2
	end

	select 순번, 합계 from #결과
			

end

-- 재귀호출

with tbl as (select 순번 = 1, 합계 = 1
			union all
			select 순번 = 순번 + 2,
				   합계 = 합계 + (순번 + 2)
			from tbl
			where 순번 < 100 - 1)

select * from tbl option (maxrecursion 100) -- 최대실행횟수 100번까지 호출한다



exec dbo.sp180_main


2. 로또번호 생성기

create procedure dbo.sp180_로또생성

as
begin

	set nocount on

	declare @순번 int = 1,
			@번호 int

	create table #로또결과 (
		순번 numeric(18,0),
		번호 numeric(18,0)
	)

	while(@순번 < 8)
		set @번호 = 1 + floor(rand()*45)
		if exists (select * from #로또결과 where 번호 = @번호) continue -- 중복제거
		insert into #로또결과 (순번, 번호) values (@순번, @번호)
		set @순번 = @순번 + 1
	end

	select * from #로또결과

end


create procedure dbo.sp180_로또생성

as
begin

	set nocount on

	with lotto as (select 순번 = 1, 번호 = 1+floor(rand()*45)
				  union all
				  select 순번 = 순번 + 1,
						 번호 = 1+floor(rand()*45)
				  from lotto
				  where 순번 < 7)
	
	select * from lotto option (maxrecursion 100)

end