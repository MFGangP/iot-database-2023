-- 피벗
-- 열에 포함된 여러 값을 출력하고 이를 여러 열로 반환, 집계 까지 수행
CREATE TABLE pivotTest
(
	uName CHAR(3),
    season CHAR(2),
    amount INT
);

INSERT INTO sqldb.pivottest
(uName, season, amount)
VALUES
('김범수', '겨울', 10), ('윤종신', '여름', '15'), ('김범수', '가을', 25), 
('김범수', '봄', 3), ('김범수', '봄' , 37), ('윤종신', '겨울', 40), 
('김범수', '여름', 14), ('김범수', '겨울', 22), ('윤종신', '여름', 64);

-- 피벗 기능
-- 데이터 베이스는 세로로 쌓인다
-- 보고할 때 가로로 바꿔서 보고할 일이 많음.
SELECT uName,
	   SUM(IF(season='봄', amount, 0)) AS '봄'
     , SUM(IF(season='여름', amount, 0)) AS '여름'
     , SUM(IF(season='가을', amount, 0)) AS '가을'
     , SUM(IF(season='겨울', amount, 0)) AS '겨울'
     , SUM(amount) AS '합계'
  FROM pivottest
 GROUP BY uName