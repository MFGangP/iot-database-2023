# iot-database-2023
IoT 개발자과정 데이터베이스

![MySQL](https://github.com/MFGangP/iot-database-2023/blob/main/images/MySQL.png)

# 1일차
1. MySQL 학습
    - [X] 데이터베이스 개요
    - [X] MySQL 설치/설정
    - [X] Sample DB 설치
    - [X] WorkBench 사용법

삭제 잘못하면 다음날 사표 내야되니까 조심하자

```SQL
-- 테이블 삭제 쿼리(주의! 경고!)
-- 삭제는 매우 조심!
DROP TABLE testtbl;
```

# 2일차
1. MySQL 학습
    - [X] DB 모델링
    - [X] MySQL 유틸리티
    - [X] SQL 기본

```SQL
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
```

# 3일차
1. MySQL 학습
    - [X] SQL기본 CRUD 
        - [X] INSERT
        - [X] SELECT
        - [X] UPDATE
        - [X] DELETE
    - [X] SQL 고급
        - [X] INNER JOIN

INNER JOIN은 전부다 보여줘
```SQL
-- INNER JOIN
SELECT s.stdName, s.addr, c.clubName, t.roomNo
  FROM stdtbl AS s
  JOIN stdclubtbl AS c
    ON s.stdName = c.stdName
  JOIN clubtbl AS t
    ON c.clubName = t.clubName;
```

# 4일차
1. MySQL 학습
    - [X] SQL 고급
        - [X] OUTER JOIN
        - [X] TABLE, VIEW
        - [X] INDEX  
2. [X] MySQL활용
    - [X] BookRentalShop 쿼리 연습

```SQL
-- 책을 봅시다
SELECT REPLACE(b.Author, ',', '/') AS '저자명'
     , b.Division AS '장르코드'
     , b.Names AS '책 제목'
     , DATE_FORMAT(b.ReleaseDate, '%Y년%m월%d일') AS '출판일'
     , FORMAT(b.Price, '0,000') AS '금액'
  FROM bookstbl AS b;
  
-- Ctrl + L 한 줄 씩 삭제 
-- DATE_FORMAT 예제
-- DATE_FORMAT('2023-03-03 17:05:10', '%Y년%m월%d일 %p %H시%i분%S초')

-- 회원을 봅시다
SELECT m.Names AS '회원명'
     , m.Levels AS '회원등급'
     , m.addr AS '주소'
     , m.Mobile AS '전화번호'
	 , CONCAT(UPPER(SUBSTRING_INDEX(m.Email, '@', 1))
			, '@'
            , LOWER(SUBSTRING_INDEX(m.Email, '@', -1))) AS '이메일'
-- 의미없는 작업인데 이런것도 있다~ 이거야
  FROM membertbl AS m
 ORDER BY m.Names ASC;
```

# 5일차
1. MySQL 활용
    - BookRentalShop 쿼리 연습
2. 코딩테스트
    - BookRentalShop