�ּ�
*/
-- 1. ���̺��� ��� ��� ���� �о����, ��ɹ� ������ ctrl+ent
-- *�� ��ü ��, ��ɹ� ������ �����ݷ��� �־�� ��.
SELECT * FROM departments;

-- 2. Ư�� ���� ��ȸ
SELECT department_id, department_name
FROM departments;

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
