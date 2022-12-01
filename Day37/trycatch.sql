try catch
- sql 실행시 오류가 있을 경우 예외 처리를 하기위한 방법
- begin try 과 begin catch 을 같이사용해야한다
- 현장에서 사용할때 본인말고 다른사람이 쿼리문을 사용했을때 어디서 오류가 발생했는지 알기위해서


create table #임시1(
	코드 nvarchar(10),
	수량 numeric(18,0)
)
begin try
	insert into #임시1 (코드,수량) values ('A', '30A')
	select 결과 = '성공처리'

end try
begin catch
	select 결과 = N'오류발생'
	오류번호 = @@error
	오류오브젝트 = error_procedure(),
	오류행번호 = error_line(),
	오류메세지 = error_message(),
	오류상태코드 = error_state(),
	오류심각도 = error_severity()
	-- @@ : 시스템 변수

end catch
-- begin try와 end try 사이의 명령어 실행중 오류가 발생했을시 
-- begin catch 와 end catch 사이의 명령어가 실행된다 