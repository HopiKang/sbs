-- update문

create table 매출(
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0),
	단가 numeric(18,0),
	금액 numeric(18,0),
)

insert into 매출 (일자, 제품, 수량, 단가, 금액)
values ('20200101', 'A1', 10, 100, 1000), ('20200102', 'A2', 20, 200, 4000)

create table 단가(
	제품 nvarchar(30),
	단가 numeric(18,0)
)

insert into 단가 (제품, 단가)
values ('A1', 150), ('A2', 250)

select * from 매출
select * from 단가

-- 1
-- 일자가 20200102 제품이 A2인 자료를 찾아서
-- 수량을 2개 증가 시키고 단가 금액은 변경하지않는다

update 매출 set 수량 = 수량 +2 where 일자 = '20200102' and 제품 = 'A2'
-- set 뒤가 바뀌는곳 whare 뒤가 찾는곳
-- 왠만하면 select * from 매출 where 일자 = '20200102' and 제품 = 'A2'로 바꿔야 할곳을 찾아놓고
-- select * from을 update로 새로 작성해서 확인하는것이 실수를 줄일 수 있는 방법이다

-- 2
-- 일자가 20200101 제품이 A1인 자료를 찾아서 수량을 14개로
-- 변경하고 금액도 변경(확상 유형 작성 - 별칭)

update 매출 set 수량 = 14 where 일자 = '20200101' and 제품 = 'A1'

update A set A.수량 = 14, A.금액 = 14 * A.단가
from 매출 A
-- 매출테이블을 A로 잠시지정한다
where 일자 = '20200101'
and 제품 = 'A1'

-- 3
-- 단가 테이블에서 변경된 단가를 찾아서 매출 테이블의 단가와 금액을 변경
-- join 활용
-- select * from 매출 A inner join 단가 B on A.제품 = b.제품 

select * from 매출
select * from 단가

select * from 매출 A inner join 단가 B on A.제품 = b.제품
-- inner join으로 매출과 단가테이블을 붙여서 볼수있다, on으로 A제품과 B제품의 공통점을 찾아서 붙인다

update A set A.단가 = B.단가, A.금액 = B.단가 * A.수량
from 매출 A inner join 단가 B on A.제품 = b.제품
-- inner join으로 매출테이블과 단가테이블을 붙여서 활용한다

---------------------------------------------------------------------------------------------------------------------
--
create table 매출(
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0),
	단가 numeric(18,0),
	금액 numeric(18,0),
)

insert into 매출 (일자, 제품, 수량, 단가, 금액)
values (20200101, 'A1', 10, 100, 1000), (20200102, 'A2', 20, 200, 4000)

create table 단가(
	제품 nvarchar(30),
	단가 numeric(18,0),
	사용 nvarchar(10)
)

insert into 단가 (제품, 단가, 사용)
values ('A1', 150, 'Y'), ('A2', 250, 'N')

select * from 매출
select * from 단가

-- 1
-- 일자가 20200101 제품이 A1인 자료를 찾아서 삭제
-- delete from 테이블명 where 컬럼 = '삭제할 대상값'

select * from 매출
where 일자 = 20200101
and 제품 = 'A1'

delete from 매출
where 일자 = '20200101'
and 제품 = 'A1'

-- 2
-- 위 자료를 동일하게 삭제 처리(확장 유형 작성 - 별칭)
--  - 1번에서 이미 삭제된 자료를 2번에서 또다시 삭제하면
--    변경되는 상황을 관찰하기

select * from 매출
where 일자 = 20200101
and 제품 = 'A1'

delete A
from 매출 A
where 일자 = '20200101'
and 제품 = 'A1'

-- 3
-- 단가 테이블에서 사용 컬럼 값이 N인 제품을 찾아서 해당 매출
-- 자료만 삭제처리 하세요
-- inner join사용하기

select * from 매출
select * from 단가

select * from 매출 A inner join 단가 B on A.제품 = b.제품

