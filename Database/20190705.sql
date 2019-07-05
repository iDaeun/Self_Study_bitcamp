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

-- # 다중행
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
        where dept.deptno = emp.deptno
)
from emp
;

---------------------------------------------------------------------
-- ## DDL
-- # CREATE TABLE : 테이블 생성 (데이터 저장 규칙을 정의)
-- 컬럼 이름, 저장 데이터의 타입, 저장 데이터 사이즈, 제약조건
-- 제약조건 : null 유무 확인 / 중복여부 (유니크 속성) / 기본값 설정 / 체크 / 기본키(primary key)제약 / 외래키(foreign key) 제약

-- create table : 컬럼을 직접 설정
create table emp01 ( -- 테이블 이름은 emp01로 만든다
    empno number(4), -- 컬럼 이름이 empno인 저장공간을 만든다 (숫자타입, 4자리)
    ename varchar2(20), -- 컬럼 이름이 ename인 저장공간을 만든다 (가변문자타입, 20자리)
    sal number (7,2) -- 컬럼 이름이 sal인 저장공간을 만든다 (숫자타입, 7자리, 7자리 중 뒤 2자리는 소수표현)
);

-- create table : 서브쿼리를 이용하는 방법
create table emp02
AS
select * from emp
;

desc emp02; -- 제약조건은 가져오지 않는다

create table emp03
AS
select empno, ename, job, hiredate from emp -- sub Q를 이용해서 원하는 컬럼만 복사
;

desc emp03;

create table emp04
as
select * from emp 
where deptno = 20 -- 원하는 행만 복사
;

select * from emp04;

create table emp05
as select * from emp
where 1=2; -- 만족하지 못하는 조건 -> false => 구조만 복사하게됨



select * from emp05;

-- MemberInfo.java로 테이블 만들기
-- 대리키 : idx / 기본키
create table memberInfo ( -- MemberInfo테이블 생성
    id varchar2(12), -- 아이디 : 6~12자리 문자열 / not null, unique
    pw varchar2(16), -- 비밀번호 : 8~16자리 문자열 / not null
    name varchar2(10), -- 이름 : 10자리 문자열 / not null
    photo varchar2(30), -- 사진경로 : 30자리 문자열
    registerdate date -- 가입날짜 : 날짜타입 / default sysdate
);
----------------------------------------------------------
-- 제약조건 추가해주기 : 
create table memberInfo (
    idx number(7),
    id varchar2(12) constraint mm_id_nn not null,
    pw varchar2(16) constraint mm_pw_nn not null,
    name varchar2(10) constraint mm_name_nn not null,
    photo varchar2(30),
    registerdate date default sysdate,
    
    constraint mm_idx_pk primary key (idx),
    constraint mm_id_uq unique (id)
);

desc memberInfo;

drop table memberInfo; -- 테이블 삭제

-- ## ALTER TABLE : 테이블 구조 수정하는 명령
-- 컬럼의 추가, 수정, 삭제

-- # 추가 : ALTER TABLE 테이블명 ADD 컬럼이름
desc emp01;

alter table emp01
add (job VARCHAR2(9));

desc emp01;

-- # 수정 : ALTER TABLE 테이블명 MODIFY (컬럼정의)
alter table emp01 modify (job VARCHAR2(30));

desc emp01;

-- # 삭제 : ALTER TABLE 테이블명 DROP COLUMN 컬럼이름;
alter table emp01 drop COLUMN job;

desc emp01;

-- # TRUNCATE : 테이블 내용 전체 물리적인 삭제 *사용할때 주의
desc emp02;

truncate table emp02;
select * from emp02;

-- # RENAME ~ TO ~ : 테이블명 변경
rename emp02 to test;
desc emp02;
select * from emp02;

-- 제약 조건 적용
create table emp06 (
    empno number(4) not null,
    ename varchar2(20),
    sal number(7,2)
);

desc emp06;

-- INSERT INTO 테이블 이름 (컬럼 리스트 -> 저장하고자 하는 컬럼의 이름을 나열) VALUES (값, 값, 값 ...)
-- 값 -> 컬럼의 순서대로 써서 매칭시켜줘야 함! (컬럼 이름이 3개면 뒤에 값도 3개여야 함, 자료형 타입도 일치)
insert into emp06 (empno, ename) values (null, null); -- -> *오류: empno에 not null제약을 걸었기 때문에 데이터 삽입할 수 XXX

insert into emp06 (empno, ename) values (2011, null); -- -> 입력 가능!
select * from emp06;

drop table emp06;

create table emp06 (
    empno number(4) not null UNIQUE, -- 제약조건 (NOT NULL, UNIQUE 2가지)
    ename varchar2(20) not null,
    sal number(7,2) default 1000 -- 디폴트값 설정 (sal값을 입력하지 않은 경우 -> 1000으로)
);

insert into emp06 (empno, ename) values (2011, 'king'); -- *오류: 무결성 제약조건(unique)에 위배!

-- # CHECK : 제안 조건 설정
create table emp06 (
    empno number(4) not null UNIQUE,
    ename varchar2(20) not null,
    sal number(7,2) default 1000,
    grade number(1) CHECK (grade > 0 and grade <6), -- = grade between 1 and 5
    gender char(1) CHECK (gender = 'M' or gender = 'W') -- = gender in ('M', 'W')
);

desc emp06;
insert into emp06 values(1000, 'king', '' , 5, 'M'); -- 전체 컬럼에 데이터 추가 -> 컬럼이름 리스트 생략 가능!!
insert into emp06 values(1001, 'queen', null , 4, 'W'); 
select * from emp06;

create table emp06 (
    empno number(4) primary key, -- PRIMARY KEY제약조건 (= UNIQUE && NOT NULL)
    ename varchar2(20) not null,
    sal number(7,2) default 1000,
    grade number(1) CHECK (grade > 0 and grade <6), 
    gender char(1) CHECK (gender = 'M' or gender = 'W'),
    deptno number(2) REFERENCES dept(deptno),
--  =  foreign key (deptno) REFERENCES dept(deptno) -- foreign key  + 참조할 컬럼 : 외래키는 반드시 부모 테이블의 pk로만 설정 가능!!!
);

-- ## 테이블 제약조건 설정하기

create table emp07(
    empno number(4) constraint emp07_empno_nn not null,
    ename varchar2(10) constraint emp07_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    
    constraint emp07_empno_pk primary key (empno), -- 밑에서 지정할때는 지정한 컬럼이름 써야함!!!
    constraint emp07_job_uq unique (job),
    constraint emp07_deptno_fk foreign key (deptno) references dept(deptno)
);

desc emp07;


