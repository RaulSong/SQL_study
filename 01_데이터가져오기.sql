/* 들어가기전 SQL 작성 규칙
1.SQL문은 대문자와 소문자를 구별하지 않음.
2.SQL문은 한 줄 또는 여러 줄로 작성할 수 있음.
-가독성과 편집의 용이성을 위해 내용이 달라지면 줄을 나눔.
-명령어는 여러 줄로 나눌 수 없음.
3.코드 수준에 따른 들여쓰기는 SQL 문장을 좀 더 읽기 쉽게 함.
4.명령어를 대문자로 작성하고 나머지를 소문자로 작성하면 가독성이 좋아짐.
5.주석 -- (한줄), /* (여러줄)
6.코드 실행 CTRL+ENTER
*/

--***SELECT문(Statement) : 필요한 데이터 조회

-- 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 ctrl+ent
-- *은 전체 열, 명령문 끝에는 세미콜론이 있어야 함.
SELECT * FROM departments;
--**특정 열만 조회
SELECT department_id 부서ID, department_name 부서명, manager_id 매니저ID
FROM departments;
--**별칭 붙이기 (열의 이름) : as는 생략가능, 공백,대소문자,특수문자 사용하려면 "" 사용!
select department_id "부서 ID!", department_name 부서이름
from departments;
--**산술 연산자(+,-,*,/)
select first_name 이름, job_id 직책, salary 월급
from employees;
-- 월급에 100씩 뺀 열을 만들기
select first_name 이름, job_id 직책,salary 월급, salary-100 "월급수정-100"
from employees;
-- 월급에 10%를 빼기
select first_name 이름, job_id 직책,salary 월급, salary-salary/10 월급수정
from employees;
-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT 
    last_name, 
    first_name, 
    job_id, 
    salary, 
    (salary-1000)*0.05 보너스
FROM employees;
--**distinct : 중복 값을 제거 !
SELECT distinct job_id
FROM employees;
--예제1
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;
--예제2
SELECT first_name, salary, salary*1.1 뉴샐러리
FROM employees;
--예제3
SELECT employee_id 사원번호, first_name 이름, last_name 성 
FROM employees;
--**연결 연산자 || :열을 붙여서 하나의 열로 출력
SELECT last_name || ' is a ' || JOB_ID 직업정보
FROM employees;
--예제4
SELECT employee_id, first_name || ' ' || last_name, email || '@company.com'
FROM employees;
