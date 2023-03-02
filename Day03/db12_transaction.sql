USE sqldb;

-- UPDATE & TRANSACTION
-- 모든 일이 제대로 완벽하게 처리됐을 때 DB에 저장이 되는 과정
-- 일 처리가 제대로 안되었을 때는 원상태로 복구시킨다.
START TRANSACTION;

-- 보험(이거 잘 못 쓰면 짤린다)
-- 경고! UPDATE 구문에는 WHERE절 빼면 안됨!
UPDATE usertbl_bak
   SET mobile1 = '010'
     , mobile2 = '66664444'
	 , addr = '부산'
 WHERE userID = 'SMG';

COMMIT;
ROLLBACK;

-- DELETE
-- WHERE절이 빠지면 
DELETE FROM usertbl
 WHERE userID = 'HGS';