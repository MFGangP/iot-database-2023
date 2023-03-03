-- 뷰

USE sqldb;
-- 뷰를 만들어
CREATE VIEW uv_potentialUser
-- 다음과 같이
    AS
SELECT u.*
	 , b.num
     , b.prodName
     , b.price
     , b.amount
  FROM usertbl AS u
  LEFT OUTER JOIN buytbl AS b
    ON u.userID = b. userID
 WHERE b.userID IS NULL;
 
 SELECT * FROM uv_potentialUser;
 
-- 사용자 테이블 뷰       
CREATE VIEW uv_usertbl
AS
	 SELECT u.userID
		  , u.name
          , u.birthYear
          , u.addr
       FROM usertbl AS u;
/*
테이블 하나로 뷰를 만들면 데이터를 넣을 수 있지만
테이블 2개 이상으로 만들면 데이터를 넣을 수 없다.
*/
SELECT *
  FROM uv_usertbl;
  
INSERT INTO uv_usertbl VALUES
	('KKK', '케케케', 1988, '제주');

SELECT *
  FROM uv_potentialUser;
  
INSERT INTO uv_potentialuser VALUES
('TTT', '티티티', 1990, '서울', '010', '89898989', 190, '2023-01-01');