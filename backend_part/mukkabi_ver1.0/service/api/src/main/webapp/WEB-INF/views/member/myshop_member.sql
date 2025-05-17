drop table member;

create table member(
  idx number(8) constraint member_idx_pk primary key,
  name varchar2(30) not null, --이름
  userid varchar2(20) not null, --아이디
  email varchar2(100), --이메일
  pwd varchar2(20) not null,--비밀번호
  hp1 char(3) not null, --연락처1
  hp2 char(4) not null, --연락처2
  hp3 char(4) not null, --연락처3
  post char(5) not null, --우편번호
  addr1 varchar2(100) not null, --주소1
  addr2 varchar2(100), --주소2
  indate date default sysdate, --가입일
  mileage number(10) default 1000, --마일리지
  m_state number(2) default 0, --회원상태(0:일반회원,-1:정지회원,-2:탈퇴회원)
  constraint member_userid_uk unique (userid)
);

drop sequence member_seq;

create sequence member_seq
start with 1
increment by 1
nocache;

