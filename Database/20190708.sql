-- 2019.07.08

-- 부속질의 2
-- 고객 이름별 구매 총 금액을 출력

--1) select 부속질의
select custid, (select 
name from customer
where orders.custid = customer.custid
), sum(saleprice) as 총액
from orders
group by custid
;
-- 2) JOIN
select o.custid, c.name, sum(saleprice) as 총액
from orders o join customer c 
on o.custid  = c.custid
group by o.custid, c.name
order by o.custid
;

-- 인라인 뷰
select *
from customer
where custid <= 2
;

select *
from (select *
from customer
where custid <= 2) c -- 사용하고자 하는 테이블 대상이 됨
, orders o -- cross join
where c.custid = o.custid
;

-- row num
select rownum empno, ename
from emp
order by ename -- rownum 뒤죽박죽
;

select rownum empno, ename
from (select *
from emp
order by ename) -- rownum -> ename이 정렬됨에 따라 순서대로 기재됨
;

select * from emp;

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 출력
select avg(saleprice)
from orders
;

-- 11800
select orderid, saleprice
from orders
where saleprice <= 11800
;

select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
from orders)
;

-- 각 고객의 평균 주문금액보다 큰 금액의 주문내역 -> 주문번호, 고객번호, 금액
select orderid, custid, saleprice 
from orders od
where saleprice > (select avg(saleprice)
from orders so
where od.custid = so.custid
)
;

-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액
select sum(saleprice) as 총판매액
from orders
where custid in (select custid
from customer
where address like '%대한민국%')
;

-- JOIN
select sum(saleprice) as 총판매액
from orders o join customer c
on o.custid = c.custid
where address like '%대한민국%'
;

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액
-- = 최대값보다 큰 값 찾기
select orderid, saleprice
from orders
where saleprice > all( -- = > max(saleprice)
select saleprice 
from orders
where custid = '3'
)
;

select orderid, saleprice
from orders
where saleprice > ( 
select max(saleprice) 
from orders
where custid = '3'
)
;

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액
select sum(saleprice) as "총 판매액"
from orders od
where exists (
select *
from customer cs
where address like '%대한민국%' and cs.custid = od.custid
)
;

---------------------------------------------------------------------
-- ## DML
-- # 데이터 입력 : INSERT INTO 테이블명 (컬럼 리스트..) VALUES (입력 데이터 리스트..)

-- 테이블 삭제
drop table dept01;

-- 테이블 생성
create table dept01
as
select * from dept where 1=0 -- 구조만 복사
;

desc dept01;

-- 데이터 입력
insert into dept01 
(deptno, dname, loc) 
values 
(10, 'accounting', 'NEWYORK');

desc dept01;

-- 데이터 추가
insert into dept01
values (20, 'research', 'dallas');

-- null값 입력
-- 암묵적/암시적 방법
-- 컬럼을 빼고 입력
insert into dept01
(deptno, dname)
values (30, 'sales'); -- 암시적으로 입력

insert into dept01
values (40, 'operation', null); -- 명시적으로 입력

insert into dept01
values (40, '', ''); -- 명시적으로 입력

insert into dept01
select * from dept
; -- 서브쿼리로 dept의 4개의 행을 삽입

-- 데이터의 수정
-- # UPDATE 테이블 이름 SET 컬럼이름 = 변경데이터, 컬럼이름 = 변경데이터, ...
-- WHERE 변경하고자하는 행을 찾기위한 조건 (중요*)
update emp01
set deptno = 30 -- 모든 deptno -> 30으로 변경
;

drop table emp01;
create table emp01
as
select * from emp
;

desc emp01;
select * from emp01;

update emp01
set sal = sal * 1.1;

update emp01
set hiredate = sysdate;

select * from emp01;

-- # where절 -> 테이블의 특정 행만 변경
-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정합시다.
update emp01
set deptno = 30
where deptno = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상합시다.
update emp01
set sal = sal *1.1
where sal >= 3000;

-- 1987년에 입사한 사원의 입사일이 오늘로 수정합시다.
update emp01
set hiredate = sysdate
where substr(hiredate, 1, 2) = '87';

-- # 2개 이상의 컬럼 값 변경
-- SCOTT 사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정하도록 합시다.
update emp01
set deptno = 20, job = 'MANAGER'
where ename = 'SCOTT';

-- SCOTT 사원의 입사일자는 오늘로, 급여를 50 으로 커미션을 4000 으로 수정합시다.
update emp01
set hiredate = sysdate, sal = 50, comm = 4000
where ename = 'SCOTT';

-- # 서브쿼리 -> 데이터 수정
-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문을 사용해 봅시다.

drop table dept01;
create table dept01
as
select * from dept;

update dept01
set loc = (
select loc
from dept01
where deptno = 40
)
where deptno = 20
;

