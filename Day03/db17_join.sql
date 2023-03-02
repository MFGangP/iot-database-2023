-- 조인
USE sqldb;

/* 조인 */
-- inner join
-- unipue에 not null 이지만 디스플레이 할 때는 그냥 보여준다.
SELECT b.num, b.userID, b.prodName
     , u.name, u.addr, u.birthYear
  FROM buytbl AS b
 INNER JOIN usertbl AS u
    ON b.userID = u.userID
 ORDER BY b.num DESC;
-- WHERE u.userID = 'JYP';

