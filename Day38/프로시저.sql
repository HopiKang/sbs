저장프로시저

일반sql처리방식
1. 트랜잭션 시작 (begin tran)
2. 입고테이블 신규 등록 (insert)		여러번 서버호출		요청시 마다 sql 코드 컴파일(해석) 후 실행
3. 재고테이블 존재 확인 (select)          ------------>		보안노출 / 속도저하
4. 재고테이블 변경 (insert/update)        sql 코드 노출
5. 트랜잭션 종료 (commit)

저장프로시저
1. 트랜잭션 시작 (begin tran)           한번으로 결과 확인     입고처리 프로시저 등록(일반적으로 변경시만 컴파일)               
2. 입고처리 저장 프로시저                 ------------>        - 입력값 : 제품코드, 입고수량
3. 트랜잭션 종료 (commit)               보안강화/속도개선      - 출력값 : 오류여부, 오류내용


저장프로시저를 만드는방법
위치 : 데이터베이스 > 프로그래밍 기능 > 저장 프로시저

use DB1 -- 데이터베이스 위치 확인하기

create procedure [DB1].[저장프로시저 이름] 
(@in_제품코드 nvarchar(50), @in_제품명 nvarchar(100))

as

begin
	select 제품코드 = @in_제품코드
		   제품명 = @in_제품명

end

exec [dbo].[저장프로시저 이름] 'A1', '딸기' -- 프로시저 실행

drop procedure [dbo].[저장프로시저 이름] -- 삭제

-------------------------------------------------------------------------------------------------------
1.테이블 만들어짐
2.값이 insert되고
3.전체테이블 조회
4.파라미터로 받은 제품코드와 제품코드와 제품명을 출력 = 제품명이 &도 인것만

use db1

create procedure ins.ert
(@in_제품명 nvarchar(100))

as

begin

	set nocount on;
	
	create table #제품(
		제품코드 nvarchar(10),
		제품명 nvarchar(30)
	)

	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	insert into #제품 (제품코드, 제품명) values ('A5', '모과')
	insert into #제품 (제품코드, 제품명) values ('A6', '당근')


	select * from #제품

	select 제품코드, 제품명
	from #제품
	where 제품명 like '%' + @in_제품명 + '%'

end

exec ins.ert '도' 

-------------------------------------------------------------------------------

set nocount on; -- sql명령이 실행될때 반영되는 행의 개수가 호출한 시스템의 리턴되면서 오동작되는것을 방지해줌