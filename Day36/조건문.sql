���ǹ�
if, case

���ǹ�
1. if
- ������ ��밡��, ������ ������������

2. case, iif
- select�� update���� sql��ɾ �־�� �����ϴ�
- ���������� ������ �Ұ����ϴ�
--if
declare @in_���� int
set @in_���� = 5

if @in_���� > 0 begin
	select '���'
end else if @in_���� < 0 begin
	select '����'
end else begin
	select '0'
end


--case
declare @in_���� int
set @in_���� = 5

select case when @in_���� > 0 then '���' 
		    when @in_���� < 0 then '����' 
			else '0' end


--iif 2012���� ���Ŀ��� ��밡���ϴ�
declare @in_���� int
set @in_���� = 5

select iif(@in_���� > 0, '���', '����')