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
--�����Լ��� ����ؼ� ����������(where���� �����Լ��� ����Ҽ��� ������ ���������� �̿��Ͽ� ���)
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees); 
-- ����1 : ��� 'ABEL'���� �޿��� ���� ����� �̸�, �޿��� ��Ÿ�����
SELECT last_name �̸�, salary �޿�
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel');
--����2 : 'Bull'�̶� �̸��� ���� ����� �μ����� 'Bull'���� ���� �޿��� �޴� ������� ���
SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary �޿�
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull');
--����3 : 'Russell'�̶� �̸��� ������ȣ�� �Ŵ������̵�� ������ �������� �̸�, �޿�, �Ŵ�����ȣ�� ���
SELECT last_name �̸�, salary �޿�, manager_id �Ŵ���
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');
--����4 : jobs ���̺� job_tilte�� 'Stock Manager'�� job_id�� ���� �������� ������ ���� ���̺��� ã�� ���
SELECT * 
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );

--**������ �������� (�������� ����� ���� ���� ������ ���)
SELECT
    MIN(salary)
FROM employees
GROUP BY department_id;
-- ������ �������������� �ٷ�  =  > < �񱳸� �� �� ����.
--*IN : �˻��� �� �߿� �ϳ��� ��ġ�ϸ� ��.(��������'=')
SELECT
    department_id, employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary)
                 FROM employees
                 GROUP BY department_id)
ORDER BY department_id;
--*�񱳿����� + ANY : �˻��� �� �߿� ���ǿ� �´� ���� �ϳ� �̻� ������ ��.
SELECT
    department_id, last_name, salary
FROM employees
WHERE salary < ANY(SELECT salary
                   FROM employees
                   WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG'
ORDER BY salary DESC;
--*All : ��� �˻��� ���� ���ǿ� �¾ƾ� �Ѵ�
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

--**���߿� �������� (���� �������϶�) : �ݵ�� �񱳴�� ���� 1:1 �����ž� ��
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

--**���տ����� ( UNION, INTERSECT, MINUS )
--*UNION ������ : ������ �κ� �ߺ��� ���ŵ�
SELECT
    employee_id, job_id
FROM employees
UNION
SELECT
    employee_id, job_id
FROM job_history;
--*UNION ALL ������ : �ΰ��� select���� ����� ����
SELECT
    employee_id, job_id
FROM employees
UNION ALL
SELECT
    employee_id, job_id
FROM job_history;
--*INTERSECT : ������
SELECT
    employee_id, job_id
FROM employees
INTERSECT
SELECT
    employee_id, job_id
FROM job_history;
--*MINUS ������ : �ߺ��� ���ŵ�
SELECT
    employee_id, job_id
FROM employees
MINUS
SELECT
    employee_id, job_id
FROM job_history;
--����1
SELECT
    department_id
FROM employees
UNION
SELECT
    department_id
FROM departments;
--����2
SELECT
    department_id
FROM employees
UNION ALL
SELECT
    department_id
FROM departments;
--����3
SELECT
    department_id
FROM departments
MINUS
SELECT
    department_id
FROM employees;
--����4
SELECT
    department_id
FROM employees
INTERSECT
SELECT
    department_id
FROM departments;
            
            
            
            
            
            
            
            
            
            
            
            
            