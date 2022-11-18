use DB1

sql 명령어 분류
데이터 정의 (ddl), 데이터 조작어 (dml), 데이터 제어어(dcl) 구분

데이터 정의 (data definition language)
관리자나 설계자가 사용한다
create, alter, drop, rename

데이터 조작어 (data manipulation language)
select, insert, update, delete
결제 >> 허가 >> dml권한 >> 사용

데이터 제어어(data control language)
데이터의 보안, 무결성, 데이터 복구, 병행 수행제어
commit, rollback, rebock, grant


tcl 데이터베이스 트랜젝션
논리적인 여산의 집합이다

------------------------------------------------------------------------------------
select A.컬럼1, A.컬럼2, A.* from 테이블이름 as A

select * from 테이블이름
where 컬럼 = 키 또는 null 또는 not null
and 컬럼 = 키

select distinct 컬럼 from 테이블이름
distinct 중복된 키값을 뭉쳐준다

-------------------------------------------------------------------------------------
요즘은 테이블 하나에 모든 데이터를 모아놓지않고
테이블을 객체처럼 다 나눠놓는다 (정규화)

조인 (join) 연결하다, 합하다

select * from 테이블1
select * from 테이블2

select A.*, B.* form 테이블1 A, 테이블2 B

if object_id(N'제품', 'U') is not null drop table 제품
-- 제품테이블이 있는경우 제품테이블을 삭제하고 새로만들어준다

create table #제품(
	제품코드 nvarchar(30),
	제품명 nvarchar(30)
)

insert into #제품 (제품코드, 제품명) values ('A1', '사과'), ('A2', '당근')

create table #매출(
	매출일자 nvarchar(08),
	제품코드 nvarchar(30),
	매출수량 numeric(18,0),
	매출단가 numeric(18,0),
	매출금액 numeric(18,0)
)

insert into #매출 (매출일자, 제품코드, 매출수량, 매출단가, 매출금액) values 
('20200101', 'A1', 10, 100, 1000),
('20200102', 'A2', 20, 200, 4000),
('20200103', 'A3', 30, 300, 9000)

select A.*, B.* from 제품 A, 매출 B
-- 제품테이블과 매출테이블을 모두 조회

select B.*, A.제품명 from 제품 A, 매출 B
where A.제품코드 = B.제품코드                   
-- 제품테이블과 매출테이블 안에 제품코드칼럼값이 연결되서 조회

select A.*, B.제품명 from 매출 A, 제품 B
where A.제품코드 = B.제품코드
and A.매출일자 <> '20200102'
-- A테이블과 B테이블이 제품코드칼럼으로 조인하고 매출일자가 20200102가 아닌값을 조회하고있다(<> 은 아닌값)

select A.*, B.제품명 from 매출 A
inner join 제품 B on A.제품코드 = B.제품코드
and A.매출일자 != '20200102'
-- 위와 같은값을 조회하고있다

명령에는 and, or, not, ()로 조건을 추가할수있다
(속도가 가장빠르다)

inner join(내부조인) : 동일하게 존재하는 자료만을 결과에 포함하게 한다
outer join(외부조인)
full join(전체조인)
left outer join(왼쪽 외부조인)

select A.*, B.제품명 from 매출 A
inner join 제품 B on A.제품코드 = B.제품코드
and A.매출일자 != '20200102'
-- 위는 매출 A가 기준이고

select A.*, B.제품명 from 제품 A
inner join 매출 B on A.제품코드 = B.제품코드
and A.매출일자 != '20200102'
-- 여기는 제품테이블이 기준이된다
