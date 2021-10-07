--***JOIN

--on을 사용한 기본 JOIN
SELECT
    e.employee_id 직원번호, e.last_name 이름, d.department_id 부서번호, d.department_name 부서이름
FROM employees e --별칭 선언 
JOIN departments d --별칭 선언
    ON e.department_id = d.department_id;
--WHERE절을 사용한 예전 JOIN 방법
SELECT
    e.employee_id 직원번호, e.last_name 이름, d.department_id 부서번호, d.department_name 부서이름
FROM employees e, departments d--별칭 선언
WHERE e.department_id = d.department_id;
--3개 테이블 JOIN
SELECT
    e.employee_id 직원번호, d.department_name 부서명, l.city 도시
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON l.location_id = d.location_id;
--예제
SELECT
    d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM countries c
JOIN locations l ON c.country_id = l.country_id
JOIN departments d ON d.location_id = l.location_id
WHERE l.city IN('Seattle', 'London') 
    AND c.country_name Like 'United%';
    

--**자체 JOIN(SELF JOIN)

SELECT
    e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m 
ON e.manager_id = m.employee_id;

--**외부 JOIN
--기본JOIN : 부서번호가 null인 값의 직원은 제외 -> 106명 출력
SELECT
    e.last_name 직원이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
--부서번호가 null인 직원
SELECT
    *
FROM employees
WHERE department_id is null;
--*LEFT 외부 JOIN
SELECT
    e.last_name 직원이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d -- -> 직원 모두 출력 but 부서가 null 값도 출력
ON e.department_id = d.department_id;
--*RIHGT 외부 JOIN
SELECT
    e.last_name 직원이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d -- -> 부서명 모두 출력 but 부서에 없는 직원인 null 값이 모두 출력
ON e.department_id = d.department_id;
--*FULL 외부 JOIN
SELECT
    e.last_name 직원이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;
--예제1
SELECT
    c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시 
FROM countries c
LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;
--*교차 JOIN
SELECT
    c.country_name 국가, r.region_name 지역
FROM countries c
CROSS JOIN regions r;





















