--EMP 테이블과 DEPT 테이블을 이용해서 풀이해 주세요.
desc emp;

desc dept;

-- 전체 출력
select *
from emp;

select *
from dept;

--1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename as "사원의 이름", sal as "급여", sal+300 as "인상된급여" 
from emp
;

--2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename, sal, sal*12+100 as "연간총수입 + 상여금"
from emp
order by sal desc
;

--3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ename, sal
from emp
where sal > 2000
order by sal desc
;

--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename, deptno
from emp
where empno = 7788
;

--5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ename, sal
from emp
where sal not between 2000 and 3000;

--6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ename, job, hiredate
from emp
where hiredate between '81/02/20' and '81/05/01';

--7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ename, deptno
from emp
where deptno = 20 or deptno = 30
order by ename desc;

select ename, deptno
from emp
where deptno in(20,30)
order by ename desc;

--8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
select ename, sal, deptno
from emp
where (sal between 2000 and 3000) and (deptno = 20 or deptno = 30)
order by ename;

select ename, sal, deptno
from emp
where (sal between 2000 and 3000) and deptno in(20,30)
order by ename;

--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
select ename, hiredate
from emp
where hiredate like '81/%';

--10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ename, job
from emp
where not (job = 'MANAGER');

--11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select ename, sal, comm
from emp
where not (comm is null)
order by sal desc, comm desc;

--12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename
from emp
where ename like '__R%';

--13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename
from emp
where ename like '%A%E%' or ename like '%E%A%';

--14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ename, job, sal
from emp
where (job = 'CLERK' or job = 'SALESMAN') and not (sal = 1600 or sal = 950 or sal = 1300)
;

select ename, job, sal
from emp
where (job = 'CLERK' or job = 'SALESMAN') and not (sal in(1600, 950, 1300))
;

--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ename, sal, comm
from emp
where (comm is not null) and comm >= 500
;

-------------------------------------------------------------------------

--16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
-- substr(문자열, 자리위치, 문자의 개수)
select 
SUBSTR(hiredate, 1,2) as "입사년도",
SUBSTR(hiredate, 4,2) as "입사한 달"
from emp
;

--17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select ename as "4월 입사자"
from empXML DB 저장소

where SUBSTR(hiredate, 4,2) = '04'
;

--18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select ename as "사원번호가 짝수인 사람"
from emp
where MOD(empno,2) = 0
;

--19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select TO_CHAR (hiredate, 'YY MON DY') as "입사일"
from emp
;

--20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select trunc(sysdate - TO_DATE('2019/01/01', 'YYYY/MM/DD')) as "올해 지난 일 수"
from dual
;

--21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select nvl(mgr, 0) as "상관 사번"
from emp
;

--22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 
--직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select job as "직급", sal as "원래 급여",
    DECODE( job,
        'ANALYST', sal + 200,
        'SALESMAN', sal + 180,
        'MANAGER', sal + 150,
        'CLERK', sal + 100    
    ) as "인상된 급여"
from emp
;
--------------------------------------------------------------------------------------------------------
--23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select max(sal) as "급여 최고액", min(sal) as "급여 최저액", sum(sal) as "총액", round(avg(sal)) as "평균급여"
from emp
;

--24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select job,
max(sal) as "급여 최고액", min(sal) as "급여 최저액", sum(sal) as "총액", round(avg(sal)) as "평균급여"
from emp
group by job
;

--25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select job,
    count(*)
from emp
group by job;

--26. 관리자 수를 나열하시오.
select count(job)
from emp
where job = 'MANAGER';

--27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal) - min(sal)
from emp
;

--28. 직급별 사원의 최저 급여를 출력하시오. 
--관리자를 알 수 없는 사원이 있는 그룹을 제외하고, 최저 급여가 2000 미만인 그룹도 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job,
    min(sal)
from emp
where not(mgr is null) -- where mgr is not null
group by job
having min(sal) >= 2000
order by min(sal) desc
;

--29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno,
    count(*) as "사원 수", round(avg(sal),2)  as "평균급여"
from emp
group by deptno
;

--30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 
--평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno as "부서번호",
    DECODE(deptno,
            10 , 'ACCOUNTING',
            20 , 'RESEARCH',
            30 , 'SALES',
            40 , 'OPERATION'
    ) as "부서명" ,
    count(*) as "사원 수",
    DECODE(deptno,
            10 , 'NEW YORK',
            20 , 'DALLAS',
            30 , 'CHICAGO',
            40 , 'BOSTON'
    ) as "지역명",
    round(avg(sal)) as "평균 급여"
from emp
group by deptno
;

select e.deptno, d.dname, d.loc, count(*), round(avg(sal)) -- join 사용하기
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname, d.loc
;



--31. 업무를 표시한 다음 
--    해당 업무에 대해 
--    부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 
--    별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. ( hint. Decode, group by )

