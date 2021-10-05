/* ������ SQL �ۼ� ��Ģ
1.SQL���� �빮�ڿ� �ҹ��ڸ� �������� ����.
2.SQL���� �� �� �Ǵ� ���� �ٷ� �ۼ��� �� ����.
-�������� ������ ���̼��� ���� ������ �޶����� ���� ����.
-��ɾ�� ���� �ٷ� ���� �� ����.
3.�ڵ� ���ؿ� ���� �鿩����� SQL ������ �� �� �б� ���� ��.
4.��ɾ �빮�ڷ� �ۼ��ϰ� �������� �ҹ��ڷ� �ۼ��ϸ� �������� ������.
5.�ּ� -- (����), /* (������)
6.�ڵ� ���� CTRL+ENTER
*/

--***SELECT��(Statement) : �ʿ��� ������ ��ȸ

-- ���̺��� ��� ��� ���� �о����, ��ɹ� ������ ctrl+ent
-- *�� ��ü ��, ��ɹ� ������ �����ݷ��� �־�� ��.
SELECT * FROM departments;
--**Ư�� ���� ��ȸ
SELECT department_id �μ�ID, department_name �μ���, manager_id �Ŵ���ID
FROM departments;
--**��Ī ���̱� (���� �̸�) : as�� ��������, ����,��ҹ���,Ư������ ����Ϸ��� "" ���!
select department_id "�μ� ID!", department_name �μ��̸�
from departments;
--**��� ������(+,-,*,/)
select first_name �̸�, job_id ��å, salary ����
from employees;
-- ���޿� 100�� �� ���� �����
select first_name �̸�, job_id ��å,salary ����, salary-100 "���޼���-100"
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
    (salary-1000)*0.05 ���ʽ�
FROM employees;
--**distinct : �ߺ� ���� ���� !
SELECT distinct job_id
FROM employees;
--����1
SELECT employee_id, first_name, last_name
FROM EMPLOYEES;
--����2
SELECT first_name, salary, salary*1.1 ��������
FROM employees;
--����3
SELECT employee_id �����ȣ, first_name �̸�, last_name �� 
FROM employees;
--**���� ������ || :���� �ٿ��� �ϳ��� ���� ���
SELECT last_name || ' is a ' || JOB_ID ��������
FROM employees;
--����4
SELECT employee_id, first_name || ' ' || last_name, email || '@company.com'
FROM employees;
