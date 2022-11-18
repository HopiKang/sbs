use DB1

--제고수불부를 출력하라(@수불시작일자 : 20200101, @수불종료일자 : 20200131)

--20200201이후 데이터는 수불부 대상에서 제외됨 (B,C 제품)
--매입, 매출 수량이 없더라도 전체 제품코드는 모두 출력하세요

--기말수량 = 기초수량 + 매입수량 - 매출수량

-- 수불부 작성을 위한 테이블 생성밑 자료 입력
create table #제품(
	제품코드 nvarchar(08),
	제품명 nvarchar(30),
)

insert into #제품 (제품코드, 제품명) values 
('A','사과'),
('B','포도'),
('C','딸기'),
('D','수박'),
('E','참외')

create table #매입(
	제품코드 nvarchar(08),
	매입일자 nvarchar(08),
	매입수량 numeric(18,0)
)

insert into #매입 (제품코드, 매입일자, 매입수량) values 
('A', '20191231', 100),
('A', '20200103', 200),
('B', '20200201', 300),
('C', '20200105', 400),
('D', '20200107', 500)

create table #매출(
	제품코드 nvarchar(08),
	매출일자 nvarchar(08),
	매출수량 numeric(18,0),
)
insert into #매출 (제품코드, 매출일자, 매출수량) values 
('A', '20191220', 10),
('A', '20200103', 20),
('B', '20200305', 30),
('B', '20200217', 40),
('C', '20200220', 50)

-- 수불 데이터 집계를 위한 수불작업 임시테이블 생성 및 insert
create table #임시1(
	제품코드 nvarchar(08),
	기초수량 numeric(18,0) default 0,
	매입수량 numeric(18,0) default 0,
	매출수량 numeric(18,0) default 0
)

-- 모든 제품이 출력되기 위해 제품 테이블 정보  insert [모든수량0]
insert into #임시1 (제품코드)
select A.제품코드
from #제품 A

-- 매입데이터 insert
insert into #임시1 (제품코드, 기초수량, 매입수량)
select 제품코드, 기초수량 = sum(iif(매입일자 < '20200101', 매입수량, 0)), 매입수량 = sum(iif(매입일자 >=  '20200101' and 매입일자 <= '20200131', 매입수량, 0))
from #매입
group by 제품코드

-- 매출데이터 insert
insert into #임시1 (제품코드, 기초수량, 매출수량)
select 제품코드, 기초수량 = sum(iif(매출일자 < 20200101, 매출수량 * (-1), 0)), 매출수량 = sum(iif(매출일자 >=  '20200101' and 매출일자 <= '20200131', 매출수량, 0))
from #매출
group by 제품코드

-- 수불결과 집계 및 출력
select A.제품코드, B.제품명, 기초수량 = sum(A.기초수량) , 매입수량 = sum(A.매입수량), 매출수량 = sum(A.매출수량), 기말수량 = sum(A.기초수량 + A.매입수량 - A.매출수량)
from #임시1 A 
inner join #제품 B on A.제품코드 = B.제품코드
group by A.제품코드, B.제품명
order by 제품코드

select * from #제품
select * from #매입
select * from #매출
select * from #임시1
drop table #임시1
drop table #매입