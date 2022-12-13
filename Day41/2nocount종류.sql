create procedure dbo.sp08_set설정
as
begin

	set nocount on

	set transaction isolation level read uncommitted
	-- 사용자가 데이터를 변경할때 대기현상이 발생될수있다
	-- 이때 아래 위 명령으로 변경되는 데이터도 대기 없이 읽을 수 있다
	-- 그러나 부정확한 데이터가 조회 될수도있다

	set lock_timeout 5000
	-- 다른 사용자가 데이터를 변경하여 lock이 발생되면 대기가 발생한다
	-- 기다릴수있는 최대 시간을 지정해준다

	
	create table set테스트 (제품코드 nvarchar(30), 판매수량 numeric(18,0))

	insert into set테스트 (제품코드, 판매수량) values
	('A1', 100), ('A2', 200), ('A3', 300)
	
	select 제품코드, 판매수량 from set테스트 (nolock) 
	where 제품코드 = 'A1'
	-- 특정 테이블을 read uncommitted로 읽으려면 nolock을 추가하면된다(변경되지않는 사항도 조회될수있다)

	set ansi_warnings off
	set arithignore on
	set arithabort off
	-- 0으로 나눌때 오류가 발생하지 않도록 설정하기위해서 위 3가지를 추가해주면된다

	select 0나누기결과 = 100/0 -- 예로 이럴경우 오류가 발생하지않고 null로 처리된다
	select 0나누기결과 = isnull(100/0,0)
end