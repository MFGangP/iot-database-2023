-- 변수 사용
USE sqldb;

-- @가 변수
SET @myVar1 = 5;
SELECT @myVar1;

SET @myVar2 = '이름 ==> ';

SELECT @myVar2, name
  FROM usertbl
 WHERE height > 170;
 
SELECT name, height + @myVar1
  FROM usertbl;
  
-- 형변환
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear, CHAR) AS SIGNED INT) FROM usertbl;

SELECT CAST(addr AS decimal) FROM usertbl;
SELECT CONVERT(addr, decimal) FROM usertbl;

SELECT CAST('1000' AS decimal);

-- 암시적 형변환
SELECT 200 + 300;
-- 문자열 합치기
SELECT CONCAT('Hello', 'world');
-- MySQL 이외에서는 '200300'
SELECT '200' + '300';
SELECT CONCAT(200, '300');
SELECT 1 = 1;

/* 내장함수 리스트*/
-- 흐름함수
-- 100>200 ? '참' : '거짓'
SELECT IF(100>200, '참', '거짓');

-- 숫자 계산하다가 NULL이 포함되어 있으면 오류 (아무거도 안나옴)
-- NULL은 계산이 불가능 바꿔서 쓰면 합산 된다.
SELECT IFNULL(NULL, 0) + 100;

-- NULLIF는 많이 사용 안됨 (필요없)
SELECT NULLIF(100, 900);

-- 쿼리작성할 때 많이 사용
SELECT name
     , birthYear
	 , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역시'
       WHEN '한양' THEN '조선권'       
       ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열 함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
-- 한글은 사용하면 안된다.
SELECT ASCII('안'), CHAR(236);
-- 한글은 한글자당 3bytes
-- CHAR_LENGTH(글자길이), LENGTH(BYTE)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UFT-8
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT REPLACE('Hello World', 'Hello', 'ByeBye');
-- DB는 모든 인덱스 시작을 1부터 시작함
SELECT INSTR('안녕하세요, 여러분', '여');
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN', 3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');

-- LTRIM, RTRIM, TRIM
SELECT LTRIM('         Hello World          ') AS 'LTRIM'
     , RTRIM('         Hello World          ') AS 'RTRIM'
     , TRIM('         Hello World          ') AS 'TRIM';
     
-- 'Hello' * 3
SELECT REPEAT('Hello', 3);

-- SUBSTRING
SELECT SUBSTRING('대한민국만세', 5, 2);

-- 수학함수
SELECT ABS(-10);
-- 올림, 내림, 반올림
SELECT CEILING(4.7), FLOOR(4.9), ROUND(4.4);

SELECT MOD(157, 10);
-- 주사위 놀이
SELECT RAND(), FLOOR(1 + (RAND() * 6));

-- 날짜 및 시간함수
-- 현재 시간
SELECT NOW();
-- 날짜 더하기
SELECT ADDDATE('2023-03-02', INTERVAL -10 DAY);
-- 년월일시 단위로 쪼갤 수 있다.
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAY(NOW());
-- 1부터 7로 요일 표시
SELECT DAYOFWEEK(NOW()); -- 1(일)~ 7(토)
-- 이달에 마지막 날
SELECT LAST_DAY('2024-02-01');

-- 시스템 함수
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT() 현재 어떤 일이 일어난 행 개수를 알려준다.
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();

SELECT VERSION(); 