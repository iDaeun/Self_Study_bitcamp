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
	USER_REG  DATE default sysdate constraint ur_date_nn NOT NULL,  -- 가입일
    
    constraint ur_id_pk primary key (USER_ID)
);

select * from users;
desc users;

create sequence USERS_idx_seq
start with 0
minvalue 0
;

insert into users values ( 'admin', 'admin', '관리자', sysdate);
insert into users values ( 'Jessie', 'J111', '제시', sysdate);
insert into users values ( 'Forkey', 'F222', '포키', sysdate);
insert into users values ( 'Woody', 'W333', '우디', sysdate);
insert into users values ( 'Boo', 'B444', '보', sysdate);
insert into users values ( 'Rex', 'R555', '렉스', sysdate);

drop table users;
drop sequence users_idx_seq;
























