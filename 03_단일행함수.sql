--***������ �Լ�

--**������ �Լ�
--*��ҹ��� ��ȯ UPPER LOWER INITCAP: ù ���ڸ� �빮�ڷ� ��ȯ�ϰ�, �������� �ҹ��ڷ� ��ȯ
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course')
FROM DUAL; --��� �׽�Ʈ�� ���̺��� �̿��Ͽ� �н�
--*���� ���� �Լ�
SELECT substr('ABCDEFG', 3, 4), length('ABCDEFG'), instr('ABCDEFG','D')
FROM DUAL;

SELECT TRIM( '     ��ο�  '), '   ��ο� ' --������ ������.
FROM dual; 
--����1
select department_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, concat('��������   ', job_id) as ������
from employees
where substr(job_id, 4, 3)= 'REP';

--���ڿ� ���� �� ���� ���
select last_name, substr(last_name, -1, 1) -- '-1'�� ���ڿ� ���� ��
from employees;

--���ڿ� ġȯ
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') --replace ġȯ
from employees;

select job_id, translate(job_id, 'ACCOUNT', 'O', '*')
from employees;

--����1
select first_name �̸�, lower(first_name) lower����, upper(first_name) upper����, email �̸���, initcap(email)
from employees;
--����2
select job_id ������, substr(job_id, 1, 2) ����2��
from employees;

--**������ �Լ�
--*�ݿø� �Լ� ROUND (����, �ڸ���)
SELECT round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2) 
FROM dual;
--*TRUNC : ���ڸ� �����Ѵ�. 0�� �Ҽ��� ù° �ڸ�
SELECT trunc(15.193), trunc(15.193, 0), trunc(15.193, 1), trunc(15.193, 2) 
FROM dual;
--*MOD : ������ �� �������� ����
SELECT employee_id ¦����°, last_name
FROM employees
WHERE mod(employee_id, 2) = 0 --¦��
ORDER by employee_id;
--����
SELECT salary, trunc(salary/30) ����,  round(salary/30, 1) �Ҽ�1, round(salary/30, -1) "10�� �ڸ�"
FROM employees;

--**��¥�� �Լ�
select sysdate, round(sysdate, 'DD') ��, round(sysdate, 'MM') ��, round(sysdate, 'YYYY') �⵵  --sysdate�� ���糯¥�� �ǹ�
        , round(months_between('2021/10/05', '2021/06/10'),1) ������
from dual;
-- ��¥�� ���ϱ�, ���⸦ �ϸ� > > > ���� ��¥�� ���ϰų� ������.
select sysdate ���ó�¥, sysdate +1 ����, sysdate -1 ����
from dual;
--����1
select department_id, sysdate, hire_date, months_between(sysdate,hire_date)
from employees
where department_id = 100;
--����2
select hire_date, add_months(hire_date,+3), add_months(hire_date,-3) 
from employees
where employee_id between 100 and 106;

--**��ȯ�� �Լ� : TO_CHAR
--���ڸ� ���ڷ� ��ȯ
select 
to_char(12345678 , '999,999,999') �޸�����,
to_char(12345.678 , '999,999,999.99') �޸��Ҽ�������,
to_char(12345678 , '$999,999,999') �޷�����,
to_char(12345678 , 'L999,999,999') ������ȭ
from dual;
--��¥  -> ���ڷ� ��ȯ
SELECT 
TO_CHAR( sysdate, 'YY-MM-DD') ��¥ǥ��,
TO_CHAR( sysdate, 'YY-MM-DD HH24:MI:SS') �ð�ǥ��
FROM dual;
--����1
select employee_id, to_char(hire_date, 'MM/YY') �Ի��
from employees
where department_id =100;
--����2
select last_name �̸�, to_char(salary, '$999,999,999.99') ����
from employees
where salary > 10000
order by salary desc;
--���ڿ� -> ��¥�� ��ȯ
select to_date('2021-01-01', 'YYYY/MM/DD')
from dual;
--���ڿ� -> ���ڷ� ��ȯ
select to_number('0123')+100
from dual;

--**null ���� �Լ� : NVL
--NVL(��, 0) -> ���� ���� null�̸� 0���� ��ȯ
select last_name �̸�, employee_id ������ȣ, NVL(manager_id, 0) �Ŵ���
from employees
where last_name='King';
--NVL2(��, ù��°, �ι�°) -> ���� ���� null�� �ƴϸ� ù��°, null�̸� �ι�°
select last_name �̸�, employee_id ������ȣ, NVL2(manager_id, 1, 0) �Ŵ���
from employees
where last_name='King';
--����1
select last_name �̸�, salary ����, nvl(commission_pct, 0) Ŀ�̼�,
       salary*12+salary*12*nvl(commission_pct, 0) ����
from employees
order by ���� desc;
--����2
select last_name �̸�, salary ����, nvl(commission_pct, 0) Ŀ�̼�,
       salary * 12 + salary * 12 * nvl(commission_pct, 0) ����,
       nvl2(commission_pct, '����+���ʽ�', '����') �������
from employees
order by ���� desc;

--**DECODE �Լ� : ���ǿ� ���� �����͸� �ٸ� ���̳� �÷� ������ ����
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10, 
                   'ST_CLERK', salary * 1.15, 
                   'SA_REP',   salary * 1.20, 
                               salary) ��������
FROM employees;
--���� : employees ���̺��� DECODE�Լ��� �̿��� ���޿� ���� ������ ��Ÿ������.
Select last_name �̸�, job_id ����, salary ����,
    DECODE(TRUNC(salary/2000), 0, 0, 
                               1, 0.09,
                               2, 0.2,
                               3, 0.3,
                               4, 0.4,
                               5, 0.42,
                               6, 0.44,
                                  0.45) ����
FROM employees
ORDER BY ���� DESC;

--**CASE : ���ǿ����� Ȱ�� ����
--���� DECODE ������ CASE�Լ��� ��ȯ
SELECT last_name �̸�, job_id, salary,
    CASE job_id WHEN 'IT_PROG'  THEN salary * 1.10
                WHEN 'ST_CLERK' THEN salary * 1.15
                WHEN 'SA_REP'   THEN salary * 1.20
                ELSE                 salary
    END "���� ����"
FROM employees;
--DECODE�Լ��� �������� ���ϴ� �񱳿����� ������ CASE������ �ذ�
SELECT last_name �̸�, job_id, salary,
    CASE WHEN salary<5000  THEN 'Low'
         WHEN salary<10000 THEN 'Medium'
         WHEN salary<20000 THEN 'good'
         ELSE                   'excellent'
    END �޿�����
FROM employees
ORDER BY salary DESC;
--���� : job_id�� IT_PROG���� salry�� 9000 �̻��̸� '�����޿�', 6000�� 8999 ���̴� '�����޿�', �� �ܴ� '�����޿�'
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary>9000                  THEN '�����޿�'
         WHEN salary BETWEEN 6000 AND 8999 THEN '�����޿�' --salary>=6000
         ELSE                                   '�����޿�'
    END �޿����
FROM employees
WHERE job_id = 'IT_PROG';
