--***������ �Լ�

--**���� �Լ�
--*��ҹ��� ��ȯ UPPER LOWER INITCAP
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course')FROM DUAL; --��� �׽�Ʈ�� ���̺��� �̿��Ͽ� �н�
--*���� ���� �Լ�
select substr('ABCDEFG', 3, 4), length('ABCDEFG'), instr('ABCDEFG','D')FROM DUAL;

select trim( '     ��ο�  '), '   ��ο� ' from dual; --������ ������.

--�����Լ� ����1
select department_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, concat('��������   ', job_id) as ������
from employees
where substr(job_id, 4, 3)= 'REP';

--���ڿ� ���� �� ���� ���
select last_name, substr(last_name, -1, 1) -- '-1'�� ���ڿ� ���� ��
from employees;

--���ڿ� ġȯ
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') --replace ġȯ
from employees;

select job_id, translate(job_id, 'ACCOUNT', 'O', '*')
from employees;

--����1
select first_name �̸�, lower(first_name) lower����, upper(first_name) upper����, email �̸���, initcap(email)
from employees;
--����2
select job_id ������, substr(job_id, 1, 2) ����2��
from employees;

--**������ �Լ�
--�ݿø� �Լ� round (����, �ڸ���)
select round(15.193), round(15.193, 0), round(15.193, 1), round(15.193, 2) from dual;
select trunc(15.193), trunc(15.193, 0), trunc(15.193, 1), trunc(15.193, 2) from dual;

select employee_id ¦����°, last_name
from employees
where mod(employee_id, 2) = 0 --¦��
order by employee_id;

