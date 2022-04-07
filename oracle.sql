create table board(
no      number          primary key,
title   varchar2(100)   not null,
name    varchar2(20)    not null,
content clob            not null,
regDate date            default sysdate,
readcount   number      default 0,
password    varchar2(128) not null
);

create sequence board_no_seq;

-- 10002건 데이터 입력
begin
for i in 1..10002 loop
   insert into board
   (no, title, name, password, content, regDate, readcount)
   values(board_no_seq.nextval, '제목','이름','1111','내용..',
   sysdate-((10002-i)/24/6), trunc(dbms_random.value(0, 100)));
end loop;
end;
/
