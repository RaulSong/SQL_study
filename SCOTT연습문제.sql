--연습문제1 : 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
SELECT
    empno, ename, sal
FROM emp
WHERE deptno = 10;
--연습문제2 : 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라
SELECT
    ename, hiredate, deptno
FROM emp
WHERE empno =  7369;
--연습문제3 : 이름이 ALLEN인 사람의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE ename = 'ALLEN';
--연습문제4 : 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력하라
SELECT
    ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';
--연습문제5 : 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE job != 'MANAGER'; -- '<>' = '!='
--연습문제6 : 입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라
SELECT
    *
FROM emp
WHERE hiredate >= '81/04/02';
--연습문제7 : 급여가 $800 이상인 사람의 이름, 급여, 부서번호 출력하라
SELECT
    ename, sal, deptno
FROM emp
WHERE sal >= 800;
--연습문제8 : 부서번호가 20번 이상인 사원의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE deptno >= 20;
--연습문제9 : 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라 
SELECT
    *
FROM emp
WHERE ename > 'K__';  -- 선생님 답:  ename >= 'L";
--연습문제10 : 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE hiredate < '81/12/09';
--연습문제11 : 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력하라
SELECT
    empno, ename
FROM emp
WHERE empno <= 7698;
--연습문제12 : 입사일이 81/04/02 보다 같거나 늦고 82/12/09 보다 같거나 빠른사원의 이름, 월급, 부서번호를 출력하라
SELECT
    ename, sal, deptno
FROM emp
WHERE hiredate >= '81/04/02' AND hiredate <= '82/12/09'; --BETWEEN도 활용 가능
--연습문제13 : 급여가 $1,600보다 크고 $3,000보다 작은 직원의 이름, 직업, 급여를 출력하라
SELECT
    ename, job, sal
FROM emp
WHERE sal > 1600 AND sal < 3000; 
--연습문제14 : 직원번호가 7654와 7782 사이가 아닌 직원의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;
--연습문제15 : 이름이 B와 J 사이의 모든 직원의 정보를 출력하라
SELECT
    *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';
--연습문제16 : 입사일이 81년이 아닌 모든 직원의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' and '81/12/31';
--연습문제17 : 직업이 MANAGER이거나 SALESMAN인 직원의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE job in ('MANAGER', 'SALESMAN'); --OR 활용 가능
--연습문제18 : 부서번호가 20,30번을 제외한 모든 직원의 이름, 사원번호, 부서번호 출력하라
SELECT
    ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);
--연습문제19 : 이름이 S로 시작하는 직원의 사원번호, 이름, 입사일, 부서번호를 출력하라
SELECT
    empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';
--연습문제20 : 입사일이 81년도인 사람의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';
--연습문제21 : 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE ename LIKE '%S%';
--연습문제22 : 이름이 M으로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE ename LIKE 'M____N';
--연습문제23 : 이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라 / 복습
SELECT
    *
FROM emp
WHERE ename LIKE '_A%';
--연습문제24 : 커미션이 NULL인 사람의 정보를 출력하라
SELECT
    *
FROM emp
WHERE comm is null;
--연습문제25 : 커미션이 NULL이 아닌 사람의 모든 정보를 출력하라
SELECT
    *
FROM emp
WHERE comm is not null;
--연습문제26 : 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라
SELECT
    ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500;
--연습문제27 : 이름의 첫글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라
SELECT
    empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;
--연습문제28 : 급여가 $1,500 이상이고 부서번호가 30번인 사원중 직업이 MANAGER인 사람의 정보를 출력하라
SELECT
    *
FROM emp
WHERE sal >= 1500 AND deptno = 30 AND job = 'MANAGER';
--연습문제29 : 부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라
SELECT
    *
FROM emp
WHERE deptno = 30
ORDER BY empno;
--연습문제30 : 직원들의 급여가 많은 순으로 SORT(정렬)하라
SELECT
    *
FROM emp
ORDER BY sal DESC;
--연습문제31 : 부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 출력하라
SELECT
    *
FROM emp
ORDER BY deptno, sal desc;
--연습문제32 : 부서번호를 내림차순으로하고, 이름 순으로 오름차순, 급여순으로 내림차순 하라
SELECT
    deptno, ename, sal
FROM emp
ORDER BY deptno desc, empno, sal desc;
--연습문제33 : 10번 부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라 
SELECT
    ename, sal, round(sal*0.13) BONUS, deptno
FROM emp
WHERE deptno=10;
--연습문제34 : 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하여라(단, 커미션이 null인 사원도 0으로 해서 포함)
SELECT
    ename, sal, NVL(comm, 0), sal+NVL(comm, 0) TOTAL
FROM emp
ORDER BY TOTAL desc;
--연습문제35 : 급여가 $1,500~$3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다. 모든 사원의 이름,급여,회비(소수 이하 2자리 반올림)하여 출력하여라 ////
SELECT
    ename, sal, decode(sal, 'between 1500 and 3000' *0.15)
FROM emp;
--연습문제36 : 사원수가 5명이 넘는 부서의 부서명과 사원수 조회(JOIN 필요)////
SELECT
    d.dname, COUNT(e.empno)
FROM dept d
JOIN emp e
    ON d.deptno = e.deptno
GROUP BY d.dname
HAVING COUNT(*) > 5;
--연습문제 37 : 직업별 급여합계가 5,000을 초과하는 각 직무에 대해 직무와 급여 합계를 조회. 단, 판매원('SALESMAN')은 제외
SELECT
    job, SUM(sal)
FROM emp
WHERE job  <> 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;
--연습문제 38 : 사원들의 사원번호(empno),사원명(ename),급여(sal),급여등급(grade)을 출력하시오(테이블 salgrade JOIN)
SELECT
    e.empno, e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;
--연습문제39 : 부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력하시오
SELECT
    DISTINCT deptno, COUNT(deptno)
FROM emp;

































