select job, deptno as "DNO",
    decode (deptno, 10, sal) as "부서10",
    decode (deptno, 20, sal) as "부서20",
    decode (deptno, 30, sal) as "부서30",
    sal as "총액"
from emp -- 개개인만 출력됨
;

select job, deptno as "DNO",
    decode (deptno, 10, sum(sal)) as "부서10",
    decode (deptno, 20, sum(sal)) as "부서20",
    decode (deptno, 30, sum(sal)) as "부서30",
    sum(sal) as "총액"
from emp
group by job, deptno -- 중복되는 job, 부서번호 묶어줌
;

select job, deptno,

    decode(deptno, 10, sum(sal)) as "부서 10",
    decode(deptno, 20, sum(sal)) as "부서 20",
    decode(deptno, 30, sum(sal)) as "부서 30",
    sum(sal) as "총액"

from emp
group by job, deptno
;
-------------------------------------------------------------------------
--32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
select ename, emp.deptno, dname
from emp, dept
where emp.deptno = dept.deptno
    and ename = 'SCOTT'
;

--33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
select emp.ename, dept.dname, dept.loc
from emp inner join dept
on emp.deptno = dept.deptno
;

--36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select emp.ename, dept.dname
from emp, dept
where emp.deptno = dept.deptno 
    and ename like '%A%'
;

--37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select emp.ename, emp.job, emp.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno
    and dept.loc = 'NEW YORK'
;

--38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
select e.ename as "사원이름", e.empno as "사원번호", m.ename as "관리자이름"
from emp e, emp m
where e.mgr = m.empno
;

--39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select *
from emp e, emp m
where e.mgr = m.empno(+)
order by e.empno desc
;

--40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
select f.ename, f.empno, s.ename as "동일한 부서에서 근무하는 사원"
from emp f, emp s
where f.deptno = s.deptno
    and f.ename = 'SCOTT'
;

--41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select s.ename, s.hiredate
from emp f, emp s
where f.hiredate < s.hiredate
    and f.ename = 'WARD'
;

--42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select s.ename as "사원", s.hiredate , f.ename as "관리자", f.hiredate
from emp f, emp s
where f.hiredate > s.hiredate
    and f.job = 'MANAGER'
;

----------------------------------------------------------------------------------------------------------------
--43. 사원 번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원 이름과 담당업무)하시오.
select e1.ename, e1.job
from emp e1
where e1.job = (
select e2.job
from emp e2
where e2.empno = 7788
);

--44. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 담당 업무
select e1.ename, e1.job
from emp e1
where e1.sal > (
select e2.sal
from emp e2
where e2.empno = 7499
);

--45. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
select ename, job, sal
from emp
where sal = (
select min(sal)
from emp
);

--46. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.
select job, avg(sal)
from emp
group by job
having avg(sal) = (
select min(avg(sal))
from emp
group by job
);

--47. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, sal, deptno
from emp
group by ename, sal, deptno
having sal in (
select min(sal)
from emp
group by deptno
);

--48. 담당업무가 ANALYST 인 사원보다 급여가 적으면서 업무가 ANALYST가 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오.
select empno, ename, job, sal
from emp
where sal < all (
select sal
from emp
where job = 'ANALYST'
) and not job = 'ANALYST'
;

--49. 부하직원이 없는 사원의 이름을 표시하시오.
select ename
from emp
where not empno = all(
select mgr
from emp
);

--50. 부하직원이 있는 사원의 이름을 표시하시오.
select ename
from emp
where empno = any (
select mgr
from emp
);

--51. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오. ( 단 BLAKE는 제외 )
select ename, hiredate
from emp
where deptno = (
select deptno
from emp
where ename = 'BLAKE'
) and not ename = 'BLAKE';

--52. 급여가 평균 급여보다 많은 사원들의 사원 번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
select empno, ename
from emp
where sal > (
select avg(sal)
from emp
)
order by sal;

--53. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원 번호와 이름을 표시하시오.
select empno, ename
from emp
where deptno in (
select deptno
from emp
where ename like '%K%'
);

--54. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하시오.
select ename, empno, job
from emp
where deptno = (
select deptno
from dept
where loc = 'DALLAS'
);

--55. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select ename, sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);

--56. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.
select empno, ename, job
from emp
where deptno = (
select deptno
from dept
where dname = 'RESEARCH'
);

--57. 평균 월급보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원 번호, 이름, 급여를 표시하시오.
select empno, ename, sal,deptno
from emp
where deptno in (
select deptno
from emp
where ename like '%M%'
) and 
sal > (
select avg(sal)
from emp
);

--58. 평균급여가 가장 적은 업무를 찾으시오.
select job
from emp
group by job
having avg(sal) = (
select min(avg(sal))
from emp
group by job
);

--59. 담당업무가 MANAGER 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select ename
from emp
where deptno in (
select deptno
from emp
where job = 'MANAGER'
);
