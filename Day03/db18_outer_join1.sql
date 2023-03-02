/* OUTTER join */
-- stdtbl
CREATE TABLE stdtbl(
	stdName NVARCHAR(10) NOT NULL PRIMARY KEY,
    addr NCHAR(4) NOT NULL
);
CREATE TABLE clubtbl (
	clubName NVARCHAR(10) NOT NULL PRIMARY KEY,
    roomNo NCHAR(4) NOT NULL
);
CREATE TABLE stdclubtbl (
-- 번호 자동 증가
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
-- 위에 있는 학생 이름
    stdName NVARCHAR(10) NOT NULL,
-- 위에 있는 클럽 이름
    clubName NVARCHAR(10) NOT NULL,
-- FOREIGN KEY로 쓸건데 stdtbl(stdName)를 바라보고있다.
	FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
    FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
