--1 마당서점의고객이요구하는다음질문에대해SQL 문을작성하시오.
desc book;
desc customer;
desc orders;

--(1) 도서번호가1인도서의이름
select bookname
from book
where bookid = 1;

--(2) 가격이20,000원이상인도서의이름
select bookname
from book
where price >= 20000;

--(3) 박지성의총구매액(박지성의고객번호는1번으로놓고작성)
select saleprice
from orders
where custid = 1;

select sum(saleprice) as "총구매액", count(*) as "총 구매횟수"
from orders o, customer c
where o.custid = c.custid
    and name = '박지성'
;

--(4) 박지성이구매한도서의수(박지성의고객번호는1번으로놓고작성)
select orderid
from orders
where custid = 1;

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.

--(1) 마당서점도서의총개수
select bookid
from book;

--(2) 마당서점에도서를출고하는출판사의총개수 -> 출력하는 출판사 (distinct이용)
select distinct publisher
from book;

--(3) 모든고객의이름, 주소
select name, address
from customer;

--(4) 2014년7월4일~7월7일사이에주문받은도서의주문번호
select orderid
from orders
where orderdate between '2014/07/04' and '2014/07/07';

--(5) 2014년7월4일~7월7일사이에주문받은도서를제외한도서의주문번호
select orderid
from orders
where orderdate not between '2014/07/04' and '2014/07/07';

--(6) 성이‘김’씨인고객의이름과주소
select name, address
from customer
where name like '김%';

--(7) 성이‘김’씨이고이름이‘아’로끝나는고객의이름과주소
select name, address
from customer
where name like '김%아';

------------------------------------------------------------------------
--1 마당서점의고객이요구하는다음질문에대해SQL문을작성하시오.
--(5) 박지성이구매한도서의출판사수
select count(distinct publisher)
from orders o, customer c, book b 
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

--(6) 박지성이구매한도서의이름, 가격, 정가와판매가격의차이

select b.bookname, b.price, b.price-o.saleprice
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

--(7) 박지성이구매하지않은도서의이름
select distinct b.bookname
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid and not c.name = '박지성';

--2 마당서점의운영자와경영자가요구하는다음질문에대해SQL 문을작성하시오.
--(8) 주문하지않은고객의이름(부속질의사용)
select name
from customer
where not custid = any(
select custid
from orders
);

--(9) 주문금액의총액과주문의평균금액
select sum(saleprice), avg(saleprice)
from orders;

--(10) 고객의이름과고객별구매액
select c.name, sum(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name
;

--(11) 고객의이름과고객이구매한도서목록
select c.name, b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
;

--(12) 도서의가격(Book 테이블)과판매가격(Orders 테이블)의차이가가장많은주문
select o.bookid, b.bookname
from orders o, book b
where o.bookid = b.bookid
having max(b.price - o.saleprice) >= all (select (b.price - o.saleprice) from orders o, book b where o.bookid = b.bookid )
group by o.bookid, b.bookname;

--(13) 도서의판매액평균보다자신의구매액평균이더높은고객의이름
select c.name
from customer c, orders o
where c.custid = o.custid
and o.saleprice > (select avg(saleprice) from orders)
group by o.custid, c.name;

--3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select c.name, c.custid
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
and b.publisher in (select b.publisher from book b, customer c, orders o where c.custid = o.custid and o.bookid = b.bookid and c.name = '박지성')
;

--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select c.name
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
having count(distinct b.publisher) >= 2
group by c.name
;

--4 다음질의에대해DML 문을작성하시오.
--(1) 새로운도서(‘스포츠세계’, ‘대한미디어’, 10000원)이마당서점에입고되었다.
--    삽입이안될경우필요한데이터가더있는지찾아보자.
insert into book values (11, '스포츠세계', '대한미디어', 10000);

desc book;

--이름        널?       유형           
----------- -------- ------------ 
--BOOKID    NOT NULL NUMBER(2)    
--BOOKNAME           VARCHAR2(40) 
--PUBLISHER          VARCHAR2(40) 
--PRICE              NUMBER(8)

-- => bookid가 notnull로 지정되어있기 때문에 bookid도 추가적으로 insert해줘야한다

--(2) ‘삼성당’에서출판한도서를삭제해야한다.
delete from book
where publisher = '삼성당';

--(3) ‘이상미디어’에서출판한도서를삭제해야한다. 삭제가안될경우원인을생각해보자.
delete from book
where publisher = '이상미디어';

--오류 보고 -
--ORA-02292: 무결성 제약조건(SCOTT.SYS_C0011057)이 위배되었습니다- 자식 레코드가 발견되었습니다
-- => ORDERS 테이블에서 BOOK이 Foreign Key로 설정되어있기 때문에 삭제 불가 (해당 도서를 구매한 이력이 있음)

--(4) 출판사‘대한미디어’가‘대한출판사’로이름을바꾸었다.
update book
set publisher = '대한출판사'
where publisher = '대한미디어';

