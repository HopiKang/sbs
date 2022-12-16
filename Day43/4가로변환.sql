use db1
/*
가로로표현하기
*/
create table #목표(
	부서코드 nvarchar(10),
	담당자코드 nvarchar(10),
	목표금액 numeric(18,0)
)

insert into #목표 (부서코드, 담당자코드, 목표금액) values
('A1','A1-1',100000),
('A1','A1-2',200000),
('A2','A2-1',300000),
('A3','A3-1',400000)

create table #매출(
	부서코드 nvarchar(10),
	담당자코드 nvarchar(10),
	매출금액 nvarchar(10)
)

insert into #매출 (부서코드, 담당자코드, 매출금액) values
('A1','A1-1',90000),
('A1','A1-2',150000),
('A2','A2-1',250000),
('A2','A2-2',100000),
('A4','A4-1',200000)

select * from #매출
select * from #목표

select 구분 = '1목표금액', 부서코드, 금액 = sum(목표금액)
into #자료집계
from #목표
group by 부서코드
union all -- union은 모든열의 개수와 위칙가 같아야한다
select 구분 = '2목표금액', 부서코드, 금액 = sum(매출금액)
from #매출
group by 부서코드

select P.구분
	   A1 = isnull(P.A1,0),
	   A2 = isnull(P.A1,0),
	   A3 = isnull(P.A1,0),
	   A4 = isnull(P.A1,0)
from 자료집계 A
pivot (sum(A.금액) for A.부서코드 in (A1.A2.A3.A4)) p
order by P.구분



-- +코드 암호화에 대해 찾아보기