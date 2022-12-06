/*-------------------------------------------------------------
exec dbo.sp_140_사용자권한_레코드셋
	@in_사용자코드 = 'C100'
-------------------------------------------------------------*/

create procedure dbo.sp_140_사용자권한_레코드셋
	@in_사용자코드 nvarchar(30)

as
begin
	
	set nocount on;

	if left(@in_사용자코드, 1) = 'A'
		begin
			select 결과코드 = '1',
				   결과메세지 = '승인'
		end

	else
		begin
			select 결과코드 = '9',
				   결과메세지 = '미승인'
	end

end

/*-------------------------------------------------------------
declare @out_결과코드 int,
		@out_결과메세지 nvarchar(500)

exec @out_결과코드 = dbo.sp_140_사용자권한_출력변수
	 @in_사용자코드 = 'C100',
	 @out_메세지 = @out_결과메세지 output
-------------------------------------------------------------*/

create procedure dbo.sp_140_사용자권한_출력변수
	@in_사용자코드 nvarchar(30),
	@out_메세지 nvarchar(500) output


as
begin

	set nocount on;

	if left(@in_사용자코드, 1) = 'A'
		begin
			set @out_메세지 = '승인'
			return(1)
		end else begin
			set @out_메세지 = '미승인'
			return(99)
		end

end

/*---------------------------------------------------------------------------------------------
exec dbo.sp_140_제품_조회_레코드셋
	@in_제품명 = '도'
	@in_사용자코드 = 'A101'
---------------------------------------------------------------------------------------------*/

create procedure dbo.sp_140_제품_조회_레코드셋
	@in_제품명 nvarchar(100),
	@in_사용자코드 nvarchar(30)


as
begin

	set nocount on;

	create table #제품(
		제품코드 nvarchar(30),
		제품명 nvarchar(100)
	)

	-- 임시테이블에 기본자료 입력
	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	insert into #제품 (제품코드, 제품명) values ('A5', '모과')
	insert into #제품 (제품코드, 제품명) values ('A6', '당근')

	-- 처리결과를 저장할 임시테이블 생성
	create table #실행결과(
		결과코드 int,
		결과메세지 nvarchar(500)
	)

	insert into #실행결과(결과코드, 결과메세지)
	exec dbo.sp_140_사용자권한_출력변수
		@in_사용자코드 = @in_사용자코드

	declare @out_결과코드 int,              -- return값 저장용
			@out_결과메세지 nvarchar(500)   -- @out_메세지 저장용

	-- 임시테이블에 저장된 결과코드, 메세지 값을 변수에 다시 저장
	select @out_결과코드 = A.결과코드,
		   @out_결과메세지 = A.결과메세지
	from #실행결과 A

	-- 위 프로시저 결과코드가 1이 아니면 더이상 진행하지 않고 중지
	if @out_결과코드 <> 1
		begin
			return
		end

	select A.제품코드, A.제품명 from #제품
	where A.제품명 like '%' + @in_제품명 + '%'

end




/*----------------------------------------------------------------------------------------
declare @return_value in
		@out_메세지 nvarchar(500)
select @out_메세지 = N'@out_결과메세지'

exec dbp.sp_140_제품_조회_출력변수
	@in_제품명 = '도'
	@in_사용자코드 = 'C101'

select 결과코드 = @out_메세지,
	   결과메세지 = @return_value
----------------------------------------------------------------------------------------*/
create procedure dbp.sp_140_제품_조회_출력변수
	@in_제품명 nvarchar(100)
	@in_제품코드 nvarchar(30)

as
begin

	set nocount on;

	create table #제품(
		제품코드 nvarchar(30),
		제품명 nvarchar(100)
	)

	-- 임시테이블에 기본자료 입력
	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	insert into #제품 (제품코드, 제품명) values ('A5', '모과')
	insert into #제품 (제품코드, 제품명) values ('A6', '당근')

	declare @out_결과코드 int -- return값 저장용
			@out_결과메세지 nvarchar(500) -- @out_메세지 저장용

	exec @out_결과코드 = sp_140_사용자권한_출력변수
		 @in_사용자코드 = @in_사용자코드
		 @out_메세지 = @out_결과메세지 output

	-- 위 프로시저 결과코드가 1이 아니면 더이상 진행하지 않고 중지
	if @out_결과코드 <> 1
		begin
			return
		end

	select A.제품코드, A.제품명 from #제품 A
	where A.제품명 like '%' + @in_제품명 + '%'

end


