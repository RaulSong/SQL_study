--***단일행 함수

--**문자형 함수
--*대소문자 변환 UPPER LOWER INITCAP: 첫 문자만 대문자로 변환하고, 나머지는 소문자로 변환
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course')
FROM DUAL; --듀얼 테스트용 테이블을 이용하여 학습
--*문자 조작 함수
SELECT substr('ABCDEFG', 3, 4), length('ABCDEFG'), instr('ABCDEFG','D')
FROM DUAL;

SELECT TRIM( '     헬로우  '), '   헬로우 ' --공백을 없애줌.
FROM dual; 
--예제1
select department_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, concat('직업명이   ', job_id) as 직업명
from employees
where substr(job_id, 4, 3)= 'REP';

--문자열 가장 끝 문자 출력
select last_name, substr(last_name, -1, 1) -- '-1'은 문자열 가장 끝
from employees;

--문자열 치환
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') --replace 치환
from employees;

select job_id, translate(job_id, 'ACCOUNT', 'O', '*')
from employees;

--예제1
select first_name 이름, lower(first_name) lower적용, upper(first_name) upper적용, email 이메일, initcap(email)
from employees;
--예제2
select job_id 직업명, substr(job_id, 1, 2) 앞의2개
from employees;

--**숫자형 함수
--*반올림 함수 ROUND (숫자, 자릿수)
SELECT round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2) 
FROM dual;
--*TRUNC : 숫자를 절삭한다. 0이 소수점 첫째 자리
SELECT trunc(15.193), trunc(15.193, 0), trunc(15.193, 1), trunc(15.193, 2) 
FROM dual;
--*MOD : 나누기 후 나머지를 구함
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE mod(employee_id, 2) = 0 --짝수
ORDER by employee_id;
--예제
SELECT salary, trunc(salary/30) 정수,  round(salary/30, 1) 소수1, round(salary/30, -1) "10의 자리"
FROM employees;

--**날짜형 함수
select sysdate, round(sysdate, 'DD') 일, round(sysdate, 'MM') 월, round(sysdate, 'YYYY') 년도  --sysdate는 현재날짜를 의미
        , round(months_between('2021/10/05', '2021/06/10'),1) 월차이
from dual;
-- 날짜에 더하기, 빼기를 하면 > > > 실제 날짜가 더하거나 빼진다.
select sysdate 오늘날짜, sysdate +1 내일, sysdate -1 어제
from dual;
--예제1
select department_id, sysdate, hire_date, months_between(sysdate,hire_date)
from employees
where department_id = 100;
--예제2
select hire_date, add_months(hire_date,+3), add_months(hire_date,-3) 
from employees
where employee_id between 100 and 106;

--**변환형 함수 : TO_CHAR
--숫자를 문자로 변환
select 
to_char(12345678 , '999,999,999') 콤마형식,
to_char(12345.678 , '999,999,999.99') 콤마소수점형식,
to_char(12345678 , '$999,999,999') 달러형식,
to_char(12345678 , 'L999,999,999') 로컬통화
from dual;
--날짜  -> 문자로 변환
SELECT 
TO_CHAR( sysdate, 'YY-MM-DD') 날짜표시,
TO_CHAR( sysdate, 'YY-MM-DD HH24:MI:SS') 시간표시
FROM dual;
--예제1
select employee_id, to_char(hire_date, 'MM/YY') 입사월
from employees
where department_id =100;
--예제2
select last_name 이름, to_char(salary, '$999,999,999.99') 월급
from employees
where salary > 10000
order by salary desc;
--문자열 -> 날짜로 변환
select to_date('2021-01-01', 'YYYY/MM/DD')
from dual;
--문자열 -> 숫자로 변환
select to_number('0123')+100
from dual;

--**null 관련 함수 : NVL
--NVL(값, 0) -> 만약 값이 null이면 0으로 변환
select last_name 이름, employee_id 직원번호, NVL(manager_id, 0) 매니저
from employees
where last_name='King';
--NVL2(값, 첫번째, 두번째) -> 만약 값이 null이 아니면 첫번째, null이면 두번째
select last_name 이름, employee_id 직원번호, NVL2(manager_id, 1, 0) 매니저
from employees
where last_name='King';
--예제1
select last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션,
       salary*12+salary*12*nvl(commission_pct, 0) 연봉
from employees
order by 연봉 desc;
--예제2
select last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션,
       salary * 12 + salary * 12 * nvl(commission_pct, 0) 연봉,
       nvl2(commission_pct, '월급+보너스', '월급') 연봉계산
from employees
order by 연봉 desc;

--**DECODE 함수 : 조건에 따라 데이터를 다른 값이나 컬럼 값으로 추출
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10, 
                   'ST_CLERK', salary * 1.15, 
                   'SA_REP',   salary * 1.20, 
                               salary) 수정월급
FROM employees;
--예제 : employees 테이블에서 DECODE함수를 이용해 월급에 따른 세율을 나타내세요.
Select last_name 이름, job_id 직무, salary 월급,
    DECODE(TRUNC(salary/2000), 0, 0, 
                               1, 0.09,
                               2, 0.2,
                               3, 0.3,
                               4, 0.4,
                               5, 0.42,
                               6, 0.44,
                                  0.45) 세율
FROM employees
ORDER BY 세율 DESC;

--**CASE : 조건연산자 활용 가능
--위의 DECODE 예제를 CASE함수로 변환
SELECT last_name 이름, job_id, salary,
    CASE job_id WHEN 'IT_PROG'  THEN salary * 1.10
                WHEN 'ST_CLERK' THEN salary * 1.15
                WHEN 'SA_REP'   THEN salary * 1.20
                ELSE                 salary
    END "월급 수정"
FROM employees;
--DECODE함수가 제공하지 못하는 비교연산의 단점을 CASE문으로 해결
SELECT last_name 이름, job_id, salary,
    CASE WHEN salary<5000  THEN 'Low'
         WHEN salary<10000 THEN 'Medium'
         WHEN salary<20000 THEN 'good'
         ELSE                   'excellent'
    END 급여수준
FROM employees
ORDER BY salary DESC;
--예제 : job_id가 IT_PROG에서 salry가 9000 이상이면 '상위급여', 6000과 8999 사이는 '중위급여', 그 외는 '하위급여'
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary>9000                  THEN '상위급여'
         WHEN salary BETWEEN 6000 AND 8999 THEN '중위급여' --salary>=6000
         ELSE                                   '하위급여'
    END 급여등급
FROM employees
WHERE job_id = 'IT_PROG';
