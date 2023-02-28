-- 사용 데이터베이스 변경
USE homeplus;

-- 한 문장 끝일 때는 세미콜론(;)으로 마침 
-- 밑에 두 개 똑같다
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl;
--            스키마.테이블
SELECT * FROM employees.titles; -- 다른 DB 테이블에서 데이터 가져오려면

-- 필요한 컬럼만 가져오겠다.
SELECT first_name,hire_date FROM indextbl;

-- sqldb를 사용
USE sqlDB;
-- 조건절 검색
SELECT userID
	 , name
     , birthYear
     , height 
  FROM usertbl 
 WHERE name = '김경호';
 
-- 관계 연산자
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182;

-- BETWEEN 사이의 값을 조회
SELECT * 
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;
   
SELECT * 
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;

-- IN (이산적인 값의 조건) 집합 연산자
SELECT * 
  FROM usertbl
 WHERE addr
    IN ('경남', '경북', '전남');

-- 문자열 내용 검색 EX)뉴스 본문 안에서 일정 단어 검색
-- % 무엇이든 허용, _ 언더바는 갯수가 정확하게 일치해야된다. 
SELECT *  
  FROM usertbl
 WHERE name like '김__';
 
 /* 
 서브쿼리 (SubQuery) 조건이 2개가 되면 비교는 안된다.
 사용위치
 1. 컬럼위치 (한 건)
 2. 테이블 위치
 3. 조건절 위치 
 FROM절에서는 제약 조건이 하나도 없음
 WHERE절에 서브쿼리가 컬럼이 한개 이상이거나 결과가 한 개 이상이면
 조건 연산자로 조회할 수 없음
 */
SELECT name
     , height
  FROM usertbl
 WHERE height > 177;
-- IN 쓰면 해당하는 조건 2개 뽑을 수 있다.
SELECT name
     , height
  FROM usertbl
 WHERE (height, birthYear) IN (SELECT height, birthYear FROM usertbl WHERE Name LIKE '김%');

-- 가상 테이블
SELECT u.userID
	 , u.name
	 , (2023 - u.birthYear) -- 얘들은 만든 애들이라 이름이 없다.
	AS age -- AS는 별명 꽤 유용하게 쓰인다.
  FROM (SELECT userID, name, birthYear, addr
	    FROM usertbl
	   ) AS u
 WHERE u.birthYear > 1969; 
 
 -- 컴럼에 쓰는 서브쿼리
 -- * 같은거 쓰면 아예 방법이 없다 컬럼 하나만 써야된다.
 SELECT b.userID AS '아이디'
	  , (SELECT name FROM usertbl WHERE userID = b.userID) AS '이름'
      , b.prodName
      , b.price * b.amount AS '판매액'
   FROM buytbl
     AS b;
     
-- 정렬 Order BY : default ASC/ENDING 안적어도 오름차순
-- 내림차순 DESC/ENDING 뒤에는 빼는 것
SELECT *
  FROM usertbl
 WHERE birthYear > 1969
 -- 앞에 오는 조건이 우선 실행된다.
 ORDER BY height ASC, birthYear DESC;
   
-- DISTINCT 중복제거 / 중복제거할 컬럼만 
SELECT DISTINCT addr 
  FROM usertbl;

-- LIMIT 출력 개수 제한 / 
USE homeplus;

SELECT *
  FROM indextbl
 LIMIT 5;

USE sqlDB;

-- CREATE TABLE... SELECT
-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사 안된다.
-- 일부 컬럼(열)만 복사 테이블 생성 가능
CREATE TABLE elec_buytbl_new
SELECT num
     , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자';
 
 