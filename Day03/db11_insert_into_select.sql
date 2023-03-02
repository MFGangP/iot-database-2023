-- INSERT INTO SELECT
-- usertbl에서 앞의 네개 컬럼값을 가져와 전부
-- usertbl_bak에 집어넣어라
INSERT INTO usertbl_bak (userID, name, birthYear, addr)
SELECT userID, name, birthYear, addr FROM usertbl;