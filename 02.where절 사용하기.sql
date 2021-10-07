--***where 절, 연산자
SELECT * --출력하려는 열
FROM employees --참조하려는 테이블
WHERE salary > 14000; --조건식

SELECT *
FROM employees
WHERE last_name = 'King'; -- 문자열은 따옴표로 표시;

/* 비교 조회 조건 주기
비교 연산자
= : 같다
<> (!=) : 같지 않다
> : 보다 크다
< : 보다 작다
>= : 보다 크거나 같다
<= : 보다 작거나 같다  */
SELECT *
FROM employees
WHERE hire_date < '02/06/10';
--예제1
SELECT 
    *
FROM employees
WHERE employee_id = 100;
--예제2
SELECT 
    *
FROM employees
WHERE first_name = 'David';
--예제3
SELECT
    *
FROM employees
WHERE employee_id <= 105;
--예제4
SELECT
    *
FROM job_history
WHERE start_date > '2006/03/03';
--예제5
SELECT
    *
FROM departments
WHERE location_id != 1700; -- = <> 1700


--**논리 연산자 AND, OR, NOT
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
    OR department_id = 80
    AND salary > 10000;
    
SELECT *
FROM employees
WHERE hire_date > '08/04/04'
    OR salary > 13000
    AND job_id = 'AD_VP';
--예제1
SELECT
    *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';
--예제2
SELECT
    *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT';

--10/06 복습 시작 `````````  
--**in 연산자 ()안의 값과 같을때 or로 연결
SELECT
    *
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary =2700; --or로 연결했을때

SELECT
    *
FROM employees
WHERE salary IN (4000, 3000, 2700); --in 으로 묶음
--예제1
SELECT
    *
FROM employees
WHERE salary IN (10000, 17000, 24000);
--예제2
SELECT
    *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--**between 연산자 :사이 값
SELECT
    *
FROM employees
WHERE salary >= 9000 
    AND salary <= 10000; --and로 범위를 정함

SELECT
    *
FROM employees
WHERE salary
    BETWEEN 9000 AND 10000; --between을 활용하여 범위를 정함
--예제1
SELECT
    *
FROM employees
WHERE salary
    BETWEEN 10000 AND 20000;
--예제2 / employees 테이블에서 hire_date가 2004.01.01. 부터 2004.12.30.사이인 직원출력
SELECT
    *
FROM employees
WHERE hire_date
    BETWEEN '2004/01/01' AND '2004/12/31';
--예제3 / employees 테이블에서 salary가 7000미만이거나, 17000보다 많은 사원 출력
SELECT
    last_name, salary
FROM employees
WHERE salary
    NOT BETWEEN 7000 AND 17000;

--**Like 연산자 _, %를 사용항여 문자열을 검색
SELECT 
    *
FROM employees
WHERE last_name LIKE 'B%'; --대문자 B로 시작, 뒤는 상관없음.

SELECT 
    *
FROM employees
WHERE last_name LIKE '%b%'; --문자열 중간에 b가 있으면 전부 조회

SELECT
    *
FROM employees
WHERE last_name LIKE '%y'; --맨 뒷자리 y, 앞은 상관 없음

SELECT
    *
FROM employees
WHERE last_name LIKE '____y'; -- 언더바는 글자 자릿수 
--예제1
SELECT
    *
FROM employees
WHERE job_id LIKE '%AD%';
--예제2
SELECT
    *
FROM employees
WHERE job_id LIKE 'AD___';
--예제3
SELECT
    *
FROM employees
WHERE phone_number LIKE '%1234'; --like '%1234'
--예제4
SELECT
    *
FROM employees
WHERE phone_number NOT LIKE '%3%'
AND phone_number LIKE '%9'; -- = ___.___.___9
--예제5
SELECT
    *
FROM employees
WHERE job_id LIKE '%MGR%'
OR job_id LIKE '%ASST%';

--***is null연산자 : 데이터 값이 'null' 검색
SELECT
    *
FROM employees; --commission_pct 열에 null값이 다수 보임
--null이란? 입력되지 않은 사용할 수 없는 값. ( 0이나 공백 ' '이 아님! ) 
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;
--반대로 null이 아닌 경우를 찾을때는 is not null 입력
SELECT * 
FROM employees 
WHERE commission_pct IS NOT NULL;
--예제1
SELECT
    *
FROM employees
WHERE manager_id IS NULL;
 
--**ORDER BY 명령문 : 정렬 ASC(오름차순) or DESC(내림차순)
SELECT 
    * 
FROM employees 
ORDER BY employee_id ASC;--오름차순 (기본이 오름차순,생략가능)

SELECT 
    * FROM employees 
ORDER BY employee_id DESC;--내림차순
--정렬할 열이 2개 이상일 때, 첫번째 열로 정렬한 후 두번째 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; 
--별칭으로 정렬 가능
SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC;
--예제1 employees 테이블에서 employ_id, first_name, last_name 출력하고 employee_id 기준으로 내림차순 정렬
SELECT
    employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--예제2
SELECT
    *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;
--예제3
SELECT
    employee_id 직원번호, first_name "직원 이름", department_id 부서번호, salary 월급
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY 부서번호 DESC, 월급 DESC;
