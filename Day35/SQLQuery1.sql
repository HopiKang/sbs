use DB1

create table #제품(
	제품코드 nvarchar(10),
	제품명 nvarchar(30)
)

insert into #제품 (제품코드, 제품명) values 
('A2','당근'),
('A3','포도')

create table #매출(
	매출일자 nvarchar(08),
	제품코드 nvarchar(10),
	매출수량 numeric(18,0),
	매출단가 numeric(18,0),
	매출금 numeric(18,0)
)

insert into #매출 (매출일자, 제품코드, 매출수량, 매출단가, 매출금) values 
('20200101','A1',10,100,1000),
('20200102','A2',20,200,4000),
('20200205','A2',30,300,9000),
('20200301','A2',40,400,16000)

select * from #제품
select * from #매출

select B.제품명,
매출수량 = sum(A.매출수량),
매출건수 = count(*)
from #매출 A left join #제품 B
on A.제품코드 = B.제품코드
where A.매출일자 >= '20200101'
and A.매출일자 <= '20200228'
group by B.제품명
order by sum(A.매출수량) desc

순서
1. left join
2. group by
3. sum, count 

select B.제품명, A.매출일자,
매출수량 = sum(A.매출수량).
매출건수 = count(*)
from #매출 A left join B
on A.제품코드 = B.제품코드
where A.매출일자 between '20200101' and '20200228'
group by B.제품명, A.매출일자
having sum(A.매출수량) > 15 
-- 결과값의 어떠한 조건을 추가해야할경우 사용할수있다
order by B.제품명 desc, A.매출일자
-- desc는 내림차순으로 정렬, asc는 오름차순으로 정렬


use AdventureWorks2019
select * from HumanResources.Employee
order by BusinessEntityID desc -- 내림차순
select * from HumanResources.Employee
order by BusinessEntityID asc -- 오름차순

-------------------------------------------------------------------------------

use db1
drop table #제품
drop table #매출

create table #제품(
	제품코드 nvarchar(10),
	제품명 nvarchar(30)
)
insert into #제품 (제품코드, 제품명) values
('A1','사과'),
('A2','당근'),
('A3','포도'),
('A4','무화과'),
('A5','양파'),
('B1','고추'),
('B2','감자'),
('B3','버섯'),
('B4','상추'),
('B5','도라지')

select * from #제품

select top 5 제품코드, 제품명 from #제품 -- 보통 100건이상쓰지않는다
order by 제품코드

select 제품코드, 제품명 from #제품
order by 제품코드
offset 3 rows -- 3건수밑에
fetch next 2 rows only
-- fetch next : offset과 함께 쓸수있고 최대행개수를 정해줄수있다

---------------------------------------------------------------------------
where

create table #제품(
	제품코드 nvarchar(10),
	제품명 nvarchar(30)
)
insert into #제품 (제품코드, 제품명) values
('A1','사과'),
('A2','당근'),
('A3','포도'),
('A4','무화과'),
('A5','양파'),
('B1','고추'),
('B2','감자'),
('B3','버섯'),
('B4','상추'),
('B5','도라지')

select * from #제품
where 제품명 = '포도'

select * from #제품
where 제품명 <> '포도' -- <>은 같지않다

select * from #제품
where 제품명 != '포도'

select * from #제품
where 제품명 like 'A%' -- A로시작하는, like는 %와 함께쓸수있다

select * from #제품
where left(제품코드, 1) = 'A' -- 제품코드에서 왼쪽 하나를 가져온다

select * from #제품
where left(제품코드, 1) <> 'A' -- A로 시작하지않는것
where left(제품코드, 1) != 'A' -- A로 시작하지않는것
where not left(제품코드, 1) = 'A' -- A로 시작하지않는것
where 제품명 not like 'A%' -- A로 시작하지않는것

제품명이 도 글자가 포함되고 제품코드가 A로 시작하는것
select * from #제품
where 제품명 like '%도%'
and 제품코드 like 'A%'

제품명이 과로끝나는것
select * from #제품
where 제품명 like '%과'
where right(제품명, 1) = '과'
where 제품명 like '_과'
where substring(제품명,2,1) = '과' 
-- substring (칼럼, 2번째글자부터, 한개글자) : 글자를 잘라낸다

두가지를 찾을때
select * from #제품
where 제품명 in ('사과', '당근')
where 제품명 not in ('사과', '당근') -- 사과와 당근이 아닌것
where not (제품명 = '사과') or 제품명 = '당근' -- 사과와 당근이 아닌것

제품코드 두번째 자리값이 2 ~ 4인것
select * from #제품
where substring(제품코드, 2, 1)  between '2' and '4'


create table #사원(
	사원코드 nvarchar(10),
	사원명 nvarchar(30),
	나이 numeric(18,0)
)

