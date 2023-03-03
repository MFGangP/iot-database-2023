/*책 대여점 데이터베이스 실습*/

-- 1.divtbl
SELECT *
  FROM divtbl;

-- 2. bookstbl
SELECT *
  FROM bookstbl;
  
-- 3. membertbl
SELECT *
  FROM membertbl;
  
-- 4. rentaltbl
SELECT *
  FROM rentaltbl;
  
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