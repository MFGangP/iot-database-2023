-- CTE (Common Table Expression)
-- 잠시 동안 쓸 수 있는 임시 테이블
WITH cte_join(userID, name, prodName, price)
AS 
(
	SELECT b.userID
         , u.name
         , b.prodName
         , b.price
	  FROM buytbl AS b
      JOIN usertbl AS u
        ON b.userID = u.userID
)
SELECT * FROM cte_join;