--***DML(DATA MANIPULATION LANGUAGE) 작업

--**데이터 입력 INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);
--확인
SELECT
    *
FROM departments
ORDER BY department_id DESC;
--테이블 열의 구조를 확인
DESC departments;
--특정 열만 입력(미입력시 null)
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');
--열의 이름들을 생략하면 다 적어야 함
INSERT INTO departments
VALUES (290, 'Busan', NULL, 1700);
--예제1
INSERT INTO departments
VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments
VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments
VALUES (273, 'Sample Dept 3', 200, 1700);

--**데이터의 수정 UPDATE (주의! : 특정 행을 업데이트 하므로 WHERE절을 꼭 작성해야함.)
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';
--확인
SELECT
    *
FROM departments;
--예제 : departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_id를 100으로 수정
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;
--확인
SELECT
    *
FROM departments
WHERE department_id BETWEEN 150 AND 200;
--두개 이상의 열을 업데이트 : 열 , 열, ....
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';
--확인
SELECT
    *
FROM departments;

--**데이터 삭제 : DELETE
--특정 행을 WHERE 절을 넣어서 삭제
DELETE FROM departments
WHERE department_name = 'Music';
--확인
SELECT
    *
FROM departments;
--'Game' 삭제
DELETE FROM departments
WHERE department_name = 'Game';
--'Busan' 삭제
DELETE FROM departments
WHERE department_name = 'Busan';
--'Sample 1~3' 삭제
DELETE FROM departments
WHERE department_name Like '%Sample%';
--*전체 삭제 (WHERE을 안적었을때)
DELETE FROM departments; --employees 테이블에서 참조하고 있기 때문에 전체 삭제가 안됨 : 오류
--120번 이상 부서들 삭제 : employees 테이블에서 참조안하고 있는 부서
DELETE FROM departments
WHERE department_id >= 120;
--commit전에는 롤백 가능
ROLLBACK;
--게임 부서를 생성하고 commit 해보기
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700); --생성
COMMIT; --커밋 -> 롤백 해도 game 부서는 사라지지 않음.
--*자동 commit 설정
show autocommit;
-- commit on
set autocommit on;
-- commit off
set autocommit off; 





