try catch
- sql ����� ������ ���� ��� ���� ó���� �ϱ����� ���
- begin try �� begin catch �� ���̻���ؾ��Ѵ�
- ���忡�� ����Ҷ� ���θ��� �ٸ������ �������� ��������� ��� ������ �߻��ߴ��� �˱����ؼ�


create table #�ӽ�1(
	�ڵ� nvarchar(10),
	���� numeric(18,0)
)
begin try
	insert into #�ӽ�1 (�ڵ�,����) values ('A', '30A')
	select ��� = '����ó��'

end try
begin catch
	select ��� = N'�����߻�'
	������ȣ = @@error
	����������Ʈ = error_procedure(),
	�������ȣ = error_line(),
	�����޼��� = error_message(),
	���������ڵ� = error_state(),
	�����ɰ��� = error_severity()
	-- @@ : �ý��� ����

end catch
-- begin try�� end try ������ ��ɾ� ������ ������ �߻������� 
-- begin catch �� end catch ������ ��ɾ ����ȴ� 