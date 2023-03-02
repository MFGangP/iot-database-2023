-- 집계 함수를 사용하기 위해서 그룹핑 GROUP
USE sqldb;

-- GROUP BY에 작성된 컬럼명만 SELECT에 쓸 수 있다.
SELECT userID AS '아이디'
	 , AVG(price) AS '평균구매가격'
-- 원래 존재 하지 않았던 애를 만들어서 보여주니까 가능한 것
-- 그냥 price를 넣을 수 있지만 의미가 없는 데이터가 나온다.
  FROM buytbl
 GROUP BY userID;

-- HAVING은 집계함수등의 결과값을 필터링하기 위해 쓴다.
SELECT userID
-- 만들어진 애(컬럼X)라서 WHERE은 쓸 수 없다.
     , SUM(price * amount) AS 합산
  FROM buytbl
 GROUP BY userID
-- AS로 바꾼 이름을 쓰려면 ''를 쓰면 안된다.
HAVING 합산 >= 1000;

-- ROLLUP 전체 합계가 나오게 만들어주는 키워드
SELECT userID
     , SUM(price * amount) AS '합산'
  FROM buytbl
 GROUP BY userID
  WITH ROLLUP;
 