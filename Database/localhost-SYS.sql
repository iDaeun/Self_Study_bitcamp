-- [미라콤 IT연계과정] DB수업

/*
테이블 스페이스
    테이블을 저장하는 장소를 테이블 스페이스라고함
    테이블 스페이스 생성
*/
 
create TABLESPACE multi
datafile 'c:\multi.dbf' size 50m
AUTOEXTEND on
next 10m
MAXSIZE UNLIMITED;
 
--테이블 스페이스 확인하기
select * from USER_TABLESPACES;
 
--사용자 계정 생성하기
create user multi
IDENTIFIED BY multi1234
DEFAULT TABLESPACE multi;
 
--사용자 권한 부여
grant connect, RESOURCE, dba to multi;