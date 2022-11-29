변수
- 시스템에 저장된 데이터나 사용자가 입력한 값을 읽어와서 편집 또는 계산 하거나 다른 명령에 값을
  전달하기위해서 임시적인 자료 저장소로 사용된다

1. @@시스템변수
- @@lowcount, @@spid, @@error
- 변수이름 변경불가, 변수값 변경불가, 별도로 선언을 안해도 사용가능하다
2. @사용자변수
- declare [@변수이름] [데이터형] [=기본값, 옵션]
- 사용자가 만들어서 사용할수있는 변수
- 예시 declare @변수1 char(30) -- 고정길이문자
- 예시 declare @변수2 nvarchar(30) -- 변동길이문자
- 예시 declare @변수3 nchar(30), @변수4 nvarchar(30) = '1' -- n이붙으면 다국어처리가 가능하다라는 뜻
- 예시 declare @변수6 int, @변수7 bigint = 2 -- 정수형
- 예시 declare @변수8 numeric(5,0), @변수9 numeric(5,3) = 1 -- 고정소수점
- 예시 declare @변수10 float = 1.3, @변수11 real = 12.345
- 예시 declare @변수12 date = '20221129'
- 예시 declare @변수13 datetime = '20221129 12:20:33'

-- set을 활용한 설명
declare @변수1 int = 0, @변수2 int = 0
set @변수1 = 30 
set @변수2 = 0
-- 변수1과 2를 변경

set @변수1 = @변수1 + 10
-- 변수1에 10을 더해서 저장

set @변수2 = @변수1 + 20
-- 변수2에 변수1에 20을 더한수를 저장

select 변수1값 = @변수1, 변수2값 = @변수2


-- select를 활용한설명
declare @변수1 int, @변수2 int

select @변수1 = 30, @변수2 = 0 -- 조회하는것이아니라 변수에 저장되면서 조회되는것이다
select @변수1 = @변수1 + 10

select @변수2 = @변수1 + 20

select @변수1값 = @변수1, 변수2값 = @변수2


-- +설명
select 수량 = 1 into #temp1(임시테이블)

insert into #temp1 (수량) values (2)
declare @변수1 int 

select @변수1 = 수량 from #temp1

select 변수1값 = @변수1
-- 변수1에 #temp1의 수량값을 넣어서 조회한것이다
