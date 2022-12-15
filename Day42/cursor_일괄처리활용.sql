/*
1. 자료

담당자
부서코드 담당자코드
A          A1
A          A2
B          B1
B          B2
C          C1
C          C2

매출
부서코드 담당자코드 매출금액
A           A1      100,000
A           A2      200,000
B           B1      250,000
B           B2      500,000

이익
부서코드 이익금액
A         10,000
C         30,000

2.결과

부서코드 담당자코드 이익금액합계 매출금액합계 매출금액 이익배부금액
A            A1         10,000      300,000    100,000    333
A            A2         10,000      300,000    200,000    6667
B            B1         0           750,000    250,0000    0
B            B2         0           750,000    500,000     0
C            C2         30,000       0            0       15000
C            C2         30,000       0            0       15000

이익배분

매출금액이나 이익금액으로 배분하는 경우가 많다

배분할 이익 금액은 존재하지만 매출이 없는경우에는 해당부서 담당자에게
균등하게 배분 될 수 있도록 처리하라

cursor 사용, cursor방법이 아닌 일괄처리방식으로도 만들기

1. 매출, 이익이 없는 부서, 담장자가 존재하기 때문에 [담당자]테이블 기준으로
   자료를 취합하는게 좋다
   (담장자테이블을 기준으로 매출,이익 등 join)

2. 매출이 없는 부서의 경우 담당자별로 균등 배분 로직이 필요함

3. 계산을 용이하게 하기 위해서 #임시테이블을 활용하면 보다 효과적으로
   만들 수 있다

*/

use db1

-- 담당자 테이블 생성
create table 담당자(
	부서코드 nvarchar(30),
	담당자코드 nvarchar(30)
)

insert into 담당자 (부서코드, 담당자코드) values 
('A','A1'),
('A','A2'),
('B','B1'),
('B','B2'),
('C','C1'),
('C','C2')

-- 매출 테이블 생성
create table 매출(
	부서코드 nvarchar(30),
	담당자코드 nvarchar(30),
	매출금액 numeric(18,0)
)

insert into 매출 (부서코드, 담당자코드, 매출금액) values
('A','A1',100,000),
('A','A2',200,000),
('B','B1',250,000),
('B','B2',500,000)


-- 이익 테이블 생성
create table 이익(
	부서코드 nvarchar(30),
	이익금액 numeric(18,0)
)

insert into 이익 (부서코드, 이익금액) values
('A', 10000),
('C', 30000)


select A.부서코드, 매출금액합계 = isnull(sum(B.매출금액),0), 담당자수 = count(*)
into #매출합계
from 담당자 A 
left join 매출 B on A.부서코드 = B.부서코드
and A.담당자코드 = B.담당자코드
group by A.부서코드

select * from #매출합계

-- cursor문에 사용할 임시테이블 생성
select A.부서코드, A.담당자코드, 
	   매출금액 = isnull(B.매출금액,0),
	   매출금액합계 = isnull(D.매출금액합계,0),
	   이익금액합계 = isnull(C.이익금액,0),
	   부서담당자수 = D.담당자수,
	   이익배부금액 = convert(numeric(18,0),0)
into #배부결과
from 담당자 A
left join 매출 B on A.부서코드 = B.부서코드 and A.담당자코드 = B.담당자코드
left join 이익 C on A.부서코드 = C.부서코드 
left join #매출합계 D on A.부서코드 = D.부서코드

select * from #배부결과


declare cur_profit_sharing cursor for
select 부서코드, 담당자코드, 매출금액, 매출금액합계, 이익금액합계, 부서담당자수 -- corsor문에 사용할 컬럼 가져오기
from #배부결과

open cur_profit_sharing

declare @cur_profit_sharing_부서코드 nvarchar(30),
		@cur_profit_sharing_담당자코드 nvarchar(30),
		@cur_profit_sharing_매출금액 numeric(18,0),
		@cur_profit_sharing_매출금액합계 numeric(18,0),
		@cur_profit_sharing_이익금액합계 numeric(18,0),
		@cur_profit_sharing_부서담당자수 int

while (1 = 1)
	begin

		fetch next from cur_profit_sharing into
		@cur_profit_sharing_부서코드,
		@cur_profit_sharing_담당자코드, 
		@cur_profit_sharing_매출금액, 
		@cur_profit_sharing_매출금액합계,
		@cur_profit_sharing_이익금액합계,
		@cur_profit_sharing_부서담당자수

		if @@FETCH_STATUS <> 0 break -- while문 탈출

		if @cur_profit_sharing_매출금액합계 = 0 begin
			select * from #배부결과 A
			update A set
			A.이익배부금액 = @cur_profit_sharing_이익금액합계 * (1.0 / @cur_profit_sharing_부서담당자수)
			where A.부서코드 = @cur_profit_sharing_부서코드
			and A.담당자코드 = @cur_profit_sharing_담당자코드
		end else begin
			select * from #배부결과 A
			update A set
			A.이익배부금액 = @cur_profit_sharing_이익금액합계 * (@cur_profit_sharing_매출금액 / @cur_profit_sharing_매출금액합계)
			where A.부서코드 = @cur_profit_sharing_부서코드
			and A.담당자코드 = @cur_profit_sharing_담당자코드	
		end

	end

close cur_profit_sharing
deallocate cur_profit_sharing

select * from #배부결과
order by #배부결과.담당자코드

-------------------------------------------------------------------------------------------------------------

-- 일괄처리방식
-- 가능하면 속도가빠른 일괄처리방식을 사용한다

select * from #배부결과

update A set
이익배부금액 = iif(A.매출금액합계 = 0, A.이익금액합계 = (1.0 / A.부서담당자수),
				   A.이익금액합계 = (A.매출금액 / A.매출금액합계))
from #배부결과 A

select * from #배부결과
order by 부서코드, 담당자코드