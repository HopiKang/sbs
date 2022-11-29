������(sequence) - ����, ä��(ĳ��cache ����� ����)

- ��ǥ��ȣ, ����ȣ, ��ǰ��ȣ�� ���
- sql 2012���� �������� identity�� ���

create sequence ������10
	as bigint -- ��������, �����ϸ� �⺻������ bigint��
	start with 0 -- �ּҽ��۰� 0, �����ϸ� �������������� �޶�����
	increment by 1 -- ������, 1������
	minvalue 0 -- �ּڰ� 0, �����ϸ� �������������� �޶���
	maxvalue 5 -- �ִ� 5, �����ϸ� �������������� �޶���
	cycle --  �ִ� ���޽� �ٽ� ������, ������ �ݺ������ʴ´�
	no cache; -- ĳ�û�뿩�θ� �־��ټ��ִ�, ������ �⺻������ ĳ�û���̵ȴ� 

select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10
select ���� = next value for ������10

select * from sys.sequences
where name = '������10'

alter sequence ������10 restart with 2; -- ������ ������ 2�� ����


create sequence ������21
as bigint
start with 1
increment by 2
minvalue 0
maxvalue 5
cycle
-- ��ó�������� 1�� ���������� ����Ŭ�� �ѹ��������� 0���� �����ؼ� 0 2 4�� ����Ŭ�� ���Եȴ�

create sequence ������22
as bigint
start with 1
increment by 2
minvalue 0
maxvalue 5
-- ����Ŭ�� ���⶧���� �ִ��̻� �����ϰԵǸ� ������������ ���������ʴ´�

create sequence ������23
as bigint
start with -1
increment by -2
minvalue -5
maxvalue 0
cycle
-- -1 -3 -5 �������� �۾����� �������⶧���� max���� 0���� ����Ŭ�� ��������Ѵ�

select next value for ������21
select next value for ������21
select next value for ������21
select next value for ������21
select next value for ������21

select next value for ������22
select next value for ������22
select next value for ������22
select next value for ������22
select next value for ������22
select next value for ������22

select next value for ������23
select next value for ������23
select next value for ������23
select next value for ������23
select next value for ������23
select next value for ������23


create sequence ������31
as int
increment by 1
-- int ������ �������� ��������� �ּڰ��� �ִ��� int������ ������

select next value for ������31
select next value for ������31
select next value for ������31

create sequence ������32
increment by 1
-- �⺻���� bigint ������ ������

create sequence ������33
as numeric(5,1)
start with 0
increment by 0.1
-- �Ҽ����� ����Ҽ�����