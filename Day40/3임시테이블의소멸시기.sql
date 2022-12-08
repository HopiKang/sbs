use db1

/*
1.
sp안에서 create 명령을 통해 생성된 #임시테이블은 sp가 실행 종료되면 완전히
소멸되어 더이상 사용할 수 없다

2.
이미 소멸된 이름의 #임시테이블과 동일한 이름으로 #임시테이블을 다시 생성하는
것은 가능하다
sub2가 두번 호출하여 실행해보면 실행되는것을 알수있다

3.
특정 sp에서 임시테이블을 생성하여 사용중인 경우 다른 sp에서 동일한 이름의
임시테이블은 생성할 수 없다
main에서 이미 사용중인 #임시1을 사용 상태인 sub3를 호출하여 동일한 #임시1 임시테이블을 생성시 임시테이블
이름이 중복되기 때문에 오류가 발생한다
*/

exec dbo.sp_170_main

-------------------------------------------------------------------
create procedure dbo.sp_170_main

as
begin

	set nocount on

	create table #임시1(
		일자 nvarchar(30),
		수량 numeric(18,0)
	)

	exec dbo.sp_170_sub1 -- #임시1 안의내용 insert

	select * from #임시1 -- #임시1 조회

	exec dbo.sp_170_sub2 -- #임시2 create 및 insert

	exec dbo.sp_170_sub2 -- #임시2 create 및 insert
						 -- #임시2 소멸 (exec문안에 select * from #임시2 작성해줬으면 조회됐을듯)
	select * from #임시2 -- #임시2 내용 조회 오류

	exec dbo.sp_170_sub3 -- #임시1 create 및 insert 불가 (main문에 #임시1이 이미 생성되어있음)

	select * from #임시1 -- #임시1 조회 불가

end

--------------------------------------------------------------

create procedure dbo.sp_170_sub1

as
begin

	set nocount on

	insert into #임시1 (일자, 수량) values
	('20221208',20)

end

---------------------------------------------------------------

create procedure dbo.sp_170_sub2

as
begin

	set nocount on

	create table #임시2(
		일자 nvarchar(30),
		수량 numeric(18,0)
	)

	insert into #임시2 (일자, 수량) values
	('20221208', 20)

end

---------------------------------------------------------------

create procedure dbo.sp_170_sub3

as
begin

	set nocount on

	create table #임시1(
		일자 nvarchar(30),
		수량 numeric(18,0)
	)

	insert into #임시1 (일자, 수량) values
	('20221208', 20)

end