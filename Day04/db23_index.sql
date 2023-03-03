CREATE TABLE TBL1 (
	ID INT NOT NULL PRIMARY KEY,
	BRIDGE INT NULL,
    CONTENTS VARCHAR(5000)
);
-- sqldb DB의 usertbl 데이터 중에서
-- userID, name, birthYear, addr만 가져와서
-- tabledb에 있는 usertbl에 넣어라.
INSERT INTO tabledb.usertbl 
SELECT userID, name, birthYear, addr
  FROM sqldb.usertbl;
  
-- NULL이 많은 곳에 인덱스 걸어봐야 의미가 없다.
-- 데이터 중복도가 높은 열이랑 비슷한 상황

SELECT * FROM usertbl WHERE name = '김범수';