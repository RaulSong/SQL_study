�ּ�
*/
-- 1. ���̺��� ��� ��� ���� �о����, ��ɹ� ������ ctrl+ent
-- *�� ��ü ��, ��ɹ� ������ �����ݷ��� �־�� ��.
SELECT * FROM departments;

-- 2. Ư�� ���� ��ȸ
SELECT department_id, department_name
FROM departments;

-- 3. ��Ī ���̱� (���� �̸�)
select department_id as �μ���ȣ, department_name �μ��̸�
from departments;

-- 4. ��� ������(+,-,*,/)
select first_name �̸�, job_id ��å, salary ����
from employees;
-- ���޿� 100�� �� ���� �����
select first_name �̸�, job_id ��å,salary ����, salary-100 ���޼���
from employees;
-- ���޿� 10%�� ����
select first_name �̸�, job_id ��å,salary ����, salary-salary/10 ���޼���
from employees;

-- ���ʽ��� �ִµ� salary�� 1000�� �� ���� 5%�� å��
SELECT 
    last_name, 
    first_name, 
    job_id, 
    salary, 
    (salary-1000)*0.05 AS ���ʽ�
FROM employees;

-- distinct : �ߺ� ���� ���� !
SELECT DISTINCT job_id
FROM employees;

--���� 1
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;

-- ���� ������ || :���� �ٿ��� �ϳ��� ���� ���
SELECT LAST_NAME || 'is a ' || JOB_ID AS ��������
FROM EMPLOYEES;

--���� 4 : �̸� ��ĭ ���� �ٿ��� ��, email�� ���ڿ� �ٿ� ���
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, email || '@company.com'
FROM EMPLOYEES;

DESC EMPLOYEES;
