-- 실무에 가장 근접한 PK 잡는 방법
-- 기본키 2개 지정
CREATE TABLE prodtbl (
	prodCode CHAR(3) NOT NULL,
    prodID CHAR(4) NOT NULL,
    prodDate DATETIME NOT NULL,
	prodCur VARCHAR(10) NULL,
	CONSTRAINT pk_prodtbl_prodCode_prodID
		PRIMARY KEY (prodCode, prodID)
);

-- 멤버 테이블
CREATE TABLE membertbl (
userID CHAR(8) NOT NULL PRIMARY KEY,
name VARCHAR(10) NOT NULL,
-- UNIQUE 제약 조건
email VARCHAR(50) NULL UNIQUE
);

-- CHECK 제약 조건
CREATE TABLE stdtbl (
	userID CHAR(8) PRIMARY KEY NOT NULL,
    name VARCHAR(10),
    GRADE INT CHECK (GRADE >= 1 AND GRADE <= 4), -- 학년은 1~4
    CONSTRAINT CK_name CHECK(name IS NOT NULL) -- NOT NULL
);