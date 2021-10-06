--***JOIN

--on�� ����� �⺻ JOIN
SELECT
    e.employee_id ������ȣ, e.last_name �̸�, d.department_id �μ���ȣ, d.department_name �μ��̸�
FROM employees e --��Ī ���� 
JOIN departments d --��Ī ����
    ON e.department_id = d.department_id;
--WHERE���� ����� ���� JOIN ���
SELECT
    e.employee_id ������ȣ, e.last_name �̸�, d.department_id �μ���ȣ, d.department_name �μ��̸�
FROM employees e, departments d--��Ī ����
WHERE e.department_id = d.department_id;
--3�� ���̺� JOIN
SELECT
    e.employee_id ������ȣ, d.department_name �μ���, l.city ����
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;
--����
SELECT
    d.department_name �μ���, l.city ���ø�, c.country_name ������
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON d.location_id = l.location_id
WHERE l.city IN('Seattle', 'London') 
    AND c.country_name Like 'United%';
    

--**��ü JOIN(SELF JOIN)

SELECT
    e.last_name ����, m.last_name �Ŵ���
FROM employees e
JOIN employees m 
ON e.manager_id = m.employee_id;

