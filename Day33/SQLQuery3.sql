create table #���̺� A(
	Į�� nvarchar(30),
	����A nvarchar(30)
)

insert into #���̺�A (Į��, ����A) values
('1', 'A1����'),
('2', 'A2����'),
('3', 'A3����')

create table #���̺� B(
	Į�� nvarchar(30),
	����B nvarchar(30)
)

insert into #���̺�B (Į��, ����B) values
('2', 'B2����'),
('3', 'B3����'),
('4', 'B4����')

SELECT A.*, B.* FROM ���̺�A A
LEFT JOIN ���̺�B B ON A.Į�� = B.Į��--A���̺���ȸSELECT A.*, B.* FROM ���̺�A A
INNER JOIN ���̺�B B ON A.Į�� = B.Į��
--A��  B�� �����ո� ��ȸ

SELECT A.*, B.* FROM ���̺�A A
RIGHT JOIN ���̺�B B ON A.Į�� = B.Į��
--B���̺� ��ȸ

SELECT A.*, B.* FROM ���̺�A A
LEFT JOIN ���̺�B B ON A.Į�� = B.Į��
WHERE B.Į�� IS NUL
--A���̺��� B�� ��ġ�°�����

SELECT A.*, B.* FROM ���̺�A A
RIGHT JOIN ���̺�B B ON A.Į�� = B.Į��
WHERE A.Į�� IS NULL
--B���̺��� A�� ��ġ�°�����

SELECT A.*, B.* FROM ���̺�A A
FULL JOIN ���̺�B B ON A.Į�� = B.Į��
--A�� B ��ΰ� ��ȸ

SELECT A.*, B.* FROM ���̺�A A
FULL JOIN ���̺�B B ON A.Į�� = B.Į��
WHERE A.Į�� IS NULL OR B.Į�� IS NULL
--A�� B�� ��ġ�°͸� �����ϰ� ��ȸ