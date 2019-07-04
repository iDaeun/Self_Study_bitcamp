-- 2019.07.04

-- < 그룹함수 >

-- # SUM(칼럼) : 그룹과 합을 반환
-- 사원 테이블에서 사원의 월 급여의 총합 구하기
select sum(sal) as "월 총급여"
from emp
;
-- 10번 부서의 월 총급여
select TO_CHAR(sum(sal),'L999,999')
from emp
where deptno = 10 -- 순서: from과 where구절로 행을 구한 다음, select로 칼럼을 골라 최종적인 결과를 냄
;
-- sum함수에서 null값 처리 방식 : null값을 무시한다
select sum(comm)
from emp
; -- null값 제외하고 계산함

-- # AVG(칼럼) : 그룹에 포함된 값들의 평균값을 반환
-- 그룹함수의 결과는 단일행의 하나의 칼럼
select trunc( avg(sal) ) as "전체 사원의 평균 월급여" -- 절사한 값
from emp
;

select trunc( avg(sal) )
from emp
where job = 'MANAGER'
;

-- avg함수도 칼럼의 값이 null일때 제외하고 처리
select avg(comm)
from emp
;

-- # MAX(칼럼) : 최대값 반환
-- # MIN(칼럼) : 최소값 반환
-- null 값은 무시
select ename, max(sal) as "최대급여" , min(sal) as "최소급여"
from emp
;

-- # COUNT(칼럼) : row의 개수를 반환
-- 회사에 소속된 사원의 수
select count(*) as "전체 사원의 수" 
from emp
;
-- 10번 부서에 소속된 직원의 수
select count(*)
from emp
where deptno = 10
;
-- 커미션 받는 사원의 수
select count(comm)
from emp
;
-- 부서의 수
select count(*)
from dept
;
-- 리스트 뽑기
select deptno -- 사원들이 소속된 부서의 수
from emp
;
select distinct deptno -- 중복된 부서 출력안함
from emp
;
-- 로우 개수 뽑기
select count(deptno) -- 사원들이 소속된 부서의 수
from emp
;
select count(distinct deptno) -- 중복된 부서 출력안함
from emp
;

-- # GROUP BY 칼럼이름 : row를 그룹핑해서 처리, 집합함수(SUM, AVG, COUNT..)사용 가능
-- 칼럼이름 => 그룹핑의 기준
-- deptno로 그룹핑하고, 그에 해당되는 sam(sal) & avg(sal)
-- count(*) = 그룹의 행 개수, count(comm) = 그룹별 comm행 개수
select deptno, sum(sal), round (avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
;
-- 직무별 지표를 출력
select job, 
    count(*) as "직원의 수",
    TO_CHAR(sum(sal), 'L999,999') as "급여의 총합",
    round(avg(sal)) as "급여의 평균",
    max(sal), min(sal)
from emp
group by job
;
