-- 2019.07.05

-- ## 서브쿼리 --> Join보다 훨씬 간편하게 사용할 수 있지만, 성능 주의!!
-- SCOTT 사원이 소속된(sub Q) 부서 이름을 출력 (main Q)

-- # 단일행
-- main Q 틀 만들기 : 
select *
from dept
where deptno = 0
;

-- sub Q 먼저 따로 만들기 :
select deptno
from emp
where ename = 'SCOTT'
;

-- 합체!! :
select *
from dept
where deptno = (
                select deptno
                from emp
                where ename = 'SCOTT'
                );

-- # 다중행
-- 사원들 중 평균 급여보다(sub Q) 많은 급여를 받는 사원의 이름과 급여를 출력(main Q)

select *
from emp
where sal > 0
;

select avg(sal)
from emp
;

select *
from emp
where sal > (
            select avg(sal)
            from emp
            );

-- # IN
-- 급여가 3000 이상인 사원의 소속 부서번호 (sub Q) => 결과값 여러개일 수도 있음 => in 사용하기
-- 해당 부서에 근무하는 사원의 리스트 출력 (main Q)
select ename
from emp
where deptno in (0,0)
;

select distinct deptno
from emp
where sal >= 3000
;

select ename, sal, deptno -- 조건에 맞는 사원 정보 리스트 
from emp
where deptno IN (
                select distinct deptno -- 겹치지 않는 부서번호
                from emp
                where sal >= 3000 -- 조건
                );

-- # ALL : sub의 결과값들 모두보다 커야지 참
select *
from emp
where sal > ALL (
                select sal 
                from emp
                where deptno = 30
                );

-- # ANY : sub의 결과값 중 최소값보다 큰게 하나라도 있으면 참
select ename, sal
from emp
where sal > ANY (
                select sal
                from emp
                where deptno = 30
                );

-- # Inline View (FROM부속질의) : from 절 뒤에 sub Q가 위치
select *
from (
    select empno, ename, job, hiredate
    from emp -- select한 결과 테이블 => 새로운 테이블로 출력됨!
    );
    
select ename, ename, sal -- sal이 들어가면 '부적합한 식별자' 오류!!!
from (
    select empno, ename, job, hiredate
    from emp
    );

-- # 스칼라 부속질의 (SELECT부속질의) : select절 뒤에 sub Q가 위치
select ename, (
        select dname
        from dept
        where deptno = 10
)
from emp
;


