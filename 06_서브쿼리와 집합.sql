--*** ���� ���� : �ϳ��� SQL���� ���ԵǾ� �ִ� �� �ٸ� SQL ���� ����

--'Popp'������ ����� : 07/12/07
SELECT
    last_name, hire_date
FROM employees
WHERE last_name = 'Popp';
--'Popp' �������� ���Ŀ� ���� ����
SELECT
    last_name �̸�, hire_date �������
FROM employees
WHERE hire_date > ( SELECT hire_date
                    FROM employees
                    WHERE last_name = 'Popp'); --���� 'Popp'������ �θ��� ��� error
--�������� ������ : ������ ���������� ����� ���� ���������� ����� ���ϴ� �����Ϳ� ���� �ϳ��� ��µǾ�� ��
-- �׷��Լ��� ����� ���������� ���
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees ); 
-- ���� Ǯ�� 1,2,3,4
SELECT last_name �̸�, salary �޿�
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel');

SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary �޿�
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull');

SELECT last_name �̸�, salary �޿�, manager_id �Ŵ���
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');

SELECT * 
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );

--**������ �������� (�������� ����� ���� ���� ������ ���)

SELECT
    MIN(salary)
FROM employees
GROUP BY department_id;
-- ������ �������������� �ٷ�  =  > < �񱳸� �� �� ����.
--* IN�� ���� �ϳ��� ������ �˻���
SELECT
    department_id, employee_id, last_name
FROM employees
WHERE salary IN (SELECT
                    MIN(salary)
                 FROM employees
                 GROUP BY department_id)
ORDER BY department_id;
-- * ANY�� ���� �ϳ��� ������ �˻�
SELECT
    department_id, last_name, salary
FROM employees
WHERE salary = ANY(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;
-- * All�� ���� ���� �� �����ؾ� �Ѵ�.
SELECT
    department_id, last_name, salary
FROM employees
WHERE salary > ALL(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;
--����1 : �μ���ȣ�� 20���� �������� �Ŵ������̵�� ���� �Ŵ����� ������ �������� ����϶� (�� 20�� �μ��� ������ ����)
SELECT
     employee_id, first_name, job_id ����, salary �޿�, department_id
FROM employees
WHERE manager_id IN (SELECT manager_id
                     FROM employees
                     WHERE department_id = 20)
AND department_id != 20;
--����2 : job_id�� 'ST_MAN'�� ������ �� ��� ������ ���ٵ� �޿��� ���� �������� ����϶�. (ANY)
SELECT
    employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY ( SELECT salary
                     FROM employees
                     WHERE job_id = 'ST_MAN');
--����3 : ��å�� 'IT_PROG'�� ������ ���� �޿��� ���� �������� ����Ͻÿ�
SELECT
    employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG');

--*���߿� �������� (���� �������϶�)
--�̸��� 'Bruce'�� ������ ���� �Ŵ���, ���� ������ ���� ��� (�� Bruce�� ����)
SELECT
    employee_id, first_name, salary, manager_id
FROM employees
WHERE (manager_id, job_id)
IN (SELECT manager_id, job_id
    FROM employees
    WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';
--�� �μ����� �ּ� �޿��� �޴� ����� �μ���ȣ, �����ȣ, �̸�, �޿� ���
SELECT
    department_id, employee_id, first_name, salary
FROM employees
WHERE (department_id, salary)
IN (SELECT department_id, MIN(salary)
    FROM employees
    GROUP BY department_id)
ORDER BY department_id;
--���� : employees ���̺��� job_id���� ���� ���� salary�� ������ ã�ƺ���, ã�Ƴ� job_id �� salary�� �ش��ϴ� ������
--first_name, job_id, salary, department_id�� ��� (salary ��������)
SELECT
    first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) 
IN (SELECT job_id, MIN(salary)
    FROM employees
    GROUP BY job_id)
ORDER BY salary DESC;
            