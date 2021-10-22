--***�� �����
DROP VIEW EMP_V1;
CREATE VIEW EMP_V1(������ȣ, �̸�, ��, �̸���, �����, ����)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees;
--�信 �����͸� �Է�(���� ���̺��� �ƴϱ� ������ �����δ� ���̺� �Է�)
INSERT INTO EMP_V1(������ȣ,�̸�,��,�̸���,�����,����)
VALUES(333,'���','��','Peng',SYSDATE,'IT_PROG');
INSERT INTO EMP_V1(������ȣ, �̸�, ��, �̸���, �����, ����)
VALUES(334,'Alexandre','Lacazette','ALELAKA',SYSDATE,'IT_PROG');
select * from employees;

--**������ ��
--*�׷��Լ��� �� ��� DML(�Է�,����,���� ��) �Ұ�
CREATE OR REPLACE VIEW �μ���_����_����
AS
SELECT department_id �μ���ȣ, COUNT(*) ������,
    MAX(salary) �ְ�޿�,
    MIN(salary) �����޿�,
    ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY department_id;

select * from �μ���_����_����;

--*�б� ���� �� (WITH READ ONLY) : 90�� �μ� �������� �б� ���� ��
CREATE OR REPLACE VIEW EMP90_read(������ȣ, �̸�, ��, �̸���, �����, ����)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees
WHERE department_id = 90
WITH READ ONLY;
select * from emp90_read;
--DML�۾� �Ұ�
DELETE FROM emp90_read; --���� �߻�





