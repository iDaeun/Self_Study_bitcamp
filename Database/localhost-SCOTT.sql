-- (<-주석처리)
-- 테이블의 컬럼들의 도메인 속성을 확인할 수 있음
-- 데이터 입력시, 데이터 수정 시
DESC dept;

-- 데이터를 검색하는 명령
-- select {칼럼 이름 , ...} from 테이블 이름
-- 1) 행단위로 찾고 2) 칼럼으로 찾아냄
select * from dept;
select deptno from dept; -- 모든 부서의 부서번호 리스트
select dname from dept; -- 모든 부서의 이름 리스트
select dname, loc, deptno from dept; -- *으로 불러온것과 칼럼의 순서들이 다름

-- emp 테이블 확인
desc emp;
-- 전체 칼럼 출력
select * from emp;
-- 사원의 번호, 이름의 리스트
select empno, ename from emp;

-- 칼럼의 사칙연산
select sal
from emp
;
select sal + comm 
from emp
; -- null값 : 있는 값도 아니고 없는 값도 아니다, 아직 입력되지 않은 값이다 (사칙연산에서 null이 있으면 null이 나옴)
select sal, sal+100 
from emp
;
select sal, sal-100 
from emp
;
select ename, sal, sal*12
from emp
;
select sal, sal+100 
from emp
;
select sal, sal/5 
from emp
;

-- nvl함수 : 특정 칼럼의 데이터가 null인 경우 특정 데이터로 치환해주는 함수
-- nvl (칼럼이름, 치환값 -> 데이터 타입[숫자/날짜/문자열 등등])
select ename, sal, comm, sal*12 + comm from emp;
select ename, sal, comm, sal*12 + comm, nvl(comm, 0), sal*12+nvl(comm, 0) from emp; 
-- as + 컬럼의 별칭
select ename, sal, comm, sal*12 + comm as ySal1, nvl(comm, 0), sal*12+nvl(comm, 0)as ySal from emp; 

-- 칼럼과 문자열을 연결하는 결과 출력
-- sql에서 문자열 표현은 (|| ' ' ||)으로 묶는다
select ename || ' is a ' || job as str from emp;

-- distinct : 칼럼 값에서 중복되는 값을 제거하고 하나의 데이터만 출력해준다
select deptno from emp;
select distinct deptno from emp;

