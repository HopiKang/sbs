시퀀스(sequence) - 순번, 채번(캐시cache 기능이 있음)

- 전표번호, 고객번호, 제품번호에 사용
- sql 2012버전 이전에는 identity를 사용

create sequence 시퀀스10
	as bigint -- 데이터형, 생략하면 기본값으로 bigint형
	start with 0 -- 최소시작값 0, 생략하면 데이터형에따라 달라진다
	increment by 1 -- 증가값, 1씩증가
	minvalue 0 -- 최솟값 0, 생량하면 데이터형에따라 달라짐
	maxvalue 5 -- 최댓값 5, 생량하면 데이터형에따라 달라짐
	cycle --  최댓값 도달시 다시 시작함, 생략시 반복하지않는다
	no cache; -- 캐시사용여부를 넣어줄수있다, 생략시 기본적으로 캐시사용이된다 

select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10
select 순번 = next value for 시퀀스10

select * from sys.sequences
where name = '시퀀스10'

alter sequence 시퀀스10 restart with 2; -- 시퀀스 시작을 2로 지정


create sequence 시퀀스21
as bigint
start with 1
increment by 2
minvalue 0
maxvalue 5
cycle
-- 맨처음시작은 1로 시작하지만 사이클을 한번돌았을때 0부터 시작해서 0 2 4로 사이클이 돌게된다

create sequence 시퀀스22
as bigint
start with 1
increment by 2
minvalue 0
maxvalue 5
-- 사이클이 없기때문에 최댓값이상에 도달하게되면 다음시퀀스가 생성되지않는다

create sequence 시퀀스23
as bigint
start with -1
increment by -2
minvalue -5
maxvalue 0
cycle
-- -1 -3 -5 다음으로 작아지는 시퀀스기때문에 max값인 0으로 사이클이 돌기시작한다

select next value for 시퀀스21
select next value for 시퀀스21
select next value for 시퀀스21
select next value for 시퀀스21
select next value for 시퀀스21

select next value for 시퀀스22
select next value for 시퀀스22
select next value for 시퀀스22
select next value for 시퀀스22
select next value for 시퀀스22
select next value for 시퀀스22

select next value for 시퀀스23
select next value for 시퀀스23
select next value for 시퀀스23
select next value for 시퀀스23
select next value for 시퀀스23
select next value for 시퀀스23


create sequence 시퀀스31
as int
increment by 1
-- int 데이터 형식으로 만들어져서 최솟값과 최댓값이 int값으로 설정됨

select next value for 시퀀스31
select next value for 시퀀스31
select next value for 시퀀스31

create sequence 시퀀스32
increment by 1
-- 기본값이 bigint 값으로 설정됨

create sequence 시퀀스33
as numeric(5,1)
start with 0
increment by 0.1
-- 소숫점은 사용할수없음