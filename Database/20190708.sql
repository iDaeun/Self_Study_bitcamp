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



