use db1

/*
1.
sp�ȿ��� create ����� ���� ������ #�ӽ����̺��� sp�� ���� ����Ǹ� ������
�Ҹ�Ǿ� ���̻� ����� �� ����

2.
�̹� �Ҹ�� �̸��� #�ӽ����̺�� ������ �̸����� #�ӽ����̺��� �ٽ� �����ϴ�
���� �����ϴ�
sub2�� �ι� ȣ���Ͽ� �����غ��� ����Ǵ°��� �˼��ִ�

3.
Ư�� sp���� �ӽ����̺��� �����Ͽ� ������� ��� �ٸ� sp���� ������ �̸���
�ӽ����̺��� ������ �� ����
main���� �̹� ������� #�ӽ�1�� ��� ������ sub3�� ȣ���Ͽ� ������ #�ӽ�1 �ӽ����̺��� ������ �ӽ����̺�
�̸��� �ߺ��Ǳ� ������ ������ �߻��Ѵ�
*/

exec dbo.sp_170_main

-------------------------------------------------------------------
create procedure dbo.sp_170_main

as
begin

	set nocount on

	create table #�ӽ�1(
		���� nvarchar(30),
		���� numeric(18,0)
	)

	exec dbo.sp_170_sub1 -- #�ӽ�1 ���ǳ��� insert

	select * from #�ӽ�1 -- #�ӽ�1 ��ȸ

	exec dbo.sp_170_sub2 -- #�ӽ�2 create �� insert

	exec dbo.sp_170_sub2 -- #�ӽ�2 create �� insert
						 -- #�ӽ�2 �Ҹ� (exec���ȿ� select * from #�ӽ�2 �ۼ��������� ��ȸ������)
	select * from #�ӽ�2 -- #�ӽ�2 ���� ��ȸ ����

	exec dbo.sp_170_sub3 -- #�ӽ�1 create �� insert �Ұ� (main���� #�ӽ�1�� �̹� �����Ǿ�����)

	select * from #�ӽ�1 -- #�ӽ�1 ��ȸ �Ұ�

end

--------------------------------------------------------------

create procedure dbo.sp_170_sub1

as
begin

	set nocount on

	insert into #�ӽ�1 (����, ����) values
	('20221208',20)

end

---------------------------------------------------------------

create procedure dbo.sp_170_sub2

as
begin

	set nocount on

	create table #�ӽ�2(
		���� nvarchar(30),
		���� numeric(18,0)
	)

	insert into #�ӽ�2 (����, ����) values
	('20221208', 20)

end

---------------------------------------------------------------

create procedure dbo.sp_170_sub3

as
begin

	set nocount on

	create table #�ӽ�1(
		���� nvarchar(30),
		���� numeric(18,0)
	)

	insert into #�ӽ�1 (����, ����) values
	('20221208', 20)

end