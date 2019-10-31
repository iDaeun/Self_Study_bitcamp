-- [미라콤 IT연계과정] DB수업
/*
    테이블 생성하기
     
    create table 테이블명{
        컬럼명 자료형 option,
        컬럼명 자료형 option,
        컬럼명 자료형 option,
        컬럼명 자료형 option
    };
     
    CHAR(n) : 고정길이 문자형 데이터 타입
    VARCHAR2(n) : 가변길이 문자형 데이터 타입
     
        char(10)
            실제사용 2byte ->10byte (실제 데이터 차지 공간)
        varchar2(10)
            실제사용 2byte -> 2byte (실제 데이터 차지 공간)
     
    NUMBER(p,s) : 숫자 데이터 타입
                p : 전체자리 유효 숫자
                s : 소수점 자리의 유효 숫자         
                 -  NUMBER(4,2)
     
    DATE : 고정길이 날짜
    TIMESTAMP : 밀리초(ms)까지 표현한 데이터 타입
     
    CLOB : 대용량 텍스트 데이터 타입
    BLOB : 대용량 바이너리 데이터를 저장하기 위한 데이터 타입
     
*/
create table car(
    color varchar2(10),
    mileage number(5),
    speed number(3)
);
--테이블 구조 확인
desc car;
 
create table student(
    stuid number(2),
    stuname varchar2(20),
    major varchar2(20),
    score number(3,2),
    phone varchar2(20)
);
 
desc student;
 
create table deposit(
    cid number(3),
    cname varchar2(25),
    caddress varchar2(30),
    phone varchar2(20)
);
/*
    필드 추가
        alter table 테이블명 add(컬럼명 자료형 );
    필드 수정
        alter table 테이블명 modify(컬럼명 자료형 );
    필드 삭제
        alter table 테이블명 drop(컬럼명);
*/
/*
- 테이블에 amount number(10) 필드를 추가
- deposit 의 cname 의 길이를  varchar(35)로 변경
- 휴대전화 정보 cellphone 필드 추가
- cellphone 필드 정보 변경 varchar(10) 으로
- cellphone 필드 삭제
*/
 
alter table deposit add ( amount number(10));
alter table deposit modify (cname varchar2(35));
alter table deposit add ( cellphone varchar2(20));
desc deposit;
alter table deposit modify (cellphone varchar2(10));
alter table deposit drop (cellphone);
 
create table emp(
    empno number(4),
    ename varchar2(10),
    job varchar2(10),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);
 
desc emp;
 
/*
    insert문
        - 테이블안에 데이터(레코드)를 삽입하기
        - 지정한 컬럼에 데이터 삽입
        insert into 테이블명 (컬럼1,컬럼2...) values (값1, 값2...);
        - 모든 컬럼에 데이터 삽입
        insert into 테이블명 values (값1, 값2...);
*/
    insert into emp (empno, ename) values (1, 'hong');
     
    select * from emp;
    --테이블의 레코드 삭제
    delete from emp;
 
