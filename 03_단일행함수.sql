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

