create table SurfingMemberInfo (
    idx number(7),
    id varchar2(20) constraint smi_id_nn not null,
    pw varchar2(20) constraint smi_pw_nn not null,
    name varchar2(20) constraint smi_name_nn not null,
    pNum varchar2(20),
    photo varchar2(30),
    lv number(1),
    registerDate date default sysdate,
    
    constraint smi_idx_pk primary key (idx),
    constraint smi_id_uq unique (id),
    constraint smi_pw_uq unique (pw)
);

create sequence smi_idx_seq
start with 0
minvalue 0;

drop table SurfingMemberInfo;
drop sequence smi_idx_seq;

desc SurfingMemberInfo;
select * from SurfingMemberInfo;

select smi_idx_seq.nextval from SurfingMemberInfo;

--	private String id;
--	private String pw;
--	private String name;
--	private String pNum;
--	private String photo;
--	private int level;
--	private Date registerDate;

select pw from SurfingMemberInfo where id = 121;

---------------------------------------------------------
--2019.07.11 GUESTBOOK DDL

CREATE TABLE GUESTBOOK_MESSAGE(
    MESSAGE_ID NUMBER(6) CONSTRAINT GM_MID_PK PRIMARY KEY,
    GUEST_NAME VARCHAR2(50) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    MESSAGE LONG NOT NULL
);

    CREATE SEQUENCE GM_MID_SEQ;
    
    DROP TABLE GUESTBOOK_MESSAGE;
    DROP SEQUENCE GM_MID_SEQ;

    select rownum, message_id, guest_name from GUESTBOOK_MESSAGE order by message_id desc;
    
---------------------------------------------------------------
-- PROJECT : Library 

CREATE TABLE USERS (
	USER_ID   VARCHAR2(20),-- 아이디
	USER_PW   VARCHAR2(30) constraint ur_pw_nn NOT NULL, -- 비밀번호
	USER_NAME VARCHAR2(20) constraint ur_name_nn NOT NULL, -- 이름
	USER_REG  TIMESTAMP default sysdate constraint ur_date_nn NOT NULL,  -- 가입일
    
    constraint ur_id_pk primary key (USER_ID)
);

select * from users;
desc users;

create sequence USERS_idx_seq
start with 0
minvalue 0
;

insert into users values ( 'admin1', 'admin1', '관리자', sysdate);
insert into users values ( 'Jessie', 'J111', '제시', sysdate);
insert into users values ( 'Forkey', 'F222', '포키', sysdate);
insert into users values ( 'Woody', 'W333', '우디', sysdate);
insert into users values ( 'Boo', 'B444', '보', sysdate);
insert into users values ( 'Rex', 'R555', '렉스', sysdate);
insert into users values ( 'test1', 'test1', 'test일', sysdate);
insert into users values ( 'test2', 'test2', 'test이', sysdate);
insert into users values ( 'test3', 'test3', 'test삼', sysdate);

drop table users;
drop sequence users_idx_seq;

commit;

select user_id from users where user_id = 'admin';

delete from users where user_id = 'test';

select count(*) from users;

select user_id, user_pw, user_name, user_reg 
from ( select rownum rnum, user_id, user_pw, user_name, user_reg 
from ( select * from users order by user_reg desc ) where rownum <= '8' ) 
where rnum >= '6';

select rownum rnum, user_id, user_pw, user_name, to_char(user_reg, 'YYYY-MM-DD HH:MI:SS')
from users;

---------------------------------------------------------
-- 1. 도서
CREATE TABLE RENT (
   RENT_NUM INTEGER NOT NULL, /* 대출번호 */
   BOOK_ID INTEGER, /* 도서코드 */
USER_ID VARCHAR2(20), /* 아이디 */
   BOOK_REN CHAR(2) NOT NULL, /* 대여여부 */
   RENT_ST DATE, /* 대출일자 */
   RENT_END DATE /* 반납일자 */
);

ALTER TABLE RENT
   ADD
      CONSTRAINT FK_BOOK_TO_RENT
      FOREIGN KEY (
         BOOK_ID
      )
      REFERENCES BOOK (
         BOOK_ID
      );