-- 서브쿼리 -> 한꺼번에 두개의 컬럼 값 변경
update dept01
set (dname, loc) = ( -- dname, loc 값 변경
select dname, loc
from dept
where deptno = 40
)
where deptno = 20
;

-- # 데이터 삭제 : DELETE FROM 테이블 이름 WHERE 조건
-- 조건에 해당하는 행을 삭제
select * from dept01;

-- 전체 행을 삭제
delete from dept01;

drop table dept01;

create table dept01
as
select * from dept
;

-- 특정 행을 삭제
delete from dept01
where deptno = 30;

-------------------------------
desc memberinfo;

-- 이름           널?       유형           
------------ -------- ------------ 
-- IDX          NOT NULL NUMBER(7)    
-- ID           NOT NULL VARCHAR2(12) 
-- PW           NOT NULL VARCHAR2(16) 
-- NAME         NOT NULL VARCHAR2(10) 
-- PHOTO                 VARCHAR2(30) 
-- REGISTERDATE          DATE 

-- 회원가입 INSERT
-- insert into memberinfo(IDX, ID, PW, NAME, PHOTO, REGISTERDATE);

-- 1.
insert into memberinfo values (memberinfo_idx_seq.nextval, 'APPLE', '111', 'apple', 'apple.jpg', sysdate);
-- 2.
insert into memberinfo values (memberinfo_idx_seq.nextval, 'Bear', '222', 'bear', 'bear.jpg', sysdate);
-- 3.
insert into memberinfo values (memberinfo_idx_seq.nextval, 'Cloud', '333', 'cloud', '', '');
-- 4.
insert into memberinfo values (memberinfo_idx_seq.nextval, 'Dog', '444', 'dog', 'dog.jpg', sysdate);
-- 5.
insert into memberinfo values (memberinfo_idx_seq.nextval, 'Eve', '555', 'eve', 'eve.jpg', '');

-- 회원 데이터 수정 : PK를 조건으로 수정한다
-- 회원 이름만 수정
update memberinfo
set name = 'apple1'
where idx = 1;

update memberinfo
set name = 'cloud1'
where idx = 3;

-- 비밀번호만 수정
update memberinfo
set pw = '1111'
where idx = 1;

-- 이름, 비밀번호 수정
update memberinfo
set name = 'dog1', pw = '4444'
where idx = 4;

-- 데이터 추가
insert into memberinfo
(idx, id, pw, name)
values (6, 'Flower', '666', 'flower');

-- 데이터 삭제
delete from memberinfo
where idx = 4;

-- 트렌젝션
COMMIT; -- 지금까지 데이터 UPDATE
ROLLBACK; -- 이전의 COMMIT부분으로 되돌리기

--------------------------------------------------
-- ## VIEW : 사용자에게 보여주는 가상테이블 (특정 컬럼을 제외하거나 복잡한 sql문을 간소화 시킨다)

select empno, ename, deptno
from emp
where deptno = 30;

-- # VIEW 생성 : CREATE VIEW 뷰 이름 AS 서브쿼리
create view emp_view30
as
select empno, ename, deptno
from emp
where deptno = 30;

-- 인라인뷰 작성
-- 사원 중에서 입사일이 빠른 사람 5명(TOP-5)만을 얻어 오는 질의문을 작성해 봅시다.
select rownum, empno, ename, hiredate -- rownum 뒤죽박죽..!
from emp
order by hiredate;

-- inline view로 생성하면 -> rownum이 순차적으로 출력된다~
select rownum, empno, ename, hiredate
from (
select empno, ename, hiredate
from emp
order by hiredate
)
where rownum <= 5 -- rownum 비교는 바깥쪽으로 영역이 되면 오류 (예: rownum > 5)
;

-- view로 만들기
create or replace view emp_viewHD
as
select empno, ename, hiredate
from emp
order by hiredate
;

select rownum, empno, ename, hiredate
from  emp_viewHD -- view로 검색 
where rownum <= 5
;

-- ## SEQUENCE 만들기 : 자동 숫자 증가 처리해주는 객체 
CREATE sequence test_seq; -- 디폴트: 시작 = 1, 증가값 = 1

DROP sequence test_seq; -- 삭제

select test_seq.CURRVAL from dual; -- 현재 값 반환
select test_seq.NEXTVAL from dual; -- 다음 값 반환

create sequence test1_seq
increment by 10
start with 0
minvalue 0
;

DROP sequence test1_seq;

select test1_seq.NEXTVAL from dual;

desc dept01;
select * from dept01;

insert into dept01 values (test_seq.nextval, 'design', 'seoul');
insert into dept01 values (test1_seq.nextval, 'design', 'seoul');

-- 회원가입시 증가하는 idx값을 위한 sequence생성
create sequence memberinfo_idx_seq;