insert into #사원 (사원코드, 사원명, 나이) values
('A1', '지수', 23),
('A2', '제니', 30),
('A3', '로제', 34),
('A4', '리사', 22),
('A5', 'RM', 51),
('A6', '진', 47),
('A7', '슈가', 45),
('A8', '제이홉', 27),
('A9', '지민', 33)

1.나이가 22세인 사원
select * from #사원
where 나이 = 22

2. 나이가 22세 제외한 사원
select * from #사원
where 나이 <> 22

3.나이가 20세 ~ 30세 사원
select * from #사원
where 나이  between 20 and 30 

4.나이가 20세 ~ 30세를 제외한 사원
select * from #사원
where 나이 not between 20 and 30

5.나이가 30세, 51세인 사원
select * from #사원
where 나이 = 30
or 나이 = 51

6.나이가 23세, 51세를 제외한 사원
select * from #사원
where 나이 not in (23, 51)

-------------------------------------------------------------------------
use AdventureWorks2019

select * from HumanResources.Employee

왼쪽부터 문자를 3자리 잘라서 조회
select left(NationalIDNumber, 3) from HumanResources.Employee

오른쪽부터 3개
select right(NationalIDNumber, 3) from HumanResources.Employee

왼쪽 2자리부터 3잘 잘라서 조회
select substring(NationalIDNumber, 2, 3) from HumanResources.Employee

select reverse(VacationHours) from HumanResources.Employee

select replicate(OrganizationLevel) from HumanResources.Employee -- 반복

select charindex('assistant', JobTitle, 1) from HumanResources.Employee

select REPLACE(JobTitle, 'assistant', 'student') from HumanResources.Employee
where JobTitle = 'marketing assistant' -- 바꾸기

-- 문자결합
select 'A' + 'B' + 'C'
select 'A' + 'B' + null -- 안에 null값이 하나라도있으면 null값이 출력됨
select concat('A','B','C')
select concat('A',null,'C') -- 안에 null값이 들어가더라도 무시하고 더해준다
select 'A' + convert(nvarchar, 12.3) -- convert로 12.3을 문자형으로 바꿔준것이다
select concat('A', 12.3, 'B') -- concat함수는 자동으로 문자형변환을 해준다 그래서 null값을넣으면 사라지는것

select * from HumanResources.Employee

select len(NationalIDNumber) from HumanResources.Employee -- 한열만 출력

select datalength('가나다') -- 문자의 비트값으로 변환

select ASCII('A') -- 아스키값으로 변환
select char(65) -- 아스키값을 문자로 변환

select UNICODE('가') -- unicode값을 변환
select nchar(44032) -- unicode값을 문자로 변환

select isdate('20221129')

select isnumeric('123') -- 숫자인지 확인하는법

select upper(JobTitle) from HumanResources.Employee -- 대문자로 변환
select lower(JobTitle) from HumanResources.Employee -- 소문자로 변환

select rtrim('   ABC') -- 왼쪽공백공간 지우기
select ltrim('ABC    ') -- 오른쪽공백공간 지우기
-- 글자중간에 공백공간이 생긴다면 그대로나온다
select trim('   AB   C    ') -- 전체공백공간 지우기 (왠만하면 전체공백을 지우는걸 사용한다)
-- 전체공백 제거라고하지만 글자사이에 공백공간은 지우지못한다

select round(17.5 + 0.05, 0, 1) -- round(소수, 반올림, 절사)

select floor(17.5) -- 내림

select 10 % 5 -- 나머지값

select abs(-20) -- 정수값

select power(2,3) -- 2의 3제곱

select sqrt(4) -- 루트값

select rand(((20+1)-10) * rand() + 10,0,1) -- 10과 20사이에서 난수를 생성한다

select convert(nvarchar, getdate(), 112)

select dateadd(day, -10, convert(date, '20221124'))
select dateadd(MINUTE, -10, convert(time, '21:00:00'))
select datepart(weekday, '20221124')
select datepart(year, '20221124')
select datediff(day, '20220101', '20221124')
select datediff(second, '20220101 12:30:01', '20220101 12:0:21')

select eomonth('20221124', -1)

select convert(nvarchar, 123)
select cast(123 as nvarchar)

select convert(date, '20221124')
select convert(time, '21:18:00')
select convert(datetime, '20221124 21:18:00')
select convert(nvarchar, getdate(), 121)
select convert(nvarchar, getdate(), 24)

select format(123456789, '#,##0')
select format(0, '#,###')
select format(123456789.1, '#,##0.00') -- 소숫점 둘째자리까지
select right(concat('0000', 12), 4)
select format(12, '0000')

-------------------------------------------------------------------------
변수

만약 @A < 10 이면 0
     @A >= 10 이면 1
	 두조건이 아니면 3

declare @A int = 10
select 결과 = iif(@A = 10, 0, 1)

declare @A int = 10
select 결과 = case when @A < 10 then 
			       when @A < 10 then	
				   when @A < 10 then -- when @A < 10 then : 여러개가능
				   else 3
				   end