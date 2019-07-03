-- 2019.07.03

-- LIKE : 문자패턴검색 연산자 키워드
-- 컬러명 LIKE패턴
-- 패턴 : % _

-- % 패턴을 이용
-- 사원테이블에서 'S'로 시작하는 사원의 이름을 검색

select *
from emp
where ename LIKE 'S%'
;
-- 사원테이블에서 'S'로 끝나는 사원의 이름을 검색
select *
from emp
where ename LIKE '%S'
;
-- 사원테이블에서 'S'를 포함하는 사원의 이름을 검색
select *
from emp
where ename LIKE '%S%'
;

-- _연산자는 문자의 자리(위치)고정을 의미 : 해당 자리에는 어떠한 값이 와도 상관없음
-- _A : 앞자리 문자는 어떠한 문자여도 무관, 두번째 문자는 반드시 A여야함
-- _A_ : 사원의 이름 중에 두번째 문자에 A를 포함
select *
from emp
where ename LIKE '_A%' -- 더 디테일하게 검색 가능!!
;

-- 이름 중 A를 포함하지 않는 사원들을 검색
select *
from emp
where ename not like '%A%'
;

-- 칼럼의 데이터 값이 null값 여부 확인
-- is null(null일때 true), is not null(null이 아닐때 true)

-- 커미션 받지 않는 사원
select *
from emp
where comm is null;

select *
from emp
where comm is not null;

select *
from emp
where not (comm is null or comm = 0);
-- 위 아래 같은 내용
select *
from emp
where comm is not null and comm > 0;

-- 오름차순, 내림차순 : 결과 테이블의 로우(행)정렬 (디폴트값 = asc, 생략가능)
-- order by 칼럼명 [asc]/desc, 칼럼명 [asc]/desc => 앞부분이 같을 경우 뒷부분을 실행
select *
from emp
order by sal desc;

select *
from emp 
order by sal;

select *
from emp
order by hiredate desc; -- 최근 입사일 순

select *
from emp
where not (comm is null or comm = 0)
order by sal desc
;

select *
from emp
order by sal desc, ename asc; -- 급여가 같을 경우 ename이 빠른 사람 먼저 표시

---------------------------------------------------------------------------------
-- 주요함수

-- TO_CHAR
-- DATE => STR : TO_CHAR(날짜타입, '패턴')
select sysdate as 날짜, TO_CHAR(sysdate, 'YYYY-MM-DD') as 변환날짜
from dual;

select hiredate, TO_CHAR(hiredate, 'YYYY.MM.DD. DAY') as "date"
from emp;

select hiredate, TO_CHAR(hiredate, 'YYYY.MM.DD. DY') as "date"
from emp;

select hiredate, TO_CHAR(hiredate, 'YYYY.MM.DD. HH24:MI:SS AM') as "date"
from emp;

-- NUMBER => STR : TO_CHAR(숫자타입, '패턴')
select TO_CHAR(10000,'L000,000.00')
from dual
;

select TO_CHAR(10000,'L999,999')
from dual
;

select sal, TO_CHAR(sal, 'L999,999')
from emp
;

select sal, TO_CHAR(sal, 'L999,999') as "월급여", TO_CHAR(sal*12+nvl(comm,0), 'L999,999') as "연봉"
from emp
;

-- STR => DATE : TO_DATE(원본, 'YYYYMMDD')
select ename, hiredate, TO_DATE(19810220, 'YYYYMMDD')
from emp
where hiredate = TO_DATE(19810220, 'YYYYMMDD')
;

select ename, hiredate, TO_DATE(19810220, 'YYYYMMDD')
from emp
where hiredate = TO_DATE('1981-02-20', 'YYYY-MM-DD') -- String값으로 날짜 데이터 받고, 처리할때 함수 이용하여 맞춰줌 
;

select ename, hiredate, TO_DATE(19810220, 'YYYYMMDD')
from emp
where hiredate = TO_DATE('1981.02.20', 'YYYY.MM.DD')
;

select sysdate, TO_DATE('1994/11/25', 'YYYY/MM/DD'), sysdate - TO_DATE('1994/11/25', 'YYYY/MM/DD') as "며칠이 지났는지",
    trunc(sysdate - TO_DATE('1994/11/25', 'YYYY/MM/DD'))
from dual
;

-- DECODE 함수 : switch case 형식과 유사함
select ename, deptno,
    DECODE(deptno,
                10 , 'ACCOUNTING',
                20 , 'RESEARCH',
                30 , 'SALES',
                40 , 'OPERATION'
    ) as "decode결과값" -- 부서 번호에 따라 나누기
from emp
;

select ename, job, sal,
    DECODE(job,
            'ANALYST', sal*1.05,
            'SALESMAN', sal*1.10,
            'MANAGER', sal*1.15,
            'CLERK', sal*1.20
    ) as "UPSAL" -- decode함수가 적용되지 않는 부분은 => null값으로 나옴
from emp
;

-- CASE 함수 : if else문과 유사함
select ename, deptno,
    CASE 
         when deptno = 10 then 'ACCOUNTING'
         when deptno = 20 then 'RESEARCH'
         when deptno = 30 then 'SALES'
         when deptno = 40 then 'OPERATIONS'
    END 
    as DNAME
from emp
;
