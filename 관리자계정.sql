SELECT SYSDATE FROM DUAL;


-- 한줄 주석입니다.
-- HR 계정(연습용)을 언락하고 비밀번호 1234 지정
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 1234;

--SCOTT 계정 설치 및 비번 설정
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;
ALTER USER scott ACCOUNT UNLOCK IDENTIFIED BY 1234;