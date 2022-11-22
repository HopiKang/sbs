use Db1

create table #단수(
	단 numeric(18,0) default 0
)

insert into #단수 (단) values 
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)


create table #반복(
	반복 numeric(18,0) default 0
)

insert into #반복 (반복) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)

select *, 단 * 반복 as 결과 from #단수 A, #반복 B

select * from #단수
select * from #반복

----------------------------------------------------------------------------------
집계 처리

avg, count, max, min, sum

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
drop table #제품

select sum(A.매출수량), -- 빈열값으로 나온다, 왠만하면 빈열이름으로 나오면 안좋다
isnull(avg(A.매출수량), 0),
isnull(max(A.매출수량), 0),
min(A.매출수량),
매출건수 = count(*) -- 해당열의 행개수
from 
#매출 A inner join #제품 B  on A.제품코드 = B.제품코드
where A.매출일자 >= '20200101' 
and A.매출일자 <= '20200228'
and B.제품명 = '사과'

select 합계매출수량 = isnull(sum(A.매출수량), 0), --isnull은 만약 값이 0일경우 null로 출력함
	   평균매출수량 = isnull(avg(A.매출수량), 0),
	   max매출수량 = isnull(max(A.매출수량), 0),
	   min매출수량 = isnull(min(A.매출수량), 0),
	   매출건수 = isnull(count(*), 0)
from #매출 A inner join #제품 B  on A.제품코드 = B.제품코드
where A.매출일자 between '20200101' and '20200228' -- between and 두개의 값 사이값을 구해준다
and B.제품명 = '당근'

--------------------------------------------------------------------------

use AdventureWorks2019

-- 평균  (avg)
select * from [HumanResources].[Employee]
where jobtitle like 'vice president%' 
-- %로 적으면 뒤에 뭐가적히던 상관없게된다, 앞에적으면 앞쪽에 뭐가적히던 조회가된다
-- like는 같은것이라고 생각하면된다

부사장들이 이용한 평균 휴가시간과 병과시간의 합계를 구한다면?
select avg(vacationhours) as '휴가시간',
sum(SickLeaveHours) as '병가시간'
from [HumanResources].[Employee]
where jobtitle like 'vice president%' 


select * from Sales.SalesPerson

평균보너스와 연간 판매량 합계구하기
select TerritoryID, avg(Bonus) as '평균보너스', sum(SalesYTD) as '연간 판매량 합계'  from Sales.SalesPerson
group by TerritoryID


select * from Production. Product

select distinct(ListPrice) from Production. Product -- distinct 중복값제거
select avg(distinct(ListPrice)) from Production. Product -- 중복값빼고 평균값 구하기


TerritoryID 값이 null이거나 null인값 구하기
select BusinessEntityID, TerritoryID, datepart(yy,ModifiedDate) as salesyear,
convert(varchar(20),SalesYTD) as salesytd,
convert(varchar(20),avg(SalesYTD) over (partition by TerritoryID -- partition by 그룹별 집계
order by datepart(yy,ModifiedDate))) as movingavg,
convert(varchar(20),sum(SalesYTD) over (partition by TerritoryID -- partition by 그룹별 집계
order by datepart(yy,ModifiedDate))) as cumulativetotal
from Sales. SalesPerson --datepart(yy,컬럼)연만출력
where TerritoryID is null
or TerritoryID < 5


count

select count(*) from HumanResources.Employee -- 전체행조회
select count(distinct JobTitle) from HumanResources.Employee -- JobTitle안에 직업종류개수를 조회
select * from HumanResources.Employee -- 전체행조회


판매할당량이 25000보다큰 영업사원의 보너스 평균과 그 수
select count(*) as '영업사원수', --where에서 수가 가려지기 때문에 전체로 조회해도된다
avg(Bonus) as '보너스평균'
from Sales.SalesPerson
where SalesQuota > 25000


enddate가 null인것에 over 절을 이용해서
departmentid를 기준으로 min, max, avg구하고
EmployeeDepartmentHistory의 businessntityid count를 구하시오

select * from HumanResources.Department
select * from HumanResources.EmployeeDepartmentHistory
select * from HumanResources.EmployeePayHistory

select distinct name,
min(rate) over (partition by EDH.departmentid) as minsalary,
max(rate) over (partition by EDH.departmentid) as maxsalary,
avg(rate) over (partition by EDH.departmentid) as avgsalary,
count(EDH.BusinessEntityID) over (partition by EDH.departmentid) as employess
from HumanResources.Department as D join HumanResources.EmployeeDepartmentHistory as EDH
on D.DepartmentID = EDH.DepartmentID join HumanResources.EmployeePayHistory as EPH
on EDH.BusinessEntityID = EPH.BusinessEntityID
where EDH.Enddate is null
order by name


