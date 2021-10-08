--***DML(DATA MANIPULATION LANGUAGE) �۾�

--**������ �Է� INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);
--Ȯ��
SELECT
    *
FROM departments
ORDER BY department_id DESC;
--���̺� ���� ������ Ȯ��
DESC departments;
--Ư�� ���� �Է�(���Է½� null)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');
--���� �̸����� �����ϸ� �� ����� ��
INSERT INTO departments
VALUES (290, 'Busan', NULL, 1700);
--����1
INSERT INTO departments
VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments
VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments
VALUES (273, 'Sample Dept 3', 200, 1700);

--**�������� ���� UPDATE (����! : Ư�� ���� ������Ʈ �ϹǷ� WHERE���� �� �ۼ��ؾ���.)
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';
--Ȯ��
SELECT
    *
FROM departments;
--���� : departments ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_id�� 100���� ����
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;
--Ȯ��
SELECT
    *
FROM departments
WHERE department_id BETWEEN 150 AND 200;
--�ΰ� �̻��� ���� ������Ʈ : �� , ��, ....
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';
--Ȯ��
SELECT
    *
FROM departments;

--**������ ���� : DELETE
--Ư�� ���� WHERE ���� �־ ����
DELETE FROM departments
WHERE department_name = 'Music';
--Ȯ��
SELECT
    *
FROM departments;
--'Game' ����
DELETE FROM departments
WHERE department_name = 'Game';
--'Busan' ����
DELETE FROM departments
WHERE department_name = 'Busan';
--'Sample 1~3' ����
DELETE FROM departments
WHERE department_name Like '%Sample%';
--*��ü ���� (WHERE�� ����������)
DELETE FROM departments; --employees ���̺��� �����ϰ� �ֱ� ������ ��ü ������ �ȵ� : ����
--120�� �̻� �μ��� ���� : employees ���̺��� �������ϰ� �ִ� �μ�
DELETE FROM departments
WHERE department_id >= 120;
--commit������ �ѹ� ����
ROLLBACK;
--���� �μ��� �����ϰ� commit �غ���
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700); --����
COMMIT; --Ŀ�� -> �ѹ� �ص� game �μ��� ������� ����.
--*�ڵ� commit ����
show autocommit;
-- commit on
set autocommit on;
-- commit off
set autocommit off; 