ALTER TABLE RENT
   ADD
      CONSTRAINT FK_USERS_TO_RENT
      FOREIGN KEY (
         USER_ID
      )
      REFERENCES USERS (
         USER_ID
      );

select * from rent;

insert into RENT values ( '1', '1', 'test4', 'Y', sysdate, sysdate);

update rent set book_ren = 'N' where book_ren = 'Y';

update rent set user_id = '' where user_id = 'test2';


alter table book rename to ORACLEBOOK;

CREATE TABLE BOOK (
   BOOK_ID INTEGER NOT NULL, /* 도서코드 */
   BOOK_NAME VARCHAR2(50) NOT NULL, /* 책제목 */
   BOOK_AUT VARCHAR2(50) NOT NULL, /* 작가 */
   BOOK_PUB VARCHAR2(50) NOT NULL, /* 출판사 */
   BOOK_GE VARCHAR2(50) NOT NULL /* 장르 */
);

ALTER TABLE BOOK
   ADD
      CONSTRAINT PK_BOOK
      PRIMARY KEY (
         BOOK_ID
      );

select * from book;
-- 대출이면 => N !!!!
insert into BOOK values ( '1', 'testbook1', 'testbook1', 'testbook1', 'testbook1');

---------------------------------------------------------
-- 2. 건의사항

CREATE TABLE SUGGESTIONS (
   SUG_NUM   NUMBER(4)     NOT NULL, -- 글번호
   SUG_PW    VARCHAR2(30)  NOT NULL, -- 비밀번호
   SUG_TITLE VARCHAR2(20)  NOT NULL, -- 글 제목
   SUG_CONT  LONG          NULL,     -- 글 내용
   USER_ID  VARCHAR2(20)   NOT NULL  -- 회원번호
);

ALTER TABLE SUGGESTIONS
ADD
CONSTRAINT SUG_NUM_PK -- 건의사항테이블 글번호 컬럼 기본키
PRIMARY KEY (SUG_NUM);

ALTER TABLE SUGGESTIONS
ADD
CONSTRAINT USER_ID_FK
FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID);

select * from SUGGESTIONS;
insert into SUGGESTIONS values ( 1, 'testsuggestion1', 'testsuggestion1', 'testsuggestion1', 'test4');

---------------------------------------------------------
-- 3. 열람실

-- 열람실 테이블
CREATE TABLE STUDY_ROOM(
    STUDY_DATE DATE DEFAULT sysdate, --날짜
    STUDY_TIME NUMBER(4), --시간
    USER_ID VARCHAR2(20), --사용자
    SEAT_NUM NUMBER(20) PRIMARY key, -- 좌석 번호
    CONSTRAINT SR_USER_FK foreign key (USER_ID) REFERENCES USERS(USER_ID)
);

drop table STUDY_ROOM;
select * from STUDY_ROOM;

insert into STUDY_ROOM values ( sysdate, '1111', 'test4', 1);

---------------------------------------------------------
-- 4. 신청도서

CREATE TABLE NEWBOOK (
   NEWBOOK_NUM NUMBER(4) CONSTRAINT NEWBOOK_BOOKNUM_PK PRIMARY KEY, -- 신청도서번호
   NEWBOOK_NAME VARCHAR2(50) CONSTRAINT NEWBOOK_NEWBOOKNAME_NN NOT NULL, -- 책제목
   NEWBOOK_AUT  VARCHAR2(50) CONSTRAINT NEWBOOK_NEWBOOKPUB_NN NOT NULL,-- 작가
   NEWBOOK_PUB  VARCHAR2(50), -- 출판사
    USER_ID VARCHAR2(20),
    CONSTRAINT NEWBOOK_USERID_FK FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID) --고객아이디
);

CREATE SEQUENCE NO_SEQ
    START WITH 0
    MINVALUE 0
    INCREMENT BY 1
    ;

select * from NEWBOOK;

insert into NEWBOOK values ( 1, 'newbooktest', 'newbooktest', 'newbooktest', 'test4');

commit;