delete A
from 매출 A inner join 단가 B on A.제품 = b.제품
where B.사용 = 'N'




-- 시스템 변수로 오류 및 처리건수 체크
--@@error 방금 실행한 sql 문장이 오류가 있었는지 알려준다
-- [0] 성공적으로 실행이 되었다는뜻
-- [0]이 아닌 모든 값 = 실행중 오류가 발생한것

--@@rowcount 방금 실행한 sql 문장이 몇 개의 행을 실제로 처리 했는지 알려준다
-- [0] 단 한건도 처리 또는 조회 하지 못한 경우
-- [1] 한건 처리 또는 조회됨
-- [100] 100건이 처리되거나 조회된것
--error와 rowcount는 변수선언없이 사용가능하다

create table 매출 (
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0) default 0 null,
	primary key (일자, 제품)
)

select 작업번호 = '1-1', [ERROR] = @@ERROR, [rowcount] = @@ROWCOUNT

-- 2 추가
insert into 매출 (일자, 제품, 수량)
values ('20200101', 'A1', 10), ('20200102', 'A2', 20), ('20200103', 'A3', 30)

select 작업번호 = '2-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select 작업번호 = '2-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

-- 3 수정
update A set A.수량 = 15 from 매출 A
where A.일자 = '20200101' and A.제품 = 'A1'

select 작업번호 = '3-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select 작업번호 = '3-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

--4 삭제
delete A from 매출 A where A.일자 = '20200101' and A.제품 = 'A4'

select 작업번호 = '4-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select 작업번호 = '4-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT

--5 모든 자료 조회
select * from 매출

select 작업번호 = '5-0', [error] = @@ERROR, [rowcount] = @@ROWCOUNT
select 작업번호 = '5-1', [error] = @@ERROR, [rowcount] = @@ROWCOUNT




--transaction(트랜잭션)
--실행중 오류가 발생했을시 롤백이 되는것
--처리구성도

--1. begin tran 트랜잭션 시작
--2. 자금 이제 처리
--3. 성공여부 - @@error @@rowcount 등 작업 이상여부 체크
--4. 통장잔고 (-)처리
--5. 성공여부 @@error @@rowcount 등 작업 이상여부 체크
--6. rollback tran 트랜잭션 취소 - commit tran 트랜잭션 완료
--7. 위의 작업 DB에 정상 반영

create table 매출(
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0) default 0 null,
	primary key (일자, 제품)
)

insert into 매출 (일자, 제품, 수량)
values ('20200101', 'A1', 10), ('20200102', 'A2', 20)

select * from 매출

--변수생성
declare @int_실패여부 int
set @int_실패여부 = 0

begin tran

update A set A.수량 = 15 from 매출 A
where A.일자 = '20200101' and 제품 = 'A1'

if @@ERROR <> 0 or @@ROWCOUNT <> 1 set @int_실패여부 = 1 

delete A from 매출 A where A.일자 = '20200105' and A.제품 = 'A5'

if @@ERROR <> 0 or @@ROWCOUNT <> 1 set @int_실패여부 = 1 

if @int_실패여부 = 0 begin
	commit tran
end else begin
	rollback tran
end

select * from 매출

select * from 매출 A
where A.일자 = '20200101' and 제품 = 'A1'



-- lock
-- 여러사람이 데이터베이스를 같이 수정하거나 사용할때 사용하는것
-- 트랜잭션 격리 수준 (transction solation lavel)
-- read committed 격리수준이 default

begin tran

update A set A.수량 = A.수량 + 5 from 매출 A
where A.일자 = '20200101' and A.제품 = 'A1'
-- 1사용자가 begin tran으로 사용시 2사용자가 사용이 불가하다 (lock이 걸린상황이다)
-- 2사용자는 계속 실행상태이고 1사용자가 commit tran을 실행해줄시 바로 2사용자의 명령이 적용된다


select * from 매출

commit tran