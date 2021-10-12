--*** 서브 쿼리 : 하나의 SQL문에 포함되어 있는 또 다른 SQL 문을 말함

--'Popp'직원의 고용일 : 07/12/07
SELECT
    last_name, hire_date
FROM employees
WHERE last_name = 'Popp';
--'Popp' 직원보다 이후에 고용된 직원
SELECT
    last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date
                    FROM employees
                    WHERE last_name = 'Popp'); --만약 'Popp'직원이 두명일 경우 error
--서브쿼리 주의점 : 단일행 서브쿼리를 사용할 떄는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야 함
--집계함수를 사용해서 서브쿼리로(where절에 집계함수를 사용할수는 없지만 서브쿼리를 이용하여 사용)
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees); 
-- 예제1 : 사원 'ABEL'보다 급여가 많은 사원의 이름, 급여를 나타내어라
SELECT last_name 이름, salary 급여
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel');
--예제2 : 'Bull'이란 이름을 가진 사원의 부서에서 'Bull'보다 높은 급여를 받는 사원들을 출력
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull');
--예제3 : 'Russell'이란 이름의 직원번호를 매니저아이디로 가지는 직원들의 이름, 급여, 매니저번호를 출력
SELECT last_name 이름, salary 급여, manager_id 매니저
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');
--예제4 : jobs 테이블에 job_tilte이 'Stock Manager'의 job_id를 가진 직원들의 정보를 직원 테이블에서 찾아 출력
SELECT * 
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );

--**다중행 서브쿼리 (서브쿼리 결과가 여러 개의 행으로 출력)
SELECT
    MIN(salary)
FROM employees
GROUP BY department_id;
-- 다중행 서브쿼리에서는 바로  =  > < 비교를 할 수 없음.
--*IN : 검색된 값 중에 하나만 일치하면 참.(여러개의'=')
SELECT
    department_id, employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary)
                 FROM employees
                 GROUP BY department_id)
ORDER BY department_id;
--*비교연산자 + ANY : 검색된 값 중에 조건에 맞는 것이 하나 이상 있으면 참.
SELECT
    department_id, last_name, salary
FROM employees
WHERE salary < ANY(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;
--*All : 모든 검색된 값과 조건에 맞아야 한다
SELECT
    department_id, last_name, salary
FROM employees
WHERE salary > ALL(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;
--예제1 : 부서번호가 20번인 직원들의 매니저아이디와 같은 매니저를 가지는 직원들을 출력하라 (단 20번 부서의 직원은 제외)
SELECT
     employee_id, first_name, job_id 직종, salary 급여, department_id
FROM employees
WHERE manager_id IN (SELECT manager_id
                     FROM employees
                     WHERE department_id = 20)
AND department_id != 20;
--예제2 : job_id가 'ST_MAN'인 직원들 중 어느 한직원 보다도 급여가 작은 직원들을 출력하라. (ANY)
SELECT
    employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY ( SELECT salary
                     FROM employees
                     WHERE job_id = 'ST_MAN');
--예제3 : 직책이 'IT_PROG'인 직원들 보다 급여가 작은 직원들을 출력하시오
SELECT
    employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG');

--**다중열 서브쿼리 (열이 여러개일때) : 반드시 비교대상 열과 1:1 대응돼야 함
--이름이 'Bruce'인 직원과 같은 매니저, 같은 직업인 직원 출력 (단 Bruce는 제외)
SELECT
    employee_id, first_name, salary, manager_id
FROM employees
WHERE (manager_id, job_id)
IN (SELECT manager_id, job_id
    FROM employees
    WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';
--각 부서별로 최소 급여를 받는 사원의 부서번호, 사원번호, 이름, 급여 출력
SELECT
    department_id, employee_id, first_name, salary
FROM employees
WHERE (department_id, salary)
IN (SELECT department_id, MIN(salary)
    FROM employees
    GROUP BY department_id)
ORDER BY department_id;
--예제 : employees 테이블에서 job_id별로 가장 낮은 salary가 얼마인지 찾아보고, 찾아낸 job_id 별 salary에 해당하는 직원의
--first_name, job_id, salary, department_id를 출력 (salary 내림차순)
SELECT
    first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) 
IN (SELECT job_id, MIN(salary)
    FROM employees
    GROUP BY job_id)
ORDER BY salary DESC;

--**집합연산자 ( UNION, INTERSECT, MINUS )
--*UNION 합집합 : 교집합 부분 중복이 제거됨
SELECT
    employee_id, job_id
FROM employees
UNION
SELECT
    employee_id, job_id
FROM job_history;
--*UNION ALL 합집합 : 두개의 select문의 결과를 합함
SELECT
    employee_id, job_id
FROM employees
UNION ALL
SELECT
    employee_id, job_id
FROM job_history;
--*INTERSECT : 교집합
SELECT
    employee_id, job_id
FROM employees
INTERSECT
SELECT
    employee_id, job_id
FROM job_history;
--*MINUS 차집합 : 중복이 제거됨
SELECT
    employee_id, job_id
FROM employees
MINUS
SELECT
    employee_id, job_id
FROM job_history;
--예제1
SELECT
    department_id
FROM employees
UNION
SELECT
    department_id
FROM departments;
--예제2
SELECT
    department_id
FROM employees
UNION ALL
SELECT
    department_id
FROM departments;
--예제3
SELECT
    department_id
FROM departments
MINUS
SELECT
    department_id
FROM employees;
--예제4
SELECT
    department_id
FROM employees
INTERSECT
SELECT
    department_id
FROM departments;
            
            
            
            
            
            
            
            
            
            
            
            
            