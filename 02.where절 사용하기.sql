-- where ��
select *
from employees
where salary > 14000; --������ 14,000 ���� ���� ����

select *
from employees
where last_name = 'King'; -- ���ڿ��� ����ǥ�� ǥ��;

select *
from employees
where hire_date < '2002/06/10'; -��¥�� �� ������� 2002�� 6�� 10�� ����

--���� 1
select *
from employees
where employee_id = 100;

--����2
select *
from employees
where first_name = 'David';

--����3
select *
from employees
where employee_id <= '105';

--����4
select *
from job_history
where start_date > '2006/03/03';

--����5
select *
from departments
where location_id <> 1700;

--�� ������ and or not
select last_name, department_id, salary
from employees
where department_id = 60
    or department_id = 80
    and salary > 10000;
    
select *
from employees
where not ( hire_date > '2004/01/01' or salary > 5000 );
--hire_date <= 2004. 01. 01 and salary <=5000

--����1
select *
from employees
where salary > 4000
    and job_id = 'IT_PROG';

--����2
select *
from employees
where salary > 4000
    and (job_id = 'IT_PROG' 
    or job_id = 'FI_ACCOUNT');
    
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