--테이블에 레코드 삽입
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,TO_DATE('17-12-1980','DD-MM-YYYY'),800,NULL,20);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,TO_DATE('20-02-1981','DD-MM-YYYY'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,TO_DATE('22-02-1981','DD-MM-YYYY'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,TO_DATE('02-04-1981','DD-MM-YYYY'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,TO_DATE('28-09-1981','DD-MM-YYYY'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,TO_DATE('01-05-1981','DD-MM-YYYY'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,TO_DATE('09-06-1981','DD-MM-YYYY'),2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,TO_DATE('09-12-1982','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,TO_DATE('17-11-1981','DD-MM-YYYY'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,TO_DATE('08-09-1981','DD-MM-YYYY'),1500,NULL,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,TO_DATE('12-01-1983','DD-MM-YYYY'),1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,TO_DATE('03-12-1981','DD-MM-YYYY'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,TO_DATE('03-12-1981','DD-MM-YYYY'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,TO_DATE('23-01-1982','DD-MM-YYYY'),1300,NULL,10);
/*
    select문
        - 데이터를 조회
     
    - 테이블 안의 모든 레코드를 조회하기
        select * from 테이블명;
    - 테이블 안의 모든 레코드를 조회하기 (특정 컬럼만)
        select (컬럼명1,컬럼명2) from 테이블명;
*/
select * from emp;
select ename from emp;
select empno,ename from emp;
 
/*
    where 절을 이용한 select문
    select * from 테이블명 where {조건};
     
*/
-- 직원중 sal을 1500초과하는 사람들의 정보
select * from emp where sal > 1500;
--부서번호가 20인 직원
select * from emp where deptno = 20;
--이름이 SMITH인 직원
select * from emp where ename = 'SMITH';
-- 81년 1월 1일 이전 입사자
select * from emp where hiredate < '81/01/01';
--부서번호가 10이면서 직업이 매니져인 직원
select * from emp where deptno = 10 AND job ='MANAGER';
--부서번호가 10이거나 직업이 매니져인 직원
select * from emp where deptno = 10 OR job ='MANAGER';
 
--부서번호가 10번이 아닌 직원
select * from emp where not deptno = 10;
select * from emp where deptno != 10;
 
--급여가 1000보다 크고 1500보다 작은 직원들
select * from emp where sal > 1000 and sal < 1500;
--급여가 1000보다 작거나 1500이상 받는 직원들
select * from emp where sal < 1000 or sal > 1500;
 
-- 성과급이 300 또는 500 또는 1400받은 직원
select * from emp where comm = 300 or comm=500 or comm =1400;
/*
    between연산자
    특정 컬럼의 데이터 값이 하한값, 상한값 사이에 포함되는 레코드를 조회할 때
*/
--급여가 1200~1500인 사람들
select * from emp where sal between 1200 and 1500;
--급여가 1200~1500이 아닌 사람들
select * from emp where not sal  between 1200 and 1500;
 
--82년도 입사자 출력
select * from emp where hiredate between '1982-01-01' and '1982-12-31';
 
/*
    in연산자
    특정 컬럼의 데이터 값이 값1,값2,값3....중에 하나라도 일치하면 참
*/
select * from emp;
select * from emp where comm in (300,500,1400);
select * from emp where not comm in (300,500,1400);
 
--null인지 아닌지 비교하는 연산
select * from emp where comm is null;
select * from emp where comm is not null;
 
--문자열 비교연산
select * from emp where ename like 'WARD';
 
--이름이 S로 시작하는 직원
--% : 0글자 이상의 문자들
select * from emp where ename like 'S%';
 
--직원의 이름중 두번째 문자가 A인 직원
select * from emp where ename like '_A%';
-- _ : 하나의 글자
 
--이름중 A를 포함하는 직원
select * from emp where ename like '%A%';
select * from emp where ename not like '%A%';
 
--산술연산
select ename, sal, sal * 12 from emp;
select ename, sal, sal * 12 + comm from emp;
 
-- comm이 null값이면 0으로 null값이 아니면 그대로 유지해야함
-- nvl : null을 포함하는 컬럼을 특정한 값으로 전환하는 함수
-- nvl(A,B) : A값이 null이면 B, 아니면 A
 
select ename, sal, nvl(comm,0) from emp;
 
select ename, sal, sal * 12 + nvl(comm,0) from emp;
 
select ename as 이름, sal, sal * 12 + nvl(comm,0) as "1년치 급여" from emp;
 
-- 정렬
-- 급여를 기준으로 정렬
select * from emp order by sal;
select * from emp order by ename;
select * from emp order by sal desc; --내림차순
 
 
 
--함수
 
--문자 함수
--대소문자 변환 함수
    -- lower : 소문자로
    -- upper : 대문자로
select ename,lower(ename),upper(ename) from emp;
 
--현재 날짜 구하기 : sysdate
select sysdate from dual; --dual : 데이터를 표현하기 위한 임시테이블
 
--문자열의 길이
select length('안녕하세요'),length('hello') from dual;
--문자열을 합쳐주는 함수 
select concat('안녕','하세요') from dual;
--문자열을 추출하는 함수
select substr('abcdefghij',4,3) from dual;
select substr('abcdefghij',-4,3) from dual;
select substr('abcdefghij',3),substr('abcdefghij',-3) from dual;
 
/*
이름이 N으로 끝나는 사람
substr함수를 이용해서
*/
 
select * from emp where substr(ename,-1) = 'N';
 
/*
    그룹함수
     
        테이블의 전체데이터(혹은 특정조건에 만족하는 데이터 집합)에서 통계적인 결과를 구하는 함수
        하나이상의 행을 그룹으로 묶어서 연산하며 하나의 결과를 구함
*/
 
select sal from emp;
select sum(sal) as "급여 총합",
        avg(sal) as "평균" ,
        max(sal) as "최고 급여",
        min(sal) as "최소 급여" from emp;
 
--count() : 행(레코드)의 갯수 세는 함수
--count(*) : 전체 행의 갯수
 
select count(*) from emp;
select count(comm) from emp; -- null값을 포함하지 않아서 결과 3나옴
 
select Distinct job from emp; --distinct : 중복 제거
 
/*
    서브 쿼리
     
    다른 질의문에 중첩되어 사용된 검색문
    하나의 select문장의 절 안에 포함된 또하나의 select 문장
     
    가장 급여가 많은 직원의 이름
     
*/
--최고급여
select max(sal) from emp; --결과 : 5000
--5000받는 직원의 이름
select ename from emp where sal = 5000;
 
--서브 쿼리 적용
-- 서브 쿼리는 비교 연산자 오른쪽에 기술해야 하고 괄호로 감싸야함
 
select ename from emp where sal = (select max(sal) from emp);
 
--SCOTT과 같은 부서에 근무하는 사원의 이름과 부서번호 출력
 
select deptno from emp where ename ='SCOTT'; --20
select ename,deptno from emp where deptno = 20;
 
--서브쿼리 적용
select ename,deptno from emp where deptno = (select deptno from emp where ename ='SCOTT');
 
--SCOTT과 동일한 직급을 가진 사원을 출력
 
select * from emp where job = (select job from emp where ename ='SCOTT' );
 
-- SCOTT과 급여가 동일하거나 더 많이 받는 직원의 이름과 급여
select ename, sal from emp where sal >= (select sal from emp where ename = 'SCOTT');
/*
    데이터 그룹 사용하기
    group by : 특정 컬럼을 기준으로 그룹을 나눔
*/
 
--부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;
 
-- 부서별 사원수, 커미션을 받은 사원수
 
--select ename, deptno from emp;
 
select deptno,count(*), count(comm) from emp group by deptno;
 
/*
    having : 그룹결과를 필터링
    부서 내 총 급여가 2500초과하는 부서를 필터링하고싶다면??
*/
--부서별 총 급여
select deptno, sum(sal) from emp group by deptno;
select deptno, sum(sal) from emp where sal >2500 group by deptno;
select deptno, ename,sal from emp where sal> 2500;
/*
    레코드를 그룹화 하기전에 조건에 따라 걸러짐
    급여가 2500초과인 직원의 레코드만 골라서 부서별로 그룹핑한후 총급여계산
*/
 
select deptno, sum(sal) from emp group by deptno having sum(sal) > 10000;
 
-- 부서별 평균급여가 2000이상인 부서의 번호와 평균급여 출력
 
select deptno, avg(sal) from emp group by deptno having avg(sal) >= 2000;
 
/*
    직업이 매니져가 아닌 직원들에 대해서
    직업별로 나눠서 총 급여가 5000 이상인 직업, 직업별 사원수, 직업별 급여 총합 구하기
*/
 
select job,count(*),sum(sal) 
from emp where job not like '%MANAGER%'
group by job
having sum(sal) > = 5000;

--절대값
select 100 , abs(100), abs(-100) from dual;
--나머지
select 123, 10, mod(123,10) from dual;
--반올림
--round(수, 반올림 자릿수)
select round(15.931,1) from dual;
 
--문자열 연결 : ||
select 'abc'||'efg' from dual;
 
--문자열 치환
select replace('JACK and JUE','J','BL') from dual;
 
--trim : 잘라내기
--LTRIM : 왼쪽
select LTRIM('123test123','123') from dual;
--RTRIM : 오른쪽
select RTRIM('123test123','123') from dual;
--trunc : 잘라내기
select trunc(156.79,1) from dual;
select trunc(156.79,-1) from dual;
 
create table customer(
    name varchar2(20),
    ssn varchar2(20),
    car_yn char(1)
);
 
desc customer;
 
insert into customer values ('홍길동','910111-1234567','Y');
insert into customer values ('홍길자','810111-2234567','N');
 
select * from customer;
select substr(ssn,8,1) from customer;
select decode(substr(ssn,8,1),'1','남자','2','여자') from customer;
/*
decode : 값을 비교하여 해당하는 값을 돌려주는 함수
단, 비교시에는 정확히 같은 값만 비교 가능
 
*/
 
/*
    조인
    JOIN
        두개 이상의 릴레이션(테이블)들의 공통적인 특성을 중심으로 합쳐
        하나의 릴레이션(테이블)로 표현
        두개 이상의 릴레이션으로 부터 정보를 조합하기 위해 사용하는 가장 일반적인 방법
    join의 필요성
        특정 부서에 대한 부서이름, 부서위치등의 정보는 dept테이블에 있음
        특정 사원에 대한 부서이름, 부서위치등의 정보를 알고 싶다면 dept테이블에서 정보를 알아와야함
*/
 
create table dept(
    deptno NUMBER(2),
    dname varchar2(20),
    dloc varchar2(20)
);
 
desc dept;
--레코드 삽입
insert into dept values (10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
 
select * from dept;
 
--cross join
--특별한 키워드 없이 (,)로 연결
 
select * from emp,dept;
 
select * from emp e,dept d; --테이블에 별칭 지어주기
 
/*
    동등 조인
    가장 많이 사용하는 조인방법
    조인 대상이되는 두 테이블에서 공통적으로 존재하는 칼럼의 값이
    일치되는 행을 연결하여 결과를 생성하는 조인 방법
*/
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno; 
 
--SCOTT의 이름과 부서명을 출력하세요.
select ename,dname from emp e, dept d 
where e.deptno = d.deptno and ename = 'SCOTT'; 
 
--뉴욕에서 근무하는 사원의 이름과 급여 출력
select ename,sal from emp e, dept d 
where e.deptno = d.deptno and dloc ='NEW YORK';
 
 
--ACCOUNTING 부서 소속 사원의 이름과 입사일
select ename,hiredate from emp e, dept d
where e.deptno = d.deptno and dname = 'ACCOUNTING'; 
 
--사원테이블과 부서테이블을 조인해서 사원의 이름과 부서번호와 부서명을 출력
 
select ename,e.deptno,dname from emp e, dept d
where e.deptno = d.deptno;
 
/*
    비동등 조인
        조인 조건이 특정 범위 내에 있는지 조사하기 위해 where절에 조건을 = 연산자 이외의
        비교 연산자를 사용하는 조인
*/
create table salgrade(
    grade number(2),
    losal number(5),
    hisal number(5)
);
 
INSERT INTO salgrade VALUES(1,700,1200);
INSERT INTO salgrade VALUES(2,1201,1400);
INSERT INTO salgrade VALUES(3,1401,2000);
INSERT INTO salgrade VALUES(4,2001,3000);
INSERT INTO salgrade VALUES(5,3001,9000);
 
select * from salgrade;
select ename, sal from emp;
 
-- 각 직원의 급여등급 지정
select ename, sal, grade from emp, salgrade
where sal between losal and hisal;
/*
    self join
    자기 자신과 자기 자신을 합치는 조인
*/
-- SMITH의 매니져 이름은??
select mgr from emp where ename ='SMITH';  --스미스 매니져의 사원번호 : 7902
select ename from emp where empno = 7902;  --사번이 7902인 직원 : FORD
 
select * from emp;
 
-- SMITH의 매니져 이름은??
select e1.ename,e2.ename from emp e1, emp e2
where e1.mgr = e2.empno and e1.ename = 'SMITH';
 
--매니져가 KING인 사원들의 이름과 직무를 출력하세요.
select e1.ename, e1.job from emp e1, emp e2
where e1.mgr = e2.empno and e2.ename = 'KING';
 
--SCOTT과 동일한 근무지에서 근무하는 사원의 이름
select e1.ename,e2.ename from emp e1, emp e2
where e1.deptno = e2.deptno and e1.ename = 'SCOTT' and e2.ename !='SCOTT';

-- 서브쿼리
 
-- DALLAS에서 근무하는 사원의 이름, 부서번호 출력
select e1.ename, e1.deptno from emp e1, dept e2
where e1.deptno = e2.deptno and e2.dloc = 'DALLAS';

select deptno from dept where dloc ='DALLAS'; -- 20번
select ename, deptno from emp where deptno = 20;  --20번 부서 사람들
 
select ename, deptno from emp 
where deptno = (select deptno from dept where dloc ='DALLAS' );  
 
-- SALES 부서에 근무하는 모든 사원의 이름과 급여
 
select ename, sal from emp where deptno = 
(select deptno from dept where dname = 'SALES' );
 
-- 직속 상관이 KING인 사원의 이름과 급여
 
select ename,sal from emp 
where mgr = (select empno from emp where ename = 'KING');
  
/*
    레코드 갱신
    update문 : 기존 레코드의 값을 변경시켜주는 문장
    update 테이블명 set 컬럼명=값, 컬럼명2=값2;
*/

create table stuTable(
    idx number primary key,
    name varchar2(10) not null,
    phoneNum number(16) not null
);

select 'abc' || 'efg' from dual;
select ename || ' is a ' || job from emp;
select trim (leading '0' from '000hello000') from dual;
select trim (trailing '0' from '000hello000') from dual;
select trim (both '0' from '000hello000') from dual;
select instr('welcome to my home', 'o', 9, 1 ) from dual; -- 9번째부터 찾겠음, 그중 처음 만난 문자
select sysdate from dual;
select current_date from dual;
select current_timestamp from dual;
select ename, hiredate, hiredate+3 from emp;

-- 현재까지 며칠 일했는지 계산, 몇주 며칠인지 계산
select ename, hiredate, sysdate
, trunc(sysdate-hiredate)
, trunc((sysdate-hiredate)/7) weeks
, round(mod((sysdate-hiredate),7),0) days 
from emp;

select current_timestamp, extract(year from current_timestamp) from dual;
select sysdate,
extract(day from sysdate), extract(month from sysdate), extract(year from sysdate) from dual;

select ename, extract(day from hiredate) as day, extract(year from hiredate) as year, extract(month from hiredate) as month
from emp where deptno = 20;

select ename, sal, to_char(sal, '999,999') from emp; -- to_char : 숫자를 문자로 변환
select to_char(sysdate, 'MM') from dual;
select to_char(sysdate, 'MI') from dual;
select to_date('2019-10-29', 'YYYY-MM-DD') from dual; -- to_date : 문자를 날짜로 변환
select to_date('110815 143000','YYMMDD HH24MISS')from dual;
select to_char(to_date('990815','YYMMDD'),'YYYY.MM.DD') from dual;

select '0001', cast ('0001' as number) from dual; -- 문자 => 숫자
select cast ('2019-10-29' as date) from dual; -- 문자 => 날짜

select coalesce(null,1),
coalesce(null, 'test', null, 'test2') from dual;
-- 여러개의 인자 중 첫번째로 null이 아닌 값 리턴

select ename, sal, comm, greatest(sal,comm) from emp where comm is not null;

select ename, sal, 
    case when sal>2000 then '상' else '하' end
from emp;

create table score(
    student_no varchar2(20) primary key,
    name varchar2(20) not null,
    kor number(3) default 0,
    eng number(3) default 0,
    mat number(3) default 0
);

desc score;

insert into score values ('1','kim',90,80,70);
insert into score values ('2','park',88,85,75);
insert into score values ('3','hong',99,89,79);
insert into score values ('4','choi',100,100,100);

select * from score;

select name,kor,eng,mat, (kor+eng+mat) 총점, round((kor+eng+mat)/3,2) 평균,
    case 
    when (kor+eng+mat)/3 >= 90 then 'A'
    when (kor+eng+mat)/3 >= 80 then 'B'
    when (kor+eng+mat)/3 >= 70 then 'C'
    when (kor+eng+mat)/3 >= 60 then 'D'
    else 'F'
end 등급
from score;

select empno, ename, sal, job,
case job 
    when 'ANALYST' then sal *1.1
    when 'CLERK' then sal *1.2
    else sal
end salary
from emp;

select deptno, ename, sal,
rank() over(order by sal desc) 급여순위
from emp;

select deptno, ename, sal,
dense_rank() over(order by sal desc) 급여순위 -- dense_rank() 동률 무시함
from emp;

select deptno, ename, sal,
rank() over(
    PARTITION by deptno -- partition by 컬럼 : 순위를 컬럼을 기준으로 한 그룹을 대상으로 매김
    order by sal desc
) from emp;

