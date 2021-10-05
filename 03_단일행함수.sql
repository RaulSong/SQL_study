--***단일행 함수

--**문자 함수
--*대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course')FROM DUAL; --듀얼 테스트용 테이블을 이용하여 학습
--*문자 조작 함수
select substr('ABCDEFG', 3, 4), length('ABCDEFG'), instr('ABCDEFG','D')FROM DUAL;

select trim( '     헬로우  '), '   헬로우 ' from dual; --공백을 없애줌.

--문자함수 예제1
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
--반올림 함수 round (숫자, 자릿수)
select round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2) from dual;
select trunc(15.193), trunc(15.193, 0), trunc(15.193, 1), trunc(15.193, 2) from dual;

select employee_id 짝수번째, last_name
from employees
where mod(employee_id, 2) = 0 --짝수
order by employee_id;
--예제
select salary, trunc(salary/30) 정수,  round(salary/30, 1) 소수1, round(salary/30, -1)
from employees;




--***************10/05 수업*******************


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


--**변환형 함수
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


--**null 관련 함수

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

--**decode 함수

select last_name 이름, job_id, salary,
decode(job_id, 'IT_PROG', salary *1.10, 'ST_CLERK', salary*1.15, 'SA_REP', salary*1.20, salary) 수정월급
from employees;
--예제
select last_name 이름, job_id 직무, salary 월급,
decode(trunc(salary/2000), 0, 0, 
1, 0.09,
2, 0.2,
3, 0.3,
4, 0.4,
5, 0.42,
6, 0.44,
0.45) 세율
from employees
order by 세율 desc;

--**case : 함수 비교가능

select last_name 이름, job_id, salary,
case 
when salary<5000 then 'Low'
when salary<10000 then 'Medium'
when salary<20000 then 'good'
else 'excellent'
end 급여수준
from employees
order by salary desc;
--예제
select employee_id, first_name, last_name, salary,
case 
when salary>9000 then '상위급여'
when salary between 6000 and 8999 then '중위급여' --salary>=6000
else '하위급여'
end 급여등급
from employees
where job_id='IT_PROG';
