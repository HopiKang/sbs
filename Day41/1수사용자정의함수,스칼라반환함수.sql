use db1

/*
함수

사용자 정의함수
1. 테이블 반호나 함수
- 여러행, 여러칼럼 출력
2. 스칼라 반환함수
- 단일값 출력

select 등의 sql 명령어에 함수로서 사용이 가능하다
문장내에서 sum이나 count같은 표준 함수 외에 사용자가 원하는 기능을 사용자가 직접 함수를 프로그래밍 작성하여 사용가능하다
print 명령에 사용이 불가능하다
insert, update, delete를 수행하지 못한다

효과
- 프로그래밍의 단순화 및 표준화 성능 및 트래픽을 개선가능하다
- 저장프로시저에 비해 기능이 다소 제약이있다
*/

-- 테이블 반환함수

-- 오늘날짜를 기준으로 전월,당월,익월 만들기

select convert(date,concat('202212','01')
select left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat('202212'.'01'))),112),6)
select left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat('202212'.'01'))),112),6)

/*
테이블 반환방식

1. 다중문 테이블방식
2. 인라인 테이블 방식
*/

-- 다중문 테이블방식

create function dbo.uft07_전월익월 (@입력년월 nvarchar(6))

return @tbl_결과 table (전월 nvarchar(6), 당월 nvarchar(6), 익월 nvarchar(6))

as
begin

	declare @전월 nvarchar(6),
			@익월 nvarchar(6)

	set @전월 select left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat(@입력년월.'01'))),112),6)
	set @익월 select left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat(@입력년월.'01'))),112),6)

	insert into @tbl_결과 (전월, 당월, 익월) values (@전월, @입력년월, @익월)

	return -- 결과표시

end

select * from uft07_전월익월 ('202212')


-- 인라인 테이블 작성방식 -----------------------------------------------------------------------------------------------------

create function dbo.uft07_전월익월 (@입력년월 nvarchar(6))
	return table
	as
		return(select 전월 = left(convert(nvarchar,dateadd(MONTH, -1, convert(date, concat(@입력년월.'01'))),112),6).
					  당월 = @입력년월,
					  익월 = left(convert(nvarchar,dateadd(MONTH, +1, convert(date, concat(@입력년월.'01'))),112),6))

-- 인라인 테이블 작성방식 -----------------------------------------------------------------------------------------------------
create function dbo.ufs07_전월 (@입력년월 nvarchar(6))

return nvarchar(6)
as
begin
	
	declare @전월 nvarchar(6)
	set @전월 left(convert(nvarchar, dateadd(month, -1, convert(date, concat(@입력년월, '01'))), 112), 6)
	return(@전월)

end

select 전월결과 = dbo.ufs07_전월 ('202212')
