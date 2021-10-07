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

--10/06 ���� ���� `````````  
--**in ������ ()���� ���� ������ or�� ����
SELECT
    *
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary =2700; --or�� ����������

SELECT
    *
FROM employees
WHERE salary IN (4000, 3000, 2700); --in ���� ����
--����1
SELECT
    *
FROM employees
WHERE salary IN (10000, 17000, 24000);
--����2
SELECT
    *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--**between ������ :���� ��
SELECT
    *
FROM employees
WHERE salary >= 9000 
    AND salary <= 10000; --and�� ������ ����

SELECT
    *
FROM employees
WHERE salary
    BETWEEN 9000 AND 10000; --between�� Ȱ���Ͽ� ������ ����
--����1
SELECT
    *
FROM employees
WHERE salary
    BETWEEN 10000 AND 20000;
--����2 / employees ���̺��� hire_date�� 2004.01.01. ���� 2004.12.30.������ �������
SELECT
    *
FROM employees
WHERE hire_date
    BETWEEN '2004/01/01' AND '2004/12/31';
--����3 / employees ���̺��� salary�� 7000�̸��̰ų�, 17000���� ���� ��� ���
SELECT
    last_name, salary
FROM employees
WHERE salary
    NOT BETWEEN 7000 AND 17000;

--**Like ������ _, %�� ����׿� ���ڿ��� �˻�
SELECT 
    *
FROM employees
WHERE last_name LIKE 'B%'; --�빮�� B�� ����, �ڴ� �������.

SELECT 
    *
FROM employees
WHERE last_name LIKE '%b%'; --���ڿ� �߰��� b�� ������ ���� ��ȸ

SELECT
    *
FROM employees
WHERE last_name LIKE '%y'; --�� ���ڸ� y, ���� ��� ����

SELECT
    *
FROM employees
WHERE last_name LIKE '____y'; -- ����ٴ� ���� �ڸ��� 
--����1
SELECT
    *
FROM employees
WHERE job_id LIKE '%AD%';
--����2
SELECT
    *
FROM employees
WHERE job_id LIKE 'AD___';
--����3
SELECT
    *
FROM employees
WHERE phone_number LIKE '%1234'; --like '%1234'
--����4
SELECT
    *
FROM employees
WHERE phone_number NOT LIKE '%3%'
AND phone_number LIKE '%9'; -- = ___.___.___9
--����5
SELECT
    *
FROM employees
WHERE job_id LIKE '%MGR%'
OR job_id LIKE '%ASST%';

--***is null������ : ������ ���� 'null' �˻�
SELECT
    *
FROM employees; --commission_pct ���� null���� �ټ� ����
--null�̶�? �Էµ��� ���� ����� �� ���� ��. ( 0�̳� ���� ' '�� �ƴ�! ) 
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;
--�ݴ�� null�� �ƴ� ��츦 ã������ is not null �Է�
SELECT * 
FROM employees 
WHERE commission_pct IS NOT NULL;
--����1
SELECT
    *
FROM employees
WHERE manager_id IS NULL;
 
--**ORDER BY ��ɹ� : ���� ASC(��������) or DESC(��������)
SELECT 
    * 
FROM employees 
ORDER BY employee_id ASC;--�������� (�⺻�� ��������,��������)

SELECT 
    * FROM employees 
ORDER BY employee_id DESC;--��������
--������ ���� 2�� �̻��� ��, ù��° ���� ������ �� �ι�° ����
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id; 
--��Ī���� ���� ����
SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ���� DESC;
--����1 employees ���̺��� employ_id, first_name, last_name ����ϰ� employee_id �������� �������� ����
SELECT
    employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--����2
SELECT
    *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;
--����3
SELECT
    employee_id ������ȣ, first_name "���� �̸�", department_id �μ���ȣ, salary ����
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY �μ���ȣ DESC, ���� DESC;
