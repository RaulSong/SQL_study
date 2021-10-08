--***DDL(Data Definition Language) - 데이터 정의어 : 테이블을 생성, 수정, 삭제

--**테이블 생성 (Create)
CREATE TABLE 테스트 (
    문자열 VARCHAR2(100),
    숫자   NUMBER,
    날짜   DATE DEFAULT SYSDATE
    );
--**테이블 삭제 (Drop)
DROP TABLE 테스트;

DESC 테스트;

SELECT
    *
FROM 테스트;

--데이터 입력
INSERT INTO 테스트
VALUES ('HTML', 5, '2021-10-08');
INSERT INTO 테스트
VALUES ('CSS', 3, sysdate);
INSERT INTO 테스트(문자열, 숫자)
VALUES ('JAVA', 7);
--*기존 테이블을 카피해서 만드는 방벙
--열 구조만 복사
CREATE TABLE EMP_TEMP
AS
SELECT
    *
FROM employees
WHERE 1 != 1;
--확인
SELECT
    *
FROM emp_temp;
--80번 부서의 직원들만 따로 테이블 생성해보기
CREATE TABLE EMP_80
AS
SELECT
    employee_id 직원번호, last_name 이름, salary 월급, salary*12 연봉, hire_date
    고용일
FROM employees
WHERE department_id = 80;
--확인
SELECT
    *
FROM emp_80;
--예제
CREATE TABLE stmans
AS
SELECT
    employee_id ID, job_id JOB, salary SAL
FROM employees
WHERE job_id = 'ST_MAN';
--예제 확인
SELECT
    *
FROM stmans;











