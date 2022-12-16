use db1

/*
입력수량을 sp의 파라미터로 받아 유통기한순으로 재고수량 범위내 예약을 처리한다
ex) 20개 추가 예약시 : [202010월] 5개, [20211월] 10개, [202103월] 5개 + 예약처리 가능
*/

select * from #재고




create procedure dbo.sp08_우선순위예약
	@입력수량 numeric(18,0)

as
begin

	set nocount on

	-- 재고 임시테이블 생성
	create table #재고(
	유통기한 nvarchar(10),
	재고수량 numeric(18,0),
	예약수량 numeric(18,0),
	가능수량 numeric(18,0)
	)

	-- 재고 입시테이블 내용입력
	insert into #재고 (유통기한, 재고수량, 예약수량) values
	('202005',10,10),
	('202010',10,5),
	('202011',20,10),
	('202103',30,0),
	('202209',40,0)

	-- 가능수량 update
	update #재고 set 
	가능수량 = 재고수량 - 예약수량
	from #재고

	select 유통기한, 재고수량, 예약수량, 가능수량, 순번 = identity(int,1,1)
	into #커서1
	from #재고
	where 재고수량 - 예약수량 > 0
	order by 유통기한 -- 순서대로 예약을 해야하기때문에 정렬해준다

	declare @커서1_유통기한 nvarchar(10),
			@커서1_재고수량 numeric(18,0),
			@커서1_예약수량 numeric(18,0),
			@커서1_가능수량 numeric(18,0),
			@커서1_순번 int = 1.
			@커서1_총건수 int = @@rowcount,
			@처리잔량 = numeric(18,0) = 0,
			@반영수량 = numeric(18,0) = 0

	set @처리잔량 = 입력수량

	begin tran 

		while(@커서1_순번 <= @커서1_총건수)
		begin
			select @커서1_유통기한 = 유통기한,
				   @커서1_재고수량 = 재고수량,
				   @커서1_예약수량 = 예약수량,
				   @커서1_가능수량 = 가능수량
			from #커서
			where 순번 = @커서1_순번

			if @처리잔량 <= @커서1_가능수량
			begin
				set @반영수량 = @처리잔량
			end else begin
				set @반영수량 = @커서1_가능수량
			end

			update A set
			A.예약수량 = A.예약수량 + @반영수량
			from #재고 A
			 where A.유통기한 = @커서1_유통기한
			 and A.재고수량 - A.예약수량 - @반영수량 >= 0

			 if @@ERROR <> or @@ROWCOUNT <> 1 break -- 오류시 while문 탈출

			 set @처리찬량 = @처리잔량 - @반영수량

			 if @처리잔량 = 0 break

			 set @커서1_순번 = @커서1_순번 + 1

		end

	if @처리잔량 = 0 commit tran else rollback tran

	select *, 처리완료여부 = iif(@처리잔량 = 0, '성공', '실패')
	from #재고
	order by 유통기한

	exec dbo.sp08_우선순위예약 @입력수량 = 20

end

drop table #재고

/*
select A.유통기한, A.재고수량, A.예약수량, A.가능수량, 
	처리완료여부 = iif(sum(A.예약수량) < 40,sum(A.예약수량),0)
	from #재고 A
	group by A.예약수량, A.유통기한, A.재고수량, A.가능수량

*/