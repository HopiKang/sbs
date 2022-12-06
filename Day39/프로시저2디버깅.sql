디버깅

use db1

------------------------------------------------------------------------------------
begin tran

declare @return_value int
		@out_결과메세지 nvarchar(500)

exec @return_value = [dbo].[sp_130_제품_수정_출력변수반환_디버깅]
	 @in_제품코드 = 'B3',
	 @in_제품명 = '마늘',
	 @out_메세지 = @out_결과메세지 out

select 결과코드 = @return_value,
	   결과메세지 = @out_결과메세지

rollback tran


exec [dbo].[sp_130_제품_수정_출력변수반환_디버깅]
	@in_제품코드 = 'B3',
	@in_제품명 = '마늘',
	@out_메세지 = @out_결과메세지 out
	
---------------------------------------------------------------------------------------------

create procedure [dbo].[sp_130_제품_수정_출력변수반환_디버깅](
	@in_제품코드 nvarchar(30),
	@in_제품명 nvarchar(100),
	@out_메세지 nvarchar(500) output
)

as
begin

	set nocount on;

	declare @int_error int = 0,
			@int_rowcount int = 1

	create table #제품(
		제품코드 nvarchar(30),
		제품명 nvarchar(100)
	)

	insert into #제품 (제품코드, 제품명) values ('A1', '사과')
	insert into #제품 (제품코드, 제품명) values ('A2', '포도')
	insert into #제품 (제품코드, 제품명) values ('A3', '복숭아')
	insert into #제품 (제품코드, 제품명) values ('A4', '무화과')
	
	select = from #제품 A where A.제품코드 = @in_제품코드

	print @in_제품코드 -- 중단점
	print @in_제품명

	update A set A.제품명 = @in_제품명 from #제품 A
	where 제품코드 = @in_제품코드

	select @int_error = @@ERROR, @int_rowcount = @@ROWCOUNT

	print @int_error -- print 값은 메세지에 뜬다
	print @int_rowcount -- 중단점이기때문에 주석처리해도 상관없다
	print concat('@@error =', @int_error, '@@rowcount =', @int_rowcount)

	select * from #제품 A where A.제품코드 = @in_제품코드

	if @int_error <> 0 or @int_rowcount <> 1
		begin
			set @out_메세지 = '제품코드 update 오류'
			return(99)
		end

		set @out_메세지 = '정상처리'
		return(1)

end




	