-- 변수
create table #작업(
	코드 nvarchar(10),
	수량 numeric(18,0)
)

insert into #작업 (코드, 수량) values 
('A1', 10),
('A2', 20),
('A3', 30)

select * from #작업

작업 테이블에서 A2의 존재 여부를 확인하여 A2가 존재하면
[A2]존재 아니면 [A2]미존재를 출력하는 쿼리문을 작성하라


declare @변수1 int

select @변수1 = count(*) -- count는 속도가 느리다
from #작업 
where 코드 = 'A2'

if @변수1 = 1
	select 결과 = '[A2]존재'
else
	select 결과 = '[A2]미존재'


if exists (select * from #작업 where 코드 = 'A2')
begin
select 결과 = '[A2]존재'
end else begin
select 결과 = '[A2]미존재'
end
--그럴때는 exists를 사용하면된다
-- 1행 이상 나오면 '참', 그렇지않으면 '거짓'을 나타낸다