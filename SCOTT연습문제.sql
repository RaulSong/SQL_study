--��������1 : �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
SELECT
    empno, ename, sal
FROM emp
WHERE deptno = 10;
--��������2 : �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�
SELECT
    ename, hiredate, deptno
FROM emp
WHERE empno =  7369;
--��������3 : �̸��� ALLEN�� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE ename = 'ALLEN';
--��������4 : �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�
SELECT
    ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';
--��������5 : ������ MANAGER�� �ƴ� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE job != 'MANAGER'; -- '<>' = '!='
--��������6 : �Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�
SELECT
    *
FROM emp
WHERE hiredate >= '81/04/02';
--��������7 : �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ ����϶�
SELECT
    ename, sal, deptno
FROM emp
WHERE sal >= 800;
--��������8 : �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE deptno >= 20;
--��������9 : �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶� 
SELECT
    *
FROM emp
WHERE ename > 'K__';  -- ������ ��:  ename >= 'L";
--��������10 : 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE hiredate < '81/12/09';
--��������11 : ������ȣ�� 7698���� �۰ų� ���� ������� ������ȣ�� �̸��� ����϶�
SELECT
    empno, ename
FROM emp
WHERE empno <= 7698;
--��������12 : �Ի����� 81/04/02 ���� ���ų� �ʰ� 82/12/09 ���� ���ų� ��������� �̸�, ����, �μ���ȣ�� ����϶�
SELECT
    ename, sal, deptno
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/09'; --BETWEEN�� Ȱ�� ����
--��������13 : �޿��� $1,600���� ũ�� $3,000���� ���� ������ �̸�, ����, �޿��� ����϶�
SELECT
    ename, job, sal
FROM emp
WHERE sal > 1600 AND sal < 3000; 
--��������14 : ������ȣ�� 7654�� 7782 ���̰� �ƴ� ������ ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;
--��������15 : �̸��� B�� J ������ ��� ������ ������ ����϶�
SELECT
    *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';
--��������16 : �Ի����� 81���� �ƴ� ��� ������ ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' and '81/12/31';
--��������17 : ������ MANAGER�̰ų� SALESMAN�� ������ ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE job in ('MANAGER', 'SALESMAN'); --OR Ȱ�� ����
--��������18 : �μ���ȣ�� 20,30���� ������ ��� ������ �̸�, �����ȣ, �μ���ȣ ����϶�
SELECT
    ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);
--��������19 : �̸��� S�� �����ϴ� ������ �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�
SELECT
    empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';
--��������20 : �Ի����� 81�⵵�� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
--��������21 : �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE ename LIKE '%S%';
--��������22 : �̸��� M���� �����ϰ� ������ ���ڰ� N�� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE ename LIKE 'M____N';
--��������23 : �̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶� / ����
SELECT
    *
FROM emp
WHERE ename LIKE '_A%';
--��������24 : Ŀ�̼��� NULL�� ����� ������ ����϶�
SELECT
    *
FROM emp
WHERE comm is null;
--��������25 : Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�
SELECT
    *
FROM emp
WHERE comm is not null;
--��������26 : �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ�, ������ ����϶�
SELECT
    ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500;
--��������27 : �̸��� ù���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�
SELECT
    empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;
--��������28 : �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ����� ������ MANAGER�� ����� ������ ����϶�
SELECT
    *
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER';
--��������29 : �μ���ȣ�� 30�� ����� ��� ������ ����ϰ� ������ȣ�� SORT(����)�϶�
SELECT
    *
FROM emp
WHERE deptno = 30
ORDER BY empno;
--��������30 : �������� �޿��� ���� ������ SORT(����)�϶�
SELECT
    *
FROM emp
ORDER BY sal DESC;
--��������31 : �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��� ������ ����϶�
SELECT
    *
FROM emp
ORDER BY deptno, sal desc;
--��������32 : �μ���ȣ�� �������������ϰ�, �̸� ������ ��������, �޿������� �������� �϶�
SELECT
    deptno, ename, sal
FROM emp
ORDER BY deptno desc, empno, sal desc;
--��������33 : 10�� �μ��� ��� �������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶� 
SELECT
    ename, sal, round(sal*0.13) BONUS, deptno
FROM emp
WHERE deptno=10;
--��������34 : ������ �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����Ͽ���(��, Ŀ�̼��� null�� ����� 0���� �ؼ� ����)
SELECT
    ename, sal, NVL(comm, 0), sal+NVL(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL desc;
--��������35 : �޿��� $1,500~$3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���. ��� ����� �̸�,�޿�,ȸ��(�Ҽ� ���� 2�ڸ� �ݿø�)�Ͽ� ����Ͽ��� ////
SELECT
    ename, sal, decode(sal, 'between 1500 and 3000' *0.15)
FROM emp;
--��������36 : ������� 5���� �Ѵ� �μ��� �μ���� ����� ��ȸ(JOIN �ʿ�)////
SELECT
    d.dname, COUNT(e.empno)
FROM dept d
JOIN emp e
    ON d.deptno = e.deptno
GROUP BY d.dname
HAVING COUNT(*) > 5;
--�������� 37 : ������ �޿��հ谡 5,000�� �ʰ��ϴ� �� ������ ���� ������ �޿� �հ踦 ��ȸ. ��, �Ǹſ�('SALESMAN')�� ����
SELECT
    job, SUM(sal)
FROM emp
WHERE job  <> 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;
--�������� 38 : ������� �����ȣ(empno),�����(ename),�޿�(sal),�޿����(grade)�� ����Ͻÿ�(���̺� salgrade JOIN)
SELECT
    e.empno, e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;
--��������39 : �μ���(deptno)�� ����� ���� Ŀ�̼�(comm)�� ���� ����� ���� ����Ͻÿ�
SELECT
    DISTINCT deptno, COUNT(deptno)
FROM emp;

































































