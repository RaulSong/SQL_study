-- where 절
select *
from employees
where salary > 14000; --월급이 14,000 보다 많은 직원

select *
from employees
where last_name = 'King'; -- 문자열은 따옴표로 표시;

select *
from employees
where hire_date < '2002/06/10'; -날짜를 비교 고용일이 2002년 6월 10일 이전

--예제 1
select *
from employees
where employee_id = 100;

--예제2
select *
from employees
where first_name = 'David';

--예제3
select *
from employees
where employee_id <= '105';

--예제4
select *
from job_history
where start_date > '2006/03/03';

--예제5
select *
from departments
where location_id <> 1700;

--논리 연산자 and or not
select last_name, department_id, salary
from employees
where department_id = 60
    or department_id = 80
    and salary > 10000;
    
select *
from employees
where not ( hire_date > '2004/01/01' or salary > 5000 );
--hire_date <= 2004. 01. 01 and salary <=5000

--예제1
select *
from employees
where salary > 4000
    and job_id = 'IT_PROG';

--예제2
select *
from employees
where salary > 4000
    and (job_id = 'IT_PROG' 
    or job_id = 'FI_ACCOUNT');
    
--in 연산자 ()안의 값과 같을때 or로 연결
select *
from employees
where salary in (4000, 3000, 2700);

--예제1
select *
from employees
where salary in (10000, 17000, 24000);

--예제2
select *
from employees
where department_id not in (30, 50, 80, 100, 110);

--between 연산자 :사이 값
select *
from employees
where salary between 9000 and 10000;

--예제1
select *
from employees
where salary between 10000 and 20000;
--예제2 / employees 테이블에서 hire_date가 2004.01.01. 부터 2004.12.30.사이인 직원출력
select *
from employees
where hire_date between '2004/01/01' and '2004/12/30';
--예제3 / employees 테이블에서 salary가 7000미만이거나, 17000보다 많은 사원 출력
select *
from employees
where salary not between 7000 and 17000;

--like 연산자 _, %를 사용항여 문자열을 검색
select *
from employees
where last_name like 'B%'; --대문자 B로 시작, 뒤는 상관없음.

select *
from employees
where last_name like '%b%'; --문자열 중간에 b가 있으면 전부 조회

select *
from employees
where last_name like '____y'; --언더바 (_) 정확한 자릿수를 표현

--예제1
select *
from employees
where job_id like '%AD%';
--예제2
select *
from employees
where job_id like 'AD___';
--예제3
select *
from employees
where phone_number like '___.___.1234'; --like '%1234'
--예제4
select *
from employees
where phone_number not like '%3%' 
and phone_number like '___.___.___9'; --like '%9'
--예제5
select *
from employees
where job_id like '%MGR%' or job_id like '%ASST%';

--***is null연산자, order by 연산자
select
*
from employees;
--null이란? 입력되지 않은 사용할 수 없는 값. ( 0이나 공백 ' '이 아님! ) 
SELECT
*
FROM employees
where commission_pct is null;
--반대로 null이 아닌 경우를 찾을때는 is not null 입력
SELECT * FROM employees where commission_pct is not null;
--예제1
SELECT*FROM employees WHERE manager_id is null;

--***order by 명령문 : 정렬 ASC(오름차순) or DESC(내림차순)
SELECT * FROM employees ORDER BY employee_id ASC;--오름차순 (기본이 오름차순,생략가능)
SELECT * FROM employees ORDER BY employee_id DESC;--내림차순
--정렬할 열이 2개 이상일 때, 첫번째 열로 정렬한 후 두번째 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; 
--별칭으로 정렬 가능
select department_id, last_name, salary*12 연봉
from employees
order by 연봉 desc;
--예제1 employees 테이블에서 employ_id, first_name, last_name 출력하고 employee_id 기준으로 내림차순 정렬
select employee_id, first_name, last_name
from employees
order by employee_id desc;
--예제2
select job_id, first_name, salary
from employees
where job_id 
like '%CLERK%'
order by salary desc;
--예제3
select employee_id 직원번호, first_name 직원이름, department_id 부서번호, salary 월급
from employees
where employee_id between 120 and 150
order by department_id desc, 월급 desc;




