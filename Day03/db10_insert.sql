USE sqldb;

-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES 
('SMG', '성명건', 1976, '부산', '010', '66887777', 179, '2023-03-02');

-- 컬럼을 다 적을 때 입력안 할 컬럼은 NULL로 지정
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES 
('SHM', '손흥민', 1991, '서울', NULL, NULL, NULL, NULL);

-- NULL 컬럼 생략 가능 이렇게도 쓸 수 있는데 잘 안쓴다.
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES 
('SHM', '손흥민', 1991, '서울');

-- 컬럼 지정을 생략가능(단, 입력할 값의 순서가 컬럼 순서와 같아야된다.)
INSERT INTO usertbl VALUES 
('SJW', '손정웅', 1969, '서울', '010', '55664433', '176', NULL);

/* 
AUTO_INCREMENT의 경우 키 필드 값을 입력하지 않아도 된다.
장점은 키 값을 알아서 지가 증가시켜준다.
단점은 실행 할 때마다 증가시켜서 중복된 값이 계속 들어갈 수가 있으니 조심.
값을 지우고 넣어도 맨 마지막 숫자부터 시작된다.
(한 번 들어간 키 값을 살릴 수가 없음.)
다시 살리려면 싹다 지우고 다시 넣어야된다.
*/
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VALUES
('SMG', '노트북', '전자', 500000, 1)