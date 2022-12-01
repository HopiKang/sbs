goto
가급적 속도때문에 사용을 잘하지않는다

select
update
insert
delete
만약 4가지 명령어가 있을때 따로쿼리문을

declare @int_숫자 int

set @int_숫자 = 0

set @int_숫자 = @int_숫자 + 1
set @int_숫자 = @int_숫자 + 1

goto 이동위치1 -- 이동위치1로 이동

set @int_숫자 = @int_숫자 + 1
set @int_숫자 = @int_숫자 + 1
set @int_숫자 = @int_숫자 + 1

goto 이동위치1: -- 여기로 이동해서 @int_숫자 출력

select 결과 = @int_숫자

--------------------------------------------------------------------------------
커서
-- 커서대신쓰려면 임시테이블을 사용하면된다

cursor
한행씩불러서 처리를해준다
숫차적이고 단계적으로 처리할때 사용
보통 데이터베이스 전체를 조회해서 사용하는게 빠르다
하지만 데이터양이 많아서 사용하기 힘들때 cursor를 활용하기도한다

create table #작업(
	코드 nvarchar(10),
	수량 numeric(18,0)
)

insert into #작업 (코드, 수량) values
 ('A1',10),
 ('A2',20),
 ('A3',30)

select * from #작업

declare 커서1 cursor for -- 커서생성
select 코드, 수량 from #작업
where 코드 < 'A3'
order by 수량 desc

open 커서1 -- 커서1오픈

declare @커서1코드 = nvarchar(10),
		@커서1_수량 = numeric(18,0) -- 커서데이터를 읽을 변수를 선언

while (1 = 1) begin -- 무한반복

fetch next from 커서1 into @커서1코드, @커서1_수량 -- 한건씩(한행) 입력

if @@FETCH_STATUS <> 0 break -- 값이 없으면 무한반복문 탈출
select 코드 = @커서1코드, 수량 = @커서1_수량 -- 읽은값 출력

end

close 커서1 -- 커서1종료
deallocate 커서1 -- 커서1삭제

drop table #작업


임시테이블을 사용했을때


declare @커서1_코드 nvarchar(10),
		@커서1_수량 numeric(18,0),
		@커서1_순번 int = 1
		@커서1_총건수 int = @@rowcount

while (@커서1_순번 <= @커서1_총건수) begin

	select @커서1_코드 = 코드, @커서1_수량 = 수량 from #커서1
	where 순번 = @커서1_순번

	select 코드 = @커서1_코드, 수량 = @커서1_수량

	set @커서1_순번 = @커서1_순번 + 1
end


