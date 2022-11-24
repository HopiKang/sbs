use DB1

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

select B.��ǰ��,
������� = sum(A.�������),
����Ǽ� = count(*)
from #���� A left join #��ǰ B
on A.��ǰ�ڵ� = B.��ǰ�ڵ�
where A.�������� >= '20200101'
and A.�������� <= '20200228'
group by B.��ǰ��
order by sum(A.�������) desc

����
1. left join
2. group by
3. sum, count 

select B.��ǰ��, A.��������,
������� = sum(A.�������).
����Ǽ� = count(*)
from #���� A left join B
on A.��ǰ�ڵ� = B.��ǰ�ڵ�
where A.�������� between '20200101' and '20200228'
group by B.��ǰ��, A.��������
having sum(A.�������) > 15 
-- ������� ��� ������ �߰��ؾ��Ұ�� ����Ҽ��ִ�
order by B.��ǰ�� desc, A.��������
-- desc�� ������������ ����, asc�� ������������ ����


use AdventureWorks2019
select * from HumanResources.Employee
order by BusinessEntityID desc -- ��������
select * from HumanResources.Employee
order by BusinessEntityID asc -- ��������

-------------------------------------------------------------------------------

use db1
drop table #��ǰ
drop table #����

create table #��ǰ(
	��ǰ�ڵ� nvarchar(10),
	��ǰ�� nvarchar(30)
)
insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values
('A1','���'),
('A2','���'),
('A3','����'),
('A4','��ȭ��'),
('A5','����'),
('B1','����'),
('B2','����'),
('B3','����'),
('B4','����'),
('B5','������')

select * from #��ǰ

select top 5 ��ǰ�ڵ�, ��ǰ�� from #��ǰ -- ���� 100���̻����ʴ´�
order by ��ǰ�ڵ�

select ��ǰ�ڵ�, ��ǰ�� from #��ǰ
order by ��ǰ�ڵ�
offset 3 rows -- 3�Ǽ��ؿ�
fetch next 2 rows only
-- fetch next : offset�� �Բ� �����ְ� �ִ��ళ���� �����ټ��ִ�

---------------------------------------------------------------------------
where

create table #��ǰ(
	��ǰ�ڵ� nvarchar(10),
	��ǰ�� nvarchar(30)
)
insert into #��ǰ (��ǰ�ڵ�, ��ǰ��) values
('A1','���'),
('A2','���'),
('A3','����'),
('A4','��ȭ��'),
('A5','����'),
('B1','����'),
('B2','����'),
('B3','����'),
('B4','����'),
('B5','������')

select * from #��ǰ
where ��ǰ�� = '����'

select * from #��ǰ
where ��ǰ�� <> '����' -- <>�� �����ʴ�

select * from #��ǰ
where ��ǰ�� != '����'

select * from #��ǰ
where ��ǰ�� like 'A%' -- A�ν����ϴ�, like�� %�� �Բ������ִ�

select * from #��ǰ
where left(��ǰ�ڵ�, 1) = 'A' -- ��ǰ�ڵ忡�� ���� �ϳ��� �����´�

select * from #��ǰ
where left(��ǰ�ڵ�, 1) <> 'A' -- A�� ���������ʴ°�
where left(��ǰ�ڵ�, 1) != 'A' -- A�� ���������ʴ°�
where not left(��ǰ�ڵ�, 1) = 'A' -- A�� ���������ʴ°�
where ��ǰ�� not like 'A%' -- A�� ���������ʴ°�

��ǰ���� �� ���ڰ� ���Եǰ� ��ǰ�ڵ尡 A�� �����ϴ°�
select * from #��ǰ
where ��ǰ�� like '%��%'
and ��ǰ�ڵ� like 'A%'

��ǰ���� ���γ����°�
select * from #��ǰ
where ��ǰ�� like '%��'
where right(��ǰ��, 1) = '��'
where ��ǰ�� like '_��'
where substring(��ǰ��,2,1) = '��' 
-- substring (Į��, 2��°���ں���, �Ѱ�����) : ���ڸ� �߶󳽴�

�ΰ����� ã����
select * from #��ǰ
where ��ǰ�� in ('���', '���')
where ��ǰ�� not in ('���', '���') -- ����� ����� �ƴѰ�
where not (��ǰ�� = '���') or ��ǰ�� = '���' -- ����� ����� �ƴѰ�

��ǰ�ڵ� �ι�° �ڸ����� 2 ~ 4�ΰ�
select * from #��ǰ
where substring(��ǰ�ڵ�, 2, 1)  between '2' and '4'


