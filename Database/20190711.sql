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


























