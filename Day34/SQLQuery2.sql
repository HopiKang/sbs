use Db1

create table #�ܼ�(
	�� numeric(18,0) default 0
)

insert into #�ܼ� (��) values 
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)


create table #�ݺ�(
	�ݺ� numeric(18,0) default 0
)

insert into #�ݺ� (�ݺ�) values 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)

select *, �� * �ݺ� as ��� from #�ܼ� A, #�ݺ� B

select * from #�ܼ�
select * from #�ݺ�

----------------------------------------------------------------------------------
���� ó��

avg, count, max, min, sum

create table #��ǰ(
	��ǰ�ڵ� nvarchar(10),
	��ǰ�� nvarchar(30)
)

insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values 
('A2','���'),
('A3','����')

create table #����(
	�������� nvarchar(08),
	��ǰ�ڵ� nvarchar(10),
	������� numeric(18,0),
	����ܰ� numeric(18,0),
	����� numeric(18,0)
)

insert into #���� (��������, ��ǰ�ڵ�, �������, ����ܰ�, �����) values 
('20200101','A1',10,100,1000),
('20200102','A2',20,200,4000),
('20200205','A2',30,300,9000),
('20200301','A2',40,400,16000)

select * from #��ǰ
select * from #����
drop table #��ǰ

select sum(A.�������), -- �󿭰����� ���´�, �ظ��ϸ� ���̸����� ������ ������
isnull(avg(A.�������), 0),
isnull(max(A.�������), 0),
min(A.�������),
����Ǽ� = count(*) -- �ش翭�� �ళ��
from 
#���� A inner join #��ǰ B  on A.��ǰ�ڵ� = B.��ǰ�ڵ�
where A.�������� >= '20200101' 
and A.�������� <= '20200228'
and B.��ǰ�� = '���'

select �հ������� = isnull(sum(A.�������), 0), --isnull�� ���� ���� 0�ϰ�� null�� �����
	   ��ո������ = isnull(avg(A.�������), 0),
	   max������� = isnull(max(A.�������), 0),
	   min������� = isnull(min(A.�������), 0),
	   ����Ǽ� = isnull(count(*), 0)
from #���� A inner join #��ǰ B  on A.��ǰ�ڵ� = B.��ǰ�ڵ�
where A.�������� between '20200101' and '20200228' -- between and �ΰ��� �� ���̰��� �����ش�
and B.��ǰ�� = '���'

--------------------------------------------------------------------------

use AdventureWorks2019

-- ���  (avg)
select * from [HumanResources].[Employee]
where jobtitle like 'vice president%' 
-- %�� ������ �ڿ� ���������� ������Եȴ�, �տ������� ���ʿ� ���������� ��ȸ���ȴ�
-- like�� �������̶�� �����ϸ�ȴ�

�λ������ �̿��� ��� �ް��ð��� �����ð��� �հ踦 ���Ѵٸ�?
select avg(vacationhours) as '�ް��ð�',
sum(SickLeaveHours) as '�����ð�'
from [HumanResources].[Employee]
where jobtitle like 'vice president%' 


select * from Sales.SalesPerson

��պ��ʽ��� ���� �Ǹŷ� �հ豸�ϱ�
select TerritoryID, avg(Bonus) as '��պ��ʽ�', sum(SalesYTD) as '���� �Ǹŷ� �հ�'  from Sales.SalesPerson
group by TerritoryID


select * from Production. Product

select distinct(ListPrice) from Production. Product -- distinct �ߺ�������
select avg(distinct(ListPrice)) from Production. Product -- �ߺ������� ��հ� ���ϱ�


TerritoryID ���� null�̰ų� null�ΰ� ���ϱ�
select BusinessEntityID, TerritoryID, datepart(yy,ModifiedDate) as salesyear,
convert(varchar(20),SalesYTD) as salesytd,
convert(varchar(20),avg(SalesYTD) over (partition by TerritoryID -- partition by �׷캰 ����
order by datepart(yy,ModifiedDate))) as movingavg,
convert(varchar(20),sum(SalesYTD) over (partition by TerritoryID -- partition by �׷캰 ����
order by datepart(yy,ModifiedDate))) as cumulativetotal
from Sales. SalesPerson --datepart(yy,�÷�)�������
where TerritoryID is null
or TerritoryID < 5


count

select count(*) from HumanResources.Employee -- ��ü����ȸ
select count(distinct JobTitle) from HumanResources.Employee -- JobTitle�ȿ� �������������� ��ȸ
select * from HumanResources.Employee -- ��ü����ȸ


�Ǹ��Ҵ緮�� 25000����ū ��������� ���ʽ� ��հ� �� ��
select count(*) as '���������', --where���� ���� �������� ������ ��ü�� ��ȸ�ص��ȴ�
avg(Bonus) as '���ʽ����'
from Sales.SalesPerson
where SalesQuota > 25000


enddate�� null�ΰͿ� over ���� �̿��ؼ�
departmentid�� �������� min, max, avg���ϰ�
EmployeeDepartmentHistory�� businessntityid count�� ���Ͻÿ�

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


