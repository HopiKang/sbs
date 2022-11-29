조건문
if, case

조건문
1. if
- 독립적 사용가능, 복잡한 로직구성가능

2. case, iif
- select나 update같은 sql명령어가 있어야 가능하다
- 독립적으로 실행이 불가능하다
--if
declare @in_숫자 int
set @in_숫자 = 5

if @in_숫자 > 0 begin
	select '양수'
end else if @in_숫자 < 0 begin
	select '음수'
end else begin
	select '0'
end


--case
declare @in_숫자 int
set @in_숫자 = 5

select case when @in_숫자 > 0 then '양수' 
		    when @in_숫자 < 0 then '음수' 
			else '0' end


--iif 2012버전 이후에만 사용가능하다
declare @in_숫자 int
set @in_숫자 = 5

select iif(@in_숫자 > 0, '양수', '음수')