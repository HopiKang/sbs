use DB1

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

----------------------------------------------------------------------------

프로시저를 실행할때 3가지 방법

1. 가급적 이방법을 사용, 리턴값이 필요한경우, 조회가 필요한경우
declare @return_value int
exec @return_value = [dbo].[sp06_100_생성테스트]
	@in_제품코드 = N'A1'
	@in_제품명 = N'사과'

select 'return value' = @return_value

2. 조회업무나 프로시저를 확인하지않아도 되는상황
exec @return_value = [dbo].[sp06_100_생성테스트]
	@in_제품코드 = N'A1'
	@in_제품명 = N'사과'


3. 권장하지않는다, 테스트할때 사용
exec @return_value = [dbo].[sp06_100_생성테스트] 'A', '사과'
	
return 

-----------------------------------------------------------------------------

프로시저 이름바꾸는법

exec sp_rename 'sp06_100_생성테스트', 'sp06_100_생성테스트이름변경'

------------------------------------------------------------------------------

use db1

create procedure ins.ert
(@in_제품명 nvarchar(100))

as

begin

	set nocount on; -- sql 명령이 실행 될때 반영되는 행의 갯수가 호출한 시스템에 리턴되면서 오동작을 방지하는 역할
	
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

값을 반환하는방법

1. 레코드셋 반환 방식
- 자료처리를 위한 저장프로시저가 있고 여기에 입력값으로 파라미터로 전달할값이 있다면 (sp : 입력값 , @in_제품코드, @in_제품명)
- 결과 1 = 정상처리

-----------------------------------------------------------------------------------------
작성일 : 2022년 12월 7일
작성자 :
기  능 : 레코드셋 반환을 위한 테스트 프로시저 개발
-----------------------------------------------------------------------------------------
수정일 수정자 요청자 내용

begin tran

exec [dbp].[sp_100_레코드셋반환]
	@in_제품코드 = 'B3', @in_제품명 = '마늘'
rollback tran -- 트렌젝션 실행전으로

-----------------------------------------------------------------------------------------



create procedure [dbo].[sp_100_레코드셋반환]
(@in_제품코드 nvarchar(30), @in_제품명 nvarchar(100))

as

begin

	set nocount on; -- sql 명령이 실행 될때 반영되는 행의 갯수가 호출한 시스템에 리턴되면서 오동작을 방지하는 역할
	
	create table #제품(
		제품코드 nvarchar(30),
		제품명 nvarchar(100)
	)

	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	insert into #제품 (제품코드, 제품명) values ('A5', '모과')
	insert into #제품 (제품코드, 제품명) values ('A6', '당근')


	update A set A.제품명 = @in_제품명
	from #제품 A
	where A.제품코드 = @in_제품명

	-- 정상적이면 @@error = 0, @@rowcount = 1
	if @@ERROR <> 0 or @@ROWCOUNT <> 1
	begin
		select 결과코드 = 99, 결과메세지 = '제품코드 update 오류'
		return
	end

	select 결과코드 = 1, 결과메세지 = '정상처리되었습니다'

end



2. 출력변수 반환 방식
- 결과를 변수로서 반환을 받고싶은방식
- declare @out_결과메세지 nvarchar(500), @return_value int
/*-----------------------------------------------------------------------------------------------------------
begin tran

declare @return_value int, @out_결과메세지 nvarchar(500)
exec @return_value = [dbo].[sp_100_출력변수반환]
	@in_제품코드 = 'B3'
	@in_제품명 = '마늘'
	@out_메세지 = @out_결과메세지

select 결과코드 = @return_value,
	   결과메세지 = @out_결과메세지

rollback tran
-------------------------------------------------------------------------------------------------------------*/

create procedure [dbo].[sp_100_출력변수반환]
(@in_제품코드 nvarchar(30),
@in_제품명 nvarchar(100),
@out_메세지 nvarchar(500) output -- output반드시 적어줘야한다
)

as

begin

	set nocount on; -- sql 명령이 실행 될때 반영되는 행의 갯수가 호출한 시스템에 리턴되면서 오동작을 방지하는 역할
	
	create table #제품(
		제품코드 nvarchar(30),
		제품명 nvarchar(100)
	)

	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	insert into #제품 (제품코드, 제품명) values ('A5', '모과')
	insert into #제품 (제품코드, 제품명) values ('A6', '당근')


	update A set A.제품명 = @in_제품명
	from #제품 A
	where A.제품코드 = @in_제품명

	-- 정상적이면 @@error = 0, @@rowcount = 1
	if @@ERROR <> 0 or @@ROWCOUNT <> 1
	begin
		set @out_메세지 = '제품코드 update 오류'
		return(99) -- 리턴을 만나는순간 프로시저가 종료된다
	end

	set @out_메세지 = '정상처리되었습니다'
	return(1)

end


