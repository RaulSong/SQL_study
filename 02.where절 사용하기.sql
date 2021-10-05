--***where ��, ������
SELECT * --����Ϸ��� ��
FROM employees --�����Ϸ��� ���̺�
WHERE salary > 14000; --���ǽ�

SELECT *
FROM employees
WHERE last_name = 'King'; -- ���ڿ��� ����ǥ�� ǥ��;

/* �� ��ȸ ���� �ֱ�
�� ������
= : ����
<> (!=) : ���� �ʴ�
> : ���� ũ��
< : ���� �۴�
>= : ���� ũ�ų� ����
<= : ���� �۰ų� ����  */
SELECT *
FROM employees
WHERE hire_date < '02/06/10';
--����1
SELECT 
    *
FROM employees
WHERE employee_id = 100;
--����2
SELECT 
    *
FROM employees
WHERE first_name = 'David';
--����3
SELECT
    *
FROM employees
WHERE employee_id <= 105;
--����4
SELECT
    *
FROM job_history
WHERE start_date > '2006/03/03';
--����5
SELECT
    *
FROM departments
WHERE location_id != 1700; -- = <> 1700


--**�� ������ AND, OR, NOT
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
--����1
SELECT
    *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';
--����2
SELECT
    *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT';

--10/05 ���� �������~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
--in ������ ()���� ���� ������ or�� ����
select *
from employees
where salary in (4000, 3000, 2700);

--����1
select *
from employees
where salary in (10000, 17000, 24000);

--����2
select *
from employees
where department_id not in (30, 50, 80, 100, 110);

--between ������ :���� ��
select *
from employees
where salary between 9000 and 10000;

--����1
select *
from employees
where salary between 10000 and 20000;
--����2 / employees ���̺��� hire_date�� 2004.01.01. ���� 2004.12.30.������ �������
select *
from employees
where hire_date between '2004/01/01' and '2004/12/30';
--����3 / employees ���̺��� salary�� 7000�̸��̰ų�, 17000���� ���� ��� ���
select *
from employees
where salary not between 7000 and 17000;

--like ������ _, %�� ����׿� ���ڿ��� �˻�
select *
from employees
where last_name like 'B%'; --�빮�� B�� ����, �ڴ� �������.

select *
from employees
where last_name like '%b%'; --���ڿ� �߰��� b�� ������ ���� ��ȸ

select *
from employees
where last_name like '____y'; --����� (_) ��Ȯ�� �ڸ����� ǥ��

--����1
select *
from employees
where job_id like '%AD%';
--����2
select *
from employees
where job_id like 'AD___';
--����3
select *
from employees
where phone_number like '___.___.1234'; --like '%1234'
--����4
select *
from employees
where phone_number not like '%3%' 
and phone_number like '___.___.___9'; --like '%9'
--����5
select *
from employees
where job_id like '%MGR%' or job_id like '%ASST%';

--***is null������, order by ������
select
*
from employees;
--null�̶�? �Էµ��� ���� ����� �� ���� ��. ( 0�̳� ���� ' '�� �ƴ�! ) 
SELECT
*
FROM employees
where commission_pct is null;
--�ݴ�� null�� �ƴ� ��츦 ã������ is not null �Է�
SELECT * FROM employees where commission_pct is not null;
--����1
SELECT*FROM employees WHERE manager_id is null;

--***order by ��ɹ� : ���� ASC(��������) or DESC(��������)
SELECT * FROM employees ORDER BY employee_id ASC;--�������� (�⺻�� ��������,��������)
SELECT * FROM employees ORDER BY employee_id DESC;--��������
--������ ���� 2�� �̻��� ��, ù��° ���� ������ �� �ι�° ����
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; 
--��Ī���� ���� ����
select department_id, last_name, salary*12 ����
from employees
order by ���� desc;
--����1 employees ���̺��� employ_id, first_name, last_name ����ϰ� employee_id �������� �������� ����
select employee_id, first_name, last_name
from employees
order by employee_id desc;
--����2
select job_id, first_name, salary
from employees
where job_id 
like '%CLERK%'
order by salary desc;
--����3
select employee_id ������ȣ, first_name �����̸�, department_id �μ���ȣ, salary ����
from employees
where employee_id between 120 and 150
order by department_id desc, ���� desc;




