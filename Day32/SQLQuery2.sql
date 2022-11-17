use DB4

-- 임시테이블 생성함
create table #매입 (
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0) default 0 null,
)
-- 임시테이블 insert
insert into #매입 (일자, 제품, 수량)
values ('20200101', 'A1', 100),
('20200105', 'A1', 200),
('20200201', 'A4', 400),
('20200301', 'A5', 500)

-- 임시테이블 생성함
create table #매출 (
	일자 nvarchar(08),
	제품 nvarchar(30),
	수량 numeric(18,0) default 0 null,
)

-- 임시테이블 insert
insert into #매출 (일자, 제품, 수량)
values ('20200101', 'A1', 10),
('20200102', 'A2', 20),
('20200103', 'A3', 30),
('20200401', 'A4', 40)

select * from #매입
select * from #매출


create table #임시1(
	년월 nvarchar(06),
	제품 nvarchar(30),
	매입수량 numeric(18,0) default 0 not null,
	매출수량 numeric(18,0) default 0 not null,
)

select * from #임시1

insert into #임시1 (년월, 제품, 매입수량)
select left(A.일자, 6), A.제품, 매입수량 = sum(A.수량) from #매입 A
group by left(A.일자, 6), A.제품
--group by : 같은것을 묶어줌

insert into #임시1 (년월, 제품, 매출수량)
select left(A.일자, 6), A.제품, 매출수량 = sum(A.수량) from #매출 A
group by left(A.일자, 6), A.제품

select 년월, 제품, 매입수량 = sum(매입수량), 매출수량 = sum(매출수량)
from #임시1
group by 년월, 제품
order by 년월, 제품
-- order by : 정렬



drop table #매입
drop table #매출
drop table #임시1

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
('E', '20200107', 500)

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


select * from #제품
select * from #매입
select * from #매출



--iif 사용법
--declare @a int = 50, @b int = 40;
--select result = iif(@a > @b, 'true', 'false')

--제고수불부를 출력하라(@수불시작일자 : 20200101, @수불종료일자 : 20200131)

20200201이후 데이터는 수불부 대상에서 제외됨 (B,C 제품)
매입, 매출 수량이 없더라도 전체 제품코드는 모두 출력하세요

insert into #임시1 (년월, 제품, 매입수량)
select left(A.일자, 6), A.제품, 매입수량 = sum(A.수량) from #매입 A
group by left(A.일자, 6), A.제품

select 년월, 제품, 매입수량 = sum(매입수량), 매출수량 = sum(매출수량)
from #임시1
group by 년월, 제품
order by 년월, 제품

create table #임시1(
	제품코드 nvarchar(06),
	제품명 nvarchar(30),
	기초수량 numeric(18,0) default 0 not null,
	매입수량 numeric(18,0) default 0 not null,
	매출수량 numeric(18,0) default 0 not null,
	기말수량 numeric(18,0) default 0 not null
)



insert into #임시1 (제품코드, 제품명)
select A.제품코드, A.제품명 from #제품 A

update #임시1
set 기초수량 = 90
where 제품명 = '사과'

insert into #임시1 (제품코드, 제품명, 기초수량, 매입수량, 매출수량, 기말수량)
select A.제품코드, 매입수량 = iif(A.매입일자 > 20200101, A.매입수량, 0) from #제품 A, #매입 B, #매출 C
--group by A.제품코드, A.매입수량, A.매입일자

insert into #임시1 (제품코드, 매출수량)
select A.제품코드, 매출수량 = iif(A.매출일자 < 20200131, A.매출수량, 0) from #매출 A


select iif(A.매입일자 > 20200101, A.매입수량, 0)

insert into #임시1(제품코드,제품명,매입수량,매출수량,기말수량)
select A.제품코드, A.제품명 ,
매입수량 = iif(B.매입일자 > 20200101, B.매입수량, 0),
매출수량 = iif(C.매출일자 < 20200131, C.매출수량, 0),
기말수량 = 매입수량 - 매출수량
from #제품 A, #매입 B, #매출 C
group by A.제품코드,B.매입일자,B.매입수량,제품명,C.매출일자, C.매출수량
-------------------------------------------------------------------------------
insert into #임시1 (제품코드, 제품명)
select A.제품코드, A.제품명
from #제품 A

insert into #임시1 (제품코드,매입수량)
select A.제품코드 ,매입수량 = iif(A.매입일자 > 20200101, A.매입수량, 0)
from #매입 A
group by A.제품코드, A.매입수량, A.매입일자
--where A.매입수량 > 0

select 제품코드,매입수량 = sum(매입수량), 매출수량 = sum(매출수량), 기말수량 = sum(기말수량)
from #임시1
group by 제품코드,매입수량,매출수량,기말수량
-------------------------------------------------------------------------------------------------
insert into #임시1 (제품코드, 제품명)
select A.제품코드, A.제품명
from #제품 A

select A.제품코드 ,매입수량 = iif(A.매입일자 > 20200101, A.매입수량, 0)
from #매입 A, #임시1 B
where A.제품코드 = B.제품코드
group by B.제품코드, A.제품코드, A.매입일자, A.매입수량


select * from #임시1
drop table #임시1