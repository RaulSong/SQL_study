--***������ �Լ�

--**���� �Լ�
--*��ҹ��� ��ȯ UPPER LOWER INITCAP
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course')FROM DUAL; --��� �׽�Ʈ�� ���̺��� �̿��Ͽ� �н�
--*���� ���� �Լ�
select substr('ABCDEFG', 3, 4), length('ABCDEFG'), instr('ABCDEFG','D')FROM DUAL;

select trim( '     ��ο�  '), '   ��ο� ' from dual; --������ ������.

--�����Լ� ����1
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
--�ݿø� �Լ� round (����, �ڸ���)
select round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2) from dual;
select trunc(15.193), trunc(15.193, 0), trunc(15.193, 1), trunc(15.193, 2) from dual;

select employee_id ¦����°, last_name
from employees
where mod(employee_id, 2) = 0 --¦��
order by employee_id;
--����
select salary, trunc(salary/30) ����,  round(salary/30, 1) �Ҽ�1, round(salary/30, -1)
from employees;




--***************10/05 ����*******************


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


--**��ȯ�� �Լ�
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


--**null ���� �Լ�

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

--**decode �Լ�

select last_name �̸�, job_id, salary,
decode(job_id, 'IT_PROG', salary *1.10, 'ST_CLERK', salary*1.15, 'SA_REP', salary*1.20, salary) ��������
from employees;
--����
select last_name �̸�, job_id ����, salary ����,
decode(trunc(salary/2000), 0, 0, 
1, 0.09,
2, 0.2,
3, 0.3,
4, 0.4,
5, 0.42,
6, 0.44,
0.45) ����
from employees
order by ���� desc;

--**case : �Լ� �񱳰���

select last_name �̸�, job_id, salary,
case 
when salary<5000 then 'Low'
when salary<10000 then 'Medium'
when salary<20000 then 'good'
else 'excellent'
end �޿�����
from employees
order by salary desc;
--����
select employee_id, first_name, last_name, salary,
case 
when salary>9000 then '�����޿�'
when salary between 6000 and 8999 then '�����޿�' --salary>=6000
else '�����޿�'
end �޿����
from employees
where job_id='IT_PROG';
