use db1

/*
�Լ�

����� �����Լ�
1. ���̺� ��ȣ�� �Լ�
- ������, ����Į�� ���
2. ��Į�� ��ȯ�Լ�
- ���ϰ� ���

select ���� sql ��ɾ �Լ��μ� ����� �����ϴ�
���峻���� sum�̳� count���� ǥ�� �Լ� �ܿ� ����ڰ� ���ϴ� ����� ����ڰ� ���� �Լ��� ���α׷��� �ۼ��Ͽ� ��밡���ϴ�
print ��ɿ� ����� �Ұ����ϴ�
insert, update, delete�� �������� ���Ѵ�

ȿ��
- ���α׷����� �ܼ�ȭ �� ǥ��ȭ ���� �� Ʈ������ ���������ϴ�
- �������ν����� ���� ����� �ټ� �������ִ�
*/

-- ���̺� ��ȯ�Լ�

-- ���ó�¥�� �������� ����,���,�Ϳ� �����

select convert(date,concat('202212','01')
select left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat('202212'.'01'))),112),6)
select left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat('202212'.'01'))),112),6)

/*
���̺� ��ȯ���

1. ���߹� ���̺���
2. �ζ��� ���̺� ���
*/

-- ���߹� ���̺���

create function dbo.uft07_�����Ϳ� (@�Է³�� nvarchar(6))

return @tbl_��� table (���� nvarchar(6), ��� nvarchar(6), �Ϳ� nvarchar(6))

as
begin

	declare @���� nvarchar(6),
			@�Ϳ� nvarchar(6)

	set @���� select left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat(@�Է³��.'01'))),112),6)
	set @�Ϳ� select left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat(@�Է³��.'01'))),112),6)

	insert into @tbl_��� (����, ���, �Ϳ�) values (@����, @�Է³��, @�Ϳ�)

	return -- ���ǥ��

end

select * from uft07_�����Ϳ� ('202212')


-- �ζ��� ���̺� �ۼ���� -----------------------------------------------------------------------------------------------------

create function dbo.uft07_�����Ϳ� (@�Է³�� nvarchar(6))
	return table
	as
		return(select ���� = left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat(@�Է³��.'01'))),112),6).
					  ��� = @�Է³��,
					  �Ϳ� = left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat(@�Է³��.'01'))),112),6))

-- �ζ��� ���̺� �ۼ���� -----------------------------------------------------------------------------------------------------
create function dbo.ufs07_���� (@�Է³�� nvarchar(6))

return nvarchar(6)
as
begin
	
	declare @���� nvarchar(6)
	set @���� left(convert(nvarchar, dateadd(month, -1, convert(date, concat(@�Է³��, '01'))), 112), 6)
	return(@����)

end

select ������� = dbo.ufs07_���� ('202212')