create table #���(
	����ڵ� nvarchar(10),
	����� nvarchar(30),
	���� numeric(18,0)
)

insert into #��� (����ڵ�, �����, ����) values
('A1', '����', 23),
('A2', '����', 30),
('A3', '����', 34),
('A4', '����', 22),
('A5', 'RM', 51),
('A6', '��', 47),
('A7', '����', 45),
('A8', '����ȩ', 27),
('A9', '����', 33)

1.���̰� 22���� ���
select * from #���
where ���� = 22

2. ���̰� 22�� ������ ���
select * from #���
where ���� <> 22

3.���̰� 20�� ~ 30�� ���
select * from #���
where ����  between 20 and 30 

4.���̰� 20�� ~ 30���� ������ ���
select * from #���
where ���� not between 20 and 30

5.���̰� 30��, 51���� ���
select * from #���
where ���� = 30
or ���� = 51

6.���̰� 23��, 51���� ������ ���
select * from #���
where ���� not in (23, 51)

-------------------------------------------------------------------------
use AdventureWorks2019

select * from HumanResources.Employee

���ʺ��� ���ڸ� 3�ڸ� �߶� ��ȸ
select left(NationalIDNumber, 3) from HumanResources.Employee

�����ʺ��� 3��
select right(NationalIDNumber, 3) from HumanResources.Employee

���� 2�ڸ����� 3�� �߶� ��ȸ
select substring(NationalIDNumber, 2, 3) from HumanResources.Employee

select reverse(VacationHours) from HumanResources.Employee

select replicate(OrganizationLevel) from HumanResources.Employee -- �ݺ�

select charindex('assistant', JobTitle, 1) from HumanResources.Employee

select REPLACE(JobTitle, 'assistant', 'student') from HumanResources.Employee
where JobTitle = 'marketing assistant' -- �ٲٱ�

-- ���ڰ���
select 'A' + 'B' + 'C'
select 'A' + 'B' + null -- �ȿ� null���� �ϳ��������� null���� ��µ�
select concat('A','B','C')
select concat('A',null,'C') -- �ȿ� null���� ������ �����ϰ� �����ش�
select 'A' + convert(nvarchar, 12.3) -- convert�� 12.3�� ���������� �ٲ��ذ��̴�
select concat('A', 12.3, 'B') -- concat�Լ��� �ڵ����� ��������ȯ�� ���ش� �׷��� null���������� ������°�

select * from HumanResources.Employee

select len(NationalIDNumber) from HumanResources.Employee -- �ѿ��� ���

select datalength('������') -- ������ ��Ʈ������ ��ȯ

select ASCII('A') -- �ƽ�Ű������ ��ȯ
select char(65) -- �ƽ�Ű���� ���ڷ� ��ȯ

select UNICODE('��') -- unicode���� ��ȯ
select nchar(44032) -- unicode���� ���ڷ� ��ȯ

select isdate('20221129')

select isnumeric('123') -- �������� Ȯ���ϴ¹�

select upper(JobTitle) from HumanResources.Employee -- �빮�ڷ� ��ȯ
select lower(JobTitle) from HumanResources.Employee -- �ҹ��ڷ� ��ȯ

select rtrim('   ABC') -- ���ʰ������ �����
select ltrim('ABC    ') -- �����ʰ������ �����
-- �����߰��� ��������� ����ٸ� �״�γ��´�
select trim('   AB   C    ') -- ��ü������� ����� (�ظ��ϸ� ��ü������ ����°� ����Ѵ�)
-- ��ü���� ���Ŷ�������� ���ڻ��̿� ��������� ���������Ѵ�

select round(17.5 + 0.05, 0, 1) -- round(�Ҽ�, �ݿø�, ����)

select floor(17.5) -- ����

select 10 % 5 -- ��������

select abs(-20) -- ������

select power(2,3) -- 2�� 3����

select sqrt(4) -- ��Ʈ��

select rand(((20+1)-10) * rand() + 10,0,1) -- 10�� 20���̿��� ������ �����Ѵ�

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
select format(123456789.1, '#,##0.00') -- �Ҽ��� ��°�ڸ�����
select right(concat('0000', 12), 4)
select format(12, '0000')

-------------------------------------------------------------------------
����

���� @A < 10 �̸� 0
     @A >= 10 �̸� 1
	 �������� �ƴϸ� 3

declare @A int = 10
select ��� = iif(@A = 10, 0, 1)

declare @A int = 10
select ��� = case when @A < 10 then 
			       when @A < 10 then	
				   when @A < 10 then -- when @A < 10 then : ����������
				   else 3
				   end