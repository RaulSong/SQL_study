--***DDL(Data Definition Language) - ������ ���Ǿ� : ���̺��� ����, ����, ����

--**���̺� ���� (Create)
CREATE TABLE �׽�Ʈ (
    ���ڿ� VARCHAR2(100),
    ����   NUMBER,
    ��¥   DATE DEFAULT SYSDATE
    );
--**���̺� ���� (Drop)
DROP TABLE �׽�Ʈ;

DESC �׽�Ʈ;

SELECT
    *
FROM �׽�Ʈ;

--������ �Է�
INSERT INTO �׽�Ʈ
VALUES ('HTML', 5, '2021-10-08');
INSERT INTO �׽�Ʈ
VALUES ('CSS', 3, sysdate);
INSERT INTO �׽�Ʈ(���ڿ�, ����)
VALUES ('JAVA', 7);
--*���� ���̺��� ī���ؼ� ����� �溡
--�� ������ ����
CREATE TABLE EMP_TEMP
AS
SELECT
    *
FROM employees
WHERE 1 != 1;
--Ȯ��
SELECT
    *
FROM emp_temp;
--80�� �μ��� �����鸸 ���� ���̺� �����غ���
CREATE TABLE EMP_80
AS
SELECT
    employee_id ������ȣ, last_name �̸�, salary ����, salary*12 ����, hire_date
    �����
FROM employees
WHERE department_id = 80;
--Ȯ��
SELECT
    *
FROM emp_80;
--����
CREATE TABLE stmans
AS
SELECT
    employee_id ID, job_id JOB, salary SAL
FROM employees
WHERE job_id = 'ST_MAN';
--���� Ȯ��
SELECT
    *
FROM stmans;











