-- 쇼핑몰에 가입하고 물건을 한번도 
-- 구매하지 않은 회원까지 모두 출력
SELECT u.*
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u
-- 부모 자식 테이블 사이에서 
-- 자식 테이블을 기준으로 하면 한 줄 NULL 값이 절대 나올리가 없다.
-- 부모 테이블 기준으로는 나오는게 정상임.
  LEFT OUTER JOIN buytbl AS b
  ON u.userID = b.userID
 WHERE b.userID IS NULL;
 -- 이렇게 해서 원하는 대상만 골라서 조회할 수 있다.
 -- NULL을 비교 할 때는 =이 아니라 IS를 써야한다.
  
-- 학생 중에 동아리에 가입하지 않은 학생 찾기
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s  
  LEFT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName 
  LEFT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName
-- 학생 중에 동아리 가입 안 한 학생
-- 집합(두 쿼리 결과를 합쳐줌) 
 UNION
-- 동아리중에 학생이 가입 안 한 동아리  
SELECT s.stdName, s.addr
     , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s
 RIGHT OUTER JOIN stdclubtbl AS j
    ON s.stdName = j.stdName 
 RIGHT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName;
    
-- INNER JOIN 의 약식표현 (권장하지않음)
SELECT u.*
     , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u, buytbl AS b
 WHERE u.userID = b.userID;
    
-- UNION (얘는 우리가 알고있는 집합 중복되면 제거.)
-- UNION ALL (같든 말든 전부다 출력해라.)
-- NOT IN (조건이 만족하지 않는 모든 대상이 다 나오는거.)
-- IN (조건이 만족하는 대상만 다 나오는거.)

    