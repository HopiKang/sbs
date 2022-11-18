create table #테이블 A(
	칼럼 nvarchar(30),
	내용A nvarchar(30)
)

insert into #테이블A (칼럼, 내용A) values
('1', 'A1내용'),
('2', 'A2내용'),
('3', 'A3내용')

create table #테이블 B(
	칼럼 nvarchar(30),
	내용B nvarchar(30)
)

insert into #테이블B (칼럼, 내용B) values
('2', 'B2내용'),
('3', 'B3내용'),
('4', 'B4내용')

SELECT A.*, B.* FROM 테이블A A
LEFT JOIN 테이블B B ON A.칼럼 = B.칼럼--A테이블만조회SELECT A.*, B.* FROM 테이블A A
INNER JOIN 테이블B B ON A.칼럼 = B.칼럼
--A와  B의 교집합만 조회

SELECT A.*, B.* FROM 테이블A A
RIGHT JOIN 테이블B B ON A.칼럼 = B.칼럼
--B테이블만 조회

SELECT A.*, B.* FROM 테이블A A
LEFT JOIN 테이블B B ON A.칼럼 = B.칼럼
WHERE B.칼럼 IS NUL
--A테이블중 B와 겹치는것제외

SELECT A.*, B.* FROM 테이블A A
RIGHT JOIN 테이블B B ON A.칼럼 = B.칼럼
WHERE A.칼럼 IS NULL
--B테이블중 A와 겹치는것제외

SELECT A.*, B.* FROM 테이블A A
FULL JOIN 테이블B B ON A.칼럼 = B.칼럼
--A과 B 모두가 조회

SELECT A.*, B.* FROM 테이블A A
FULL JOIN 테이블B B ON A.칼럼 = B.칼럼
WHERE A.칼럼 IS NULL OR B.칼럼 IS NULL
--A와 B의 겹치는것만 제외하고 조회