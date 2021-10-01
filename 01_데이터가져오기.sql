주석
*/
-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 ctrl+ent
-- *은 전체 열, 명령문 끝에는 세미콜론이 있어야 함.
SELECT * FROM departments;

-- 2. 특정 열만 조회
SELECT department_id, department_name
FROM departments;

--예제 1
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;

-- 연결 연산자 || :열을 붙여서 하나의 열로 출력
SELECT LAST_NAME || 'is a ' || JOB_ID AS 직업정보
FROM EMPLOYEES;

--예제 4 : 이름 한칸 띄우고 붙여서 열, email에 문자열 붙여 출력
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, email || '@company.com'
FROM EMPLOYEES;

DESC EMPLOYEES;
