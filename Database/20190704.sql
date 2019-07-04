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

-- # HAVING : 그룹의 결과를 제한
-- 부서의 평균 급여가 2000이상인 부서만 출력
select deptno, sum(sal), round (avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
having avg(sal) >= 2000
;

-- 부서의 최대급여가 2900이상인 부서만 출력
select deptno, sum(sal), round (avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
having max(sal) >= 2900
;

-- ## JOIN : 2개 이상의 테이블을 옆으로 붙인다 -> 표현하는 칼럼이 늘어난다.
-- 테이블을 붙이는 것 = CROSS JOIN *경우의 수 형태로 {1,2,3} * {1,2} (1-1),(2-2)와 같이 같은 값 찾아줌
select *
from emp, dept
;

select *
from emp, dept
where emp.deptno = dept.deptno
;

-- 이름이 scott(EMP)인 사원의 이름과 부서이름(DEPT)을 출력
select ename, dname, emp.deptno, dept.deptno
from emp, dept
where emp.deptno = dept.deptno and ename='SCOTT'
;

-- 주문테이블에서 회원의 이름과 주문정보를 출력 -> 박지성고객
-- orders, customer
select o.orderid, c.name
from orders o, customer c
where o.custid = c.custid and c.name = '박지성'
;

select *
from emp E, dept D -- table + 공백 + 별칭
where E.deptno = D.deptno
;

-- customer(5), book(10), orders(10) -> cross join = 500
-- o.custid = c.custid / o.bookid = b.bookid
select *
from orders o, customer c, book b
where o.custid = c.custid and o.bookid=b.bookid
;

-- 박지성 고객이 주문한 책의 이름 출력
select b.bookname, b.publisher
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid
    and c.name = '박지성'
;

-- # Non-Equi Join : where절에 조인조건을 = 연산자 이외의 비교 연산자 사용
select ename, sal, grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal
    and ename = 'SCOTT'
;

-- # Self Join : 자신의 테이블 내에서 조인
select e.ename || '의 매니저는 '|| m.ename ||'입니다.'
from emp e, emp m
where e.mgr = m.empno
order by m.ename
;

-- # Outer Join : null값이 나와 배제된 행을 결과에 포함시키기
select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr = m.empno(+) -- 만족하지 못하는 값에 (+) 추가
;

-- ## ANSI JOIN
select *
from emp cross join dept
;

-- # ANSI Inner Join
select *
from emp inner join dept -- = from emp = dept
on emp.deptno = dept.deptno -- = where emp.deptno = dept.deptno
;

select *
from emp join dept
using(deptno) -- 두 테이블의 칼럼의 이름이 동일할때 using으로 묶어줌
;

-- # ANSI Outter Join = (+)
-- left out join = 오른쪽에 상관없이 모두 출력할 것이다! (표현하고자 하는 테이블기준으로 left, right정함)
select e.ename, m.ename
from emp e left outer join emp m
on e.mgr = m.empno
;

select *
from customer
;
select distinct custid
from orders
;
-- order 테이블 쪽에서 고객 모두 출력
select *
from orders o, customer c
where o.custid(+) = c.custid
;

select *
from orders o right outer join customer c
on o.custid = c.custid
;