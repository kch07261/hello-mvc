--=================================
-- web 계정 생성 @관리자
--=================================
alter session set "_oracle_script" = true;

create user web
identified by web
default tablespace users;

grant connect, resource to web;

alter user web quota unlimited on users;

--=======================
-- WEB 계정
--=======================

create table member (
    member_id varchar2(20),
    password varchar2(300) not null,
    name varchar2(50) not null,
    member_role char(1) default 'U' not null,
    gender char(1),
    birthday date,
    email varchar2(200),
    phone char(11) not null,
    hobby varchar2(200),
    point number default 1000,
    enroll_date date default sysdate,
    constraints pk_member_id primary key(member_id),
    constraints ck_member_role check(member_role in ('U', 'A')),
    constraints ck_member_gender check(gender in ('M', 'F')),
    constraints uq_member_email unique(email)
);

--회원 추가
insert into member
values (
    'honggd', '1234', '홍길동', 'U', 'M', to_date('20000909','yyyymmdd'),
    'honggd@naver.com', '01012341234', '운동,등산,독서', default, default
);

insert into member
values (
    'qwerty', '1234', '쿠어티', 'U', 'F', to_date('19900215','yyyymmdd'),
    'qwerty@naver.com', '01012341234', '운동,등산', default, default
);

insert into member
values (
    'admin', '1234', '관리자', 'A', 'M', to_date('19801010','yyyymmdd'),
    'admin@naver.com', '01056785678', '게임,독서', default, default
);

Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('encrypten_man','b5fMEM1PXQznhG6q+YA+t03cAhGSXAXwvU53Nn1BGiX3ta1Io+OBrDdcMSO0FNsGHq2F2yFZuDM0o4VMRct05Q==','암호화','U','M',to_date('91/02/03','RR/MM/DD'),null,'01012341243',null,1000,to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('abcd','kl9Dw8+5VrvjxqqAI7p61c+iHRBBhv/8aedo5VlA2WU7HNNvumFPui4YRPRDbaIPg3UMbsHbNW2hVGkb3XGpsQ==','김준호','U','M',to_date('92/02/02','RR/MM/DD'),'abcd@naver.com','01012345678','운동,등산,독서',1000,to_date('18/02/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('hihiroo','tVVKLkAaPExiMPG+61kg/Sa3zwUjBDn+d/t9+5Mzayxk/nX1ejPD51En+Dp3d2tsOFdfwhYtDLHwXur7x2WRow==','김안녕','U','F',to_date('01/10/18','RR/MM/DD'),'hihiroo@naver.com','01023454635','운동,여행',1000,to_date('18/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('bcde','CyBVG3lotbWmZ9u3YnplNF9/bz6TeaMcJ00mNLnElaJSoxXz+HQjHolWj7N6dF487BUeSnD0ah0z+D2WpOF2JA==','서지와','U','F',to_date('93/01/20','RR/MM/DD'),'bcde@naver.com','01012345678','운동,등산,독서',1000,to_date('18/03/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('cdef','72EwUnmF7+MHxylbRPA4Yje1G2WnQhts6NkD5u7m6VX2j7HSr9sbnxV7FZs9KIsoLFmgjL6jYEfZfUXcsSVb3A==','김윤정','U','M',to_date('94/04/20','RR/MM/DD'),'cdef@naver.com','01056745678','운동,독서',1000,to_date('18/11/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('defg','XfCwrQEd+gWEvu5u7BWt25GbbqiCIyDEEHDeZmGANzATGpWUPjVrqPoVRVm+wlpjkqkyCIHzwA6Uu2SKqovRFg==','박봉철','U','F',to_date('95/01/20','RR/MM/DD'),'defg@naver.com','01012345678','운동,등산,독서',1000,to_date('18/04/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('efgh','ZVY/0M/cZbs9RKmkrrIxxVJ8wAKTNxQU3PXuSmPaq+NDrxE4bcauTvpTaZFiIVFepsBHQQ7leErdxZH3h1tb5A==','하정운','U','M',to_date('96/06/03','RR/MM/DD'),'efgh@naver.com','01012345678','운동,등산,독서',1000,to_date('18/11/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('fghi','M1u7HHX+sGYULzDO+TuT4A8lK9kjMNbkkHbpz+KvzGJrzSLi5IF70V2DBBz7PiEkQ3h7wBvr8eX8HC9Wf1G8Gg==','유병송','U','F',to_date('97/01/01','RR/MM/DD'),'fghi@naver.com','01056745678','운동,등산,독서',1000,to_date('18/03/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ghij','MBJeDfSnad/8P8HXPT9PCSM4XCvKz+GvUXklsdgGvEt0x8fdipjZEmGy9piGOBRsu969XLzz9SAhXchonjODQg==','노민우','U','M',to_date('98/07/02','RR/MM/DD'),'ghij@naver.com','01056745678','운동,등산,독서',1000,to_date('18/11/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('hijk','WkxwP3vygB2jgGeVwmftbKecRqD1Jf1hill38KETXcr3va95O9tNEFnfPQ4lJJkPi/EkqpnvN7mETLpw/UuKWQ==','김지호','U','M',to_date('99/04/18','RR/MM/DD'),'hijk@naver.com','01012345678','등산,독서',1000,to_date('18/06/08','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ijkl','xXd9K6C7xttZypipWuVlevF57rmjsNWnfOQAX6kI2fv2GeqDnHyGPERkCJw7Q2Pvlp0nfjnXtMI7GsfA5noAyQ==','장동준','U','M',to_date('00/04/01','RR/MM/DD'),'ijkl@naver.com','01012345678','운동,등산,독서',1000,to_date('18/06/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('jklm','bbim0ix00HxOlncSCa0Yni+C01QVz7uT1IrKJvwtROAONeZRI4xnDfLOv58mLlKnx1tmEChBq3xPFL9gGCjctQ==','서연','U','M',to_date('89/07/20','RR/MM/DD'),'jklm@naver.com','01012345678','운동,등산,독서',1000,to_date('18/06/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('klmn','cYxpMnkJyjf/UlyFkbZbEfns65BAgjjO3wZO7mg05HFRjl3e+/DN824pCSSdIxkSoM5FspTXXcSWP69Fx8LnVA==','서연호','U','M',to_date('88/04/15','RR/MM/DD'),'klmn@naver.com','01012345678','운동,등산,독서',1000,to_date('18/01/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('lmno','UNZgLVT1ZVk8AJn4Pt3/Pu663MBZJjGgOWR3fKNL/aPeYO7heeChrYKHezWyGjvQvqFfSOD/cogqgVvbSCWvvg==','김연우','U','M',to_date('87/03/01','RR/MM/DD'),'lmno@naver.com','01056745678','운동,등산,독서',1000,to_date('18/04/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mnop','ScGLsC4CPjqdfkS3wc+3Qo6OSBfMkmXr9Axb5H2te0gQ1Nw0c3xG3VqV44lI+injlV36PpNUCy5g8t57QdsOgg==','정지운','U','M',to_date('86/06/03','RR/MM/DD'),'mnop@naver.com','01056745678','운동,등산,독서',1000,to_date('18/06/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('nopq','Tmj83yN8LLPE/K/fzQN029tWOXEx61HRUq0vgBE5LgyUoDU+9Q+QePku/10bR4OWh9KxIqADJgmyCz0wkTHBdw==','정구운','U','M',to_date('85/03/20','RR/MM/DD'),'nopq@naver.com','01012345678','운동,독서',1000,to_date('18/04/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('opqr','s9FvGtLsSK1TGKvdV2lU+/sD3x7VKuDSUi8l6rgugxCpiOywjMVDVKc232dszvTBLBEUmR9mXToHLdWyq0SxQg==','안성우','U','M',to_date('84/07/01','RR/MM/DD'),'opqr@naver.com','01012345678','운동,등산,독서',1000,to_date('18/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('pqrs','nHh5AHEt6s96P4eyRs8YxXByWWv4SrNokv2IePqRJomup/KJ9uwTtVmC6yillNrTGpgvgMgNeD2cO1bpHixHHA==','이주은','U','M',to_date('83/01/18','RR/MM/DD'),'pqrs@naver.com','01012345678','운동,등산,독서',1000,to_date('18/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('qrst','KUT69Bz3jBtRENJbnzlL1baR2af7x7nNZ6qkFvFOzxILWSW4UcJ8UfdegboPBrGMtCNIoTyCJlkngaIZQkGHlw==','김보리','U','M',to_date('82/03/02','RR/MM/DD'),'qrst@naver.com','01056745678','운동,등산,독서',1000,to_date('18/11/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('rstu','tR64KNpkvWBpPeIVQCqvz4uhI2pJqVopTxJsjMHOo8LuZoZyQ4oULA2FhXlmfNFn/w4A9yWkjIkguKMhxp5NGw==','차보라','U','M',to_date('81/06/01','RR/MM/DD'),'rstu@naver.com','01056745678','운동,등산,독서',1000,to_date('18/06/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('stuv','1mUSiAtY70GyjBFyjgQkObYbHC2uSyLTn3qGMln4by+SCGUsUZo9+zzNdaK3hPdSWESOuuP8R6TVcmgRpZyw8Q==','장경자','U','M',to_date('80/07/15','RR/MM/DD'),'stuv@naver.com','01012345678','운동,등산,독서',1000,to_date('18/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('tuvw','m1xQSOtld4q6Q03vWsZDJIufmcwopqhUgY2IXzJ6901lqyVdGG/XlLl75gJaMboob38SiO7xiv7DhoDAmil5kg==','정성택','U','M',to_date('83/06/20','RR/MM/DD'),'tuvw@naver.com','01012345678','운동,등산,독서',1000,to_date('18/03/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('uvwx','mR5m2yikAAisN9HsLuiAXfkZqK626Rpnr1Yk3/MLrzbwIPkcRKy5PVij2rhZ8iQmT5xUzvvAyvKZSjEJ/VuGIw==','김정은','U','M',to_date('02/07/18','RR/MM/DD'),'uvwx@naver.com','01012345678','운동,등산,독서',1000,to_date('18/11/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('wxyz','LYEdgC1o+YivkWA/q8nfaKHmWQs1dxHl6qcDV4FtMwA8sLhZ6+o1bxYTmSGHx6S0jgIbWysZsrwM4Or0tvW3bQ==','박보람','U','M',to_date('75/01/01','RR/MM/DD'),'wxyz@naver.com','01098765678','운동,등산,독서',1000,to_date('18/07/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('catmom','dJPh+N8vQ5hNhd+mi69Py7IJmB3iMNJrTWmZExe1h+K3ABoeXveOMm2daiasM0aHMQ0Feb6HtMNTo31PXHknQQ==','구본우','U','M',to_date('79/06/15','RR/MM/DD'),'catmom@naver.com','01098765678','운동,등산,독서',1000,to_date('18/04/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('bear','l1tFe1PxZfET2fZ0VWewHHh+HgojMEKM3ntFWPg8iqBNvj7Zi9hxmZC23u11RhxyZNlQvIHUdshmVs0XFkIi1w==','가제트','U','M',to_date('79/11/01','RR/MM/DD'),'bear@naver.com','01012345678','운동,독서',1000,to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('dogpapa','Sf5dlVM7iHPmLbVplroeb7mHXmzJoc41gvyfABp85rVH1VCVMf+lXvDRzBMfw2I3rN1fPKIEg+oX9lMutMET+w==','한석규','U','M',to_date('75/07/03','RR/MM/DD'),'dogpapa@naver.com','01012345678','운동,등산,독서',1000,to_date('18/06/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('fishman','8n5sWgccNgvX1MX5qGkrU/bAqfAtPhh6lPxz3bthF61In7RkDRFw2WtZaz45ItlHaXf0uF+A8ehCjqsSlBZYzA==','두석규','U','M',to_date('83/01/02','RR/MM/DD'),'fishman@naver.com','01012345678','등산,독서',1000,to_date('18/07/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('buckey','cA8VpofErJK1TLEepweNHjaxVKhI3wOjrDeo3ekzh56RcEE+c3EL4y82+I8sCginYeJgX+ocmNlXz2DrETI58g==','세석규','U','M',to_date('75/01/01','RR/MM/DD'),'buckey@naver.com','01012345678','운동,등산,독서',1000,to_date('18/11/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mmary','/Az2D56DAhbMOKCRgNSR8EpKbsJfgJZ1K4BOgxEP5nW9ITrbZhQetOl/AKMCClOkcCk7Z5u0wfCiWA9tWJmbrA==','네석규','U','M',to_date('01/03/20','RR/MM/DD'),'mmary@naver.com','01012345678','운동,등산,독서',1000,to_date('18/07/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('usbteacher','XBeITdi74u//pAN50IyJO/c9mgKSwVMh7i3CiPRK2YFyySe3UVSQsK6gSF15dnDQ2+/RBwKQNaUzZcTR3GOSDA==','마동석','U','M',to_date('79/06/01','RR/MM/DD'),'usbteacher@naver.com','01012345678','운동,등산,독서',1000,to_date('18/01/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mslove','fpr9ASj0clh3tP+pZrKA7KGnoHs+clRf4Ng8hTGZv6R2u6hZsKoNnzJdVvw7U8OMrpJGjFQ+dzrL3ZeWUsKz1A==','아무개','U','M',to_date('75/11/03','RR/MM/DD'),'mslove@naver.com','01012345678','운동,등산,독서',1000,to_date('18/07/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('spongebob','d1Z6g1siCCXj1h9fEH6HyONYtSUXtKef8fCYeRdVFDGTDFC37n1o+hn/NNNLxwl/uE/fY6G+qRVqbl6WZGhIrQ==','김밥','U','F',to_date('75/04/20','RR/MM/DD'),'spongebob@naver.com','01023454635','운동,여행',1000,to_date('16/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ordovician','s+2wvpBbH4vGitTq6SIu/X7RvtHz6MUTqgr8lhRkbcUTadpHNi8F8TIYOpt5qL0ZNtYl5EdfmIQLNLzP9+Uzew==','암호화','U','M',to_date('01/01/01','RR/MM/DD'),null,'01012341243',null,1000,to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('patli','P7ey/ncaTiGUK4rtU52Lk6RcH8Q3N2OhUUTO2VREyRMjlWvw91LVrEVkIgihliWFsbygDSbYRKkVPAUCWddjHQ==','김준호','U','M',to_date('75/07/18','RR/MM/DD'),'patli@naver.com','01012345678','운동,등산,독서',1000,to_date('16/04/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('skitz','QTIE6dzUNF2ctQ6h473pZbsg1zJCcWiUBtG7h4oNRclNcH1IL2Lq/q964LkU50tVIpw/OQb4VE1zLDP7UVP5vg==','서지와','U','F',to_date('79/07/02','RR/MM/DD'),'skitz@naver.com','01012345678','운동,등산,독서',1000,to_date('16/11/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('hlal','x2mMef+5PuSvn7FA1+A9MWOFm5scQ4HBHiR8JdOOLfNGJSxVtiu/N6GvNTxcp5rtIiwBX/7hPqgQMucvC0rpQg==','정윤정','U','M',to_date('75/06/03','RR/MM/DD'),'hlal@naver.com','01056745678','운동,독서',1000,to_date('16/02/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('skytear','qMf4/dxaOQJie8T/W+arkLmu05oUveb62dBLjjiCVE+ALa+51S0Fr5isUlJLASzoAHlrJsPLU0k9g0MrUtfiSQ==','박봉철','U','F',to_date('83/11/15','RR/MM/DD'),'skyTear@naver.com','01012345678','운동,등산,독서',1000,to_date('16/07/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('leander','EBH9VE0n01ggZpFfFnaV1xOnHHbHicRS60OOH0mUCksRmtNZe2u271mguere/5t9zMOSCBkmR5ANLqygXWExZw==','하정운','U','M',to_date('75/01/01','RR/MM/DD'),'leander@naver.com','01012345678','운동,등산,독서',1000,to_date('16/04/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ripsnarl','X43Ynp2yFv/qMsBIVnfiVHWuK+sxxIiNpZJcAeRDJETMIAQ9cuS8LroKXTHxD0JXW2+wapYpElXO/Y/Lu+H8jg==','유병송','U','F',to_date('90/07/03','RR/MM/DD'),'ripSnarl@naver.com','01056745678','운동,등산,독서',1000,to_date('16/06/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('eleuia','j96oynLxlBDdL9ql9zA2km43MAw9hxqUsScLLIg7a2dPHEIk6O6Ks66G2ZwnNXI2TBfhiamrsOChSpQ+rEaRFA==','노민우','U','M',to_date('75/07/20','RR/MM/DD'),'eleuia@naver.com','01056745678','운동,등산,독서',1000,to_date('16/01/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('lior','Gw1CM/QEAtGLUN2cfGmIgI31mDnAE7PVT7pMbvCqn0K6CYqRWogsYzPPE9GYPFrG7522zc6C5N728oeI6uNNJg==','장동준','U','M',to_date('79/11/02','RR/MM/DD'),'lior@naver.com','01012345678','운동,등산,독서',1000,to_date('16/01/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('eseit','2/PLV0z83U6mzTSBn20h1PKL676ZXUC9wgJNbP4IFC4rkCuywsNpcEbsiPSNr7mEwqQwkTiFTVza7NRIl4v1kw==','서연','U','M',to_date('75/01/18','RR/MM/DD'),'eseit@naver.com','01012345678','운동,등산,독서',1000,to_date('16/07/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shimmer','jaY15193bogTDImlL4bqKn4hN/i74XPSfweJstQKeo5PThv2Rb8xsGZTm3zZ9j2MmPjMBPWyx5tJ0v1M8bagqw==','서연호','U','M',to_date('83/06/01','RR/MM/DD'),'shimmer@naver.com','01012345678','운동,등산,독서',1000,to_date('16/04/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('nibbles','qx6XPZbw+Qs5bcEfeL1PudIyWOpjQc6vaqhzAnjJqVF2Znpyg5iWxq6tCSVGv0r7ylqiLfxwUrhaGjNnnzTetg==','김연우','U','M',to_date('75/11/03','RR/MM/DD'),'nibbles@naver.com','01056745678','운동,등산,독서',1000,to_date('16/01/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('pastel','Xa5AqYfmnUybEmHdnkWVBzFvFo6t7Uoor9gTmmAsEt1eLPoDdq+3YhxdR3pMaVK3G8SJagDMGUt6G6HZn4bUww==','정지운','U','F',to_date('79/11/15','RR/MM/DD'),'pastel@naver.com','01056745678','운동,등산,독서',1000,to_date('16/04/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('pewner','zgigyVI3/yaiCFdEPVuLYYXrKP8/iio5ZqzsZOnKlTwyIe+FB0ZnPOjAyOGhm2g38krrx39JEF8hmVKt/MigDg==','정구운','U','M',to_date('75/07/20','RR/MM/DD'),'pewner@naver.com','01012345678','운동,독서',1000,to_date('16/06/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mrglows','RtaoKZTIo6sH4z3CVYVBtJkQhGLcDaBxB2rcMGi5HY1RIiNzQEFhNsMxUwprVfzboutNtHS3rbZPlx7IGnaArQ==','안성우','U','M',to_date('83/02/01','RR/MM/DD'),'mrGlows@naver.com','01012345678','운동,등산,독서',1000,to_date('16/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('raich','qiOSYPc4JCCZMhVXl1NwcbxiXRQCeLcYO6qZqgcWGcaznK5NrLMfEZvzfJMReqwN6sJSU9fi7eODIYhyNak8GA==','이주은','U','M',to_date('01/01/02','RR/MM/DD'),'raich@naver.com','01012345678','운동,등산,독서',1000,to_date('16/11/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('jasmine','f8B667RW+hvewE4tO1M9pOEUdNXdXBGSH/N+9QwAA1LQMcZRq0jFGebCyGe3RgAD7FaQe+L4bZg/bIWGz0hNLA==','김보리','U','M',to_date('75/07/03','RR/MM/DD'),'jasmine@naver.com','01056745678','운동,등산,독서',1000,to_date('16/01/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('zothath','zkqwJcVqdnJNC7wA6Lu3yDtD+mNYOQ/gmCv0VIWybEktu6QJHxsAnNvvtb7X8Cav/bazobRXPRU4f7OUJrwDJA==','차보라','U','M',to_date('75/02/20','RR/MM/DD'),'zothath@naver.com','01056745678','운동,등산,독서',1000,to_date('16/07/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('imamu','uN0j5+1R6azEouge7idq258VKeG2KBjKg0u59Ntaov5/6kGLBGxR+oBvljUshuMv3ejpL4HO/61bZpr1wCXiJQ==','장경자','U','M',to_date('79/06/01','RR/MM/DD'),'imamu@naver.com','01012345678','운동,등산,독서',1000,to_date('16/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('floater','+Iw1/VzZupZj3eclgSWzLf09CEWkTpTSvB7SmUEP3+8dAP2hWR39cLz1Qna6ZD22hh95XBgJXrsSX/C72oiZOw==','정성택','U','M',to_date('75/02/03','RR/MM/DD'),'floater@naver.com','01012345678','운동,등산,독서',1000,to_date('16/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('nana','gSeO9sE+uZl00FUkPEBCQaPDQ5CyWPJE+bIkKq0XMudE/1aNMMczTve61c3Ig0u5GgmjrSuX+VaESRbjHIMPKA==','김정은','U','M',to_date('79/09/20','RR/MM/DD'),'nana@naver.com','01012345678','운동,등산,독서',1000,to_date('16/02/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shotsathothu','MncXgB4VZWzkYo1lBWslfjdl6mswHd/Z/UxI3vsp66+U9h+WrGTQUYFB7/A552bOW8ugSMvwSg4LkwEWVLUjhA==','박보람','U','M',to_date('75/07/02','RR/MM/DD'),'shotSathothu@naver.com','01098765678','운동,등산,독서',1000,to_date('16/01/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('kisaki','m1Z2lTRZT6fJTqZr6huSgUX3V0QLFO/k5rdcuHSadsBD7to+AaNJH1068If4+dpru1rP+7jUZYLN2DwPQqlZTw==','구본우','U','M',to_date('83/06/01','RR/MM/DD'),'kisaki@naver.com','01098765678','운동,등산,독서',1000,to_date('16/07/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('notyours','NeNcLPVgSNybXmbegX7D17v9RVhtyxt4hax88v1QfBREvmNxUAHTysqGRlObmDHA/H75EjcRruN+WLlIgwO6Mw==','가제트','U','M',to_date('79/07/03','RR/MM/DD'),'notYours@naver.com','01012345678','운동,독서',1000,to_date('16/09/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('cipanr','2HFyap9Df5AtMtveXIwcJNtzYxrBTQIHF+kT7gADjv7P/2fD5JVThQPvgm05gjS56QevRGIUizQkn/8jmH1S5Q==','한석규','U','M',to_date('75/02/01','RR/MM/DD'),'cipanr@naver.com','01012345678','운동,등산,독서',1000,to_date('16/01/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('iarsere','R5dpWY+frp8p5D94VX2ZwZ4DvgCjTFw3A1nbgU8fmyz1JYFjZ83YwLGkTN8ys1PJc6AoZ6gaYs2DWqjNkMhCwA==','두석규','U','M',to_date('90/02/18','RR/MM/DD'),'iarsere@naver.com','01012345678','등산,독서',1000,to_date('16/04/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('kubcthothoth','+sHwp0mb1XCQ3zXRpX/vcvVdih3q0A8XGdFyT2xdUEHzFTH64t1b92jICS6sfOKSAZKTUu+8cH+OQywtmGoxJQ==','세석규','U','M',to_date('75/02/03','RR/MM/DD'),'kubCthothoth@naver.com','01012345678','운동,등산,독서',1000,to_date('16/01/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('claw','cGCtrDX18INJVHU5f7eIKqn2TCc/Uw7HeZP7DTyl5y8rjGyCw+Yps7AgHQSJY9psv4ptsdijHOUV5BtPW2XGQA==','네석규','U','M',to_date('79/02/01','RR/MM/DD'),'claw@naver.com','01012345678','운동,등산,독서',1000,to_date('16/09/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('hibiscus','HbCl7uJVNDC42OFbYPRRrFgGfCv34/7SnKyM0k6SmmHn1gA8A79bq1upvhpHiJj2gq63A6HUA3RzjDF9s68Erg==','마동석','U','M',to_date('75/10/18','RR/MM/DD'),'hibiscus@naver.com','01012345678','운동,등산,독서',1000,to_date('16/04/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('elania','61SkGgLMUPekJP3KZ7cpJ4YenrGLFBpDHkzNEbkd5s8Q7+Hff2spFHdfNWHJapnFPQALuEgPkzwnscdWhzoBAg==','아무개','U','M',to_date('83/10/03','RR/MM/DD'),'elania@naver.com','01012345678','운동,등산,독서',1000,to_date('16/06/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mothball','wgCkD2UhWZMYHb4WGNWIhnzpvgLQ7OCD7PaL7mH4EME7DM2OKvTGBNqxLR1jiQsLu/EDanMD/I6KcE2jRkf6Rg==','노바디','U','M',to_date('75/10/01','RR/MM/DD'),'mothball@naver.com','01012341234','등산',1000,to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ssynec','3s2SriBCcRwmaujF6wyxFIWcK1u9LkKkcOzUdOG7KbhD1Zz9h/BvjMZt/Lnxbkpax3sN2GYC1nOHQE0jCIg0Wg==','네오','U','M',to_date('79/02/02','RR/MM/DD'),'ssynec@naver.com','01040021863',null,1000,to_date('16/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('amethyst','zyUVaDwOE5gLGJfTq01tuycNUyQ9rM6zE8pkKfHoeGPojTI5FOsfyMBhycYvUHl0FsxI545hqQMoS+bueAJZcw==','감사용','U','M',to_date('90/04/01','RR/MM/DD'),'amethyst@naver.com','01012341234','운동,등산',1000,to_date('16/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('xapreiye','QI0X2EIIq7UQt98XLKDL+8eDcwLOqp+W6zCO1b/AWHeAntwxxqFXXxnPGlHYHQKSdROjZteA+F0LKTQSHf0+sA==','허안녕','U','F',to_date('75/10/03','RR/MM/DD'),'xapreiye@naver.com','01023454635','운동,여행',1000,to_date('17/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('fliostium','YH6hEAhH60lescFlqiA4iy4Inll91rd5wuHQTFD0oY0tMbEUML5KgUYQGoAaaZdO3qAIMthMPcgJWlp+TuO94A==','부호화','U','M',to_date('83/10/02','RR/MM/DD'),null,'01012341243',null,1000,to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ocrait','69XnpRqxSEx0iJYqbgSZDoIVzBk068vGyMQK6Pu+Usm741SC2OwRj8+NTItZbJc5ecSV5npdKieTYhZ0l545yg==','박준호','U','M',to_date('75/01/01','RR/MM/DD'),'ocrait@naver.com','01012345678','운동,등산,독서',1001,to_date('17/09/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('oshary','xeD9GSxc5Qe5+5dMbTe83eQQKQvefh9ABevdUp+IiCDw7JbkgWlMf+vOJk4ZNB0Pvy57HCehWJGnq5gKJHtP1g==','치와와','U','F',to_date('79/04/20','RR/MM/DD'),'oshary@naver.com','01012345678','운동,등산,독서',1000,to_date('17/10/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('bleze','mmKlK209JboRaHBzniqxN/wh0Rv2MdRyz1iA5GWHcxbY9fbFebNCpSgPicD9dY4kp14jMywCsKUjDlNuwYD7qA==','박윤정','U','M',to_date('75/06/03','RR/MM/DD'),'bleze@naver.com','01056745678','운동,독서',1000,to_date('17/10/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('megriuvania','n8Dqe6bRJBfcH6QrAjlu2PNNkH/ClWfFrioq0FgKsBibO15t205ihvylchi9eKHeHVHoAm18jL9AhuLmWMjgvQ==','박성철','U','M',to_date('90/09/02','RR/MM/DD'),'megriuvania@naver.com','01012345678','운동,등산,독서',1000,to_date('17/01/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('glosau','WMcXT6wXj7ipK/fJTdwtG/xE1oTa46eD0TCrgkGjs3csb1TOwy42E7DLARgLl7gWOQ0l5ndekdVabGfcumWDIw==','고정운','U','M',to_date('75/10/15','RR/MM/DD'),'glosau@naver.com','01012345678','독서',1000,to_date('17/03/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('lasken','tPWmtb80/6NFuqBTVNaxp0n3FccquMcTlVtIqBpFMj9YEAFEJ1/UAMf45KRiLHqNWkNre6SSzNmqvPnvCoRKaw==','유병우','U','F',to_date('79/07/02','RR/MM/DD'),'lasken@naver.com','01056745678','운동,등산,독서',1000,to_date('17/04/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('nesnesh','U77/LH1S8eF9zkcISE5x0RsYa5NfQsYvKq2INIpN8qvQ4X5K/pXvcX2XPdhYyhVf0ZZWZZxn6npbVNzW4UPI/A==','노민호','U','M',to_date('90/09/03','RR/MM/DD'),'nesnesh@naver.com','01056745678','운동,등산,독서',1000,to_date('17/10/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('granite','bCdO3CMcLwPkigVF8jB+a+igQwF8M0U/qEYvwYsmc0eZeBwUz86CyA4YLT7sAG/gz0sQnI0blHB21reVXl6wYQ==','김진호','U','M',to_date('75/01/20','RR/MM/DD'),'granite@naver.com','01012345678','등산,독서',1000,to_date('17/09/08','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('sinsa','VhX5yA0UMyKhIu26Iuc5Zs5ApAvXd4JPjcViP9b88YcS6ZFjokpnuTH61pxeHDiAGmQZBFDTiLRcBVQ1MTlvEg==','신사임당','U',null,to_date('90/09/09','RR/MM/DD'),'sinsa@gmail.com','01024242424','운동,등산,게임',1000,to_date('22/06/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('arachnid','tN9pOhUWyA/GCxXyHhu5PEorudxuGOjwffjqYa5ZIJoVlWFlHj4tFR1JmRD0h2F7gNeDSpAMTt/a7h8dhRpRhg==','장옹이','U','M',to_date('75/10/01','RR/MM/DD'),'arachnid@naver.com','01012345678','운동,등산,독서',1000,to_date('17/04/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('blight','jvaJXX9SOtR6iEDQd3JyzLsXS4fngirzbZbARtgi9jRNFhu+vEG78EkJgJuGDSrerpcBh/s2zRrv0NPmVJnURA==','서지연','U','F',to_date('79/06/02','RR/MM/DD'),'blight@naver.com','01012345678','운동,등산,독서',1000,to_date('17/10/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mist','0lCNgedPYy6sg8wf39TjhvUoGHUoZMMJLttRNQpnQpOo7+1RGtMfeQkUpJXLeYIbeR7ZefzMZwPMNIgJhLdNZA==','서연요','U','M',to_date('75/09/20','RR/MM/DD'),'mist@naver.com','01012345678','운동,등산',1000,to_date('17/02/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('mouse','rzfzPnKP6NxDYxyt+mpus3nGZ+An1JYNy3JodcJz4B1QrJNW032SNLS15JcKGZeFxYfqXArpo2abN/TZj0+b1Q==','김연유','U','M',to_date('02/10/03','RR/MM/DD'),'mouse@naver.com','01056745678','운동,등산,독서',1000,to_date('17/07/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('scramble','fkHU/C1xKddvIDUjUSCEUMp0NodoUozA9c3ZRPNkNYZtJHUxtPxYbQXRkrkPVtBz4LZVB4twxfbVpLWgwuZvwA==','정지훈','U','M',to_date('75/10/20','RR/MM/DD'),'scramble@naver.com','01056745678','운동,등산,독서',1000,to_date('17/01/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('rime','SBwLPZfKOhyzMUJhvkkmE4s43PWJmh3mPBP62RMKH18dIDMtUtCkHcsdokUj5nCKHqMxaanOk5RNABKMc1wYQA==','정수윤','U','F',to_date('90/04/02','RR/MM/DD'),'rime@naver.com','01012345678','운동,독서',1000,to_date('17/10/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('wireless','+UWElK/2p+tDmqfxq4tw9WDhoAJ9JADae1U8aMs39gaANrL1z1F3ImJNyS8V2lJDBTOusHfYxtHxcmdxZhnWng==','안성호','U','M',to_date('79/07/01','RR/MM/DD'),'wireless@naver.com','01012345678','운동',1000,to_date('17/02/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('fiend','QAeoMbbn6j+yhyRndrIv5OnRFShardQsocNiE3gzbToK26fniVqR+nH42ryJ+XYZIbf2JVQtALBRObCV/sApvw==','이주흔','U','M',to_date('79/04/03','RR/MM/DD'),'fiend@naver.com','01012345678','운동,독서',1000,to_date('17/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('pebble','3T3DY3H8o9teMLRqCq5isLPSE38YGID2u3AJMIYqN7SfKGmhrWu+k+F22cO/WqllhbJru4TiNjJzUpWrwxLPjg==','김보리차','U','M',to_date('01/04/02','RR/MM/DD'),'pebble@naver.com','01056745678','운동,등산,독서',1000,to_date('17/02/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('disperse','/2HrUiwcuOE6rkzY7s/PKuguKIq7qPiWEKaF6h83c677s7NB0sgCQ8PCgtyehMRItqm7+C2+xNWWsTv54fubbA==','차보라','U','M',to_date('79/06/15','RR/MM/DD'),'disperse@naver.com','01056745678','등산,독서',1000,to_date('17/02/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('inferno','9Yv/5mwNdqHjp/tthrVXXo7XmxbCYVL5xvhLrBnIhekCbciVkA/3ZQ7g01cV41Qs7t2ig+3vxb/DLecDBVAw7A==','장경택','U','M',to_date('01/09/02','RR/MM/DD'),'inferno@naver.com','01012345678','운동',1000,to_date('17/10/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('virtue','tkIan0b/mgoIh3nmCQW6KRNk8nxuY5DqGcPZOXbqIT8cRGgrk+DWObpHOZyRdUSoqE7emI5qm1jFcP1XRDc+uQ==','정은택','U','M',to_date('90/02/01','RR/MM/DD'),'virtue@naver.com','01012345678','운동,등산,독서',1000,to_date('17/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('plague','BF97k6YxrfSn9lQIRTfxiEleda+CJ9h77sWAN64ZoivdxifjJf3TZjx38p0sZ69Yyc1LoHap+GD+ktbcpv6HEA==','김정인','U','F',to_date('79/01/03','RR/MM/DD'),'plague@naver.com','01012345678','등산,독서',1000,to_date('17/03/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('light','wNYZCd9Xraf09WkbQW9q5/q0Rxeu4DftcUOoyDo3Oqj1o55qrDt3zbBMPC8s4VDqowPRWeq0rAPCtJ5L4pzPIg==','김보람','U','M',to_date('01/09/02','RR/MM/DD'),'light@naver.com','01098765678','운동,등산,독서',1000,to_date('17/02/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('plasma','b6pEzlzqhdu0acPvuNBY5UvBTS1wpdtHB7JmMzmwLQfrBV9DOpo0zZ6lC6ykoIXfJzB9YNNLKB8WvxGbEA8f6w==','구본승','U','M',to_date('02/04/02','RR/MM/DD'),'plasma@naver.com','01098765678','등산',1000,to_date('17/02/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('nightshade','cnN62U5vPlygBDwhOEA8eI3HgysLjdGXfyZwO0h6662vXRh2br6jZTHdrOwkIvgnO+rqjvR778NgzqoKOrkKIw==','가제현','U','M',to_date('90/10/20','RR/MM/DD'),'nightshade@naver.com','01012345678','운동,독서',1000,to_date('17/01/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('ooze','5yM56lS/VokgDneS3dbrnrgZhggVYrj+3dXI7rxoMECv0vXTGmfy+dztYi/EbC7dFoMn664qlqkSboSH0dGUkQ==','한고은','U','F',to_date('01/06/02','RR/MM/DD'),'ooze@naver.com','01012345678','운동,등산,독서',1000,to_date('17/09/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shift','FzNUpC+bgMKbHDe6Pho7Lr/8RbPA1mIjB3XpU4z7NhVkei9Z7YPNSlShZes998ueSCWcuOeiccBjaDaBSs3bCw==','두고은','U','F',to_date('76/02/20','RR/MM/DD'),'shift@naver.com','01012345678','등산,독서',1000,to_date('17/03/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('luna','KgJ5L9zxqKff6TmUmLQlywpg4ncC1G14qWTvL+1p0Z+L6oczhE+eQCiczYgNIPC8ittG3qt/gTRXcRArf0RAZQ==','세고은','U','F',to_date('02/02/03','RR/MM/DD'),'luna@naver.com','01012345678','운동,등산,독서',1000,to_date('17/09/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('cecirh','k+Dq8SKcHdlFaP0o3sSAP1N6idSE0RSOBoV0SiDo/9REHECkH84bLe75gJ7f7DKZU53Uu+Xp8lKuApr7NXap1Q==','네고은','U','F',to_date('01/04/15','RR/MM/DD'),'cecirh@naver.com','01012345678','운동,등산,독서',1000,to_date('17/04/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('illuminos','7cEpSKkzohHoHMuxf90mP0k866bV+M4yZCFCG/5qdcVyCzBY2V0kL2UPKZmwRs0jJWelB05GhIhxjMycFK8g6Q==','마동탁','U','M',to_date('76/02/02','RR/MM/DD'),'illuminos@naver.com','01012345678','운동,등산,독서',1000,to_date('17/10/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shockwave','YmVlJfOCN/RnEnCBOWiXZLTglYIltI1MuHbbAzB0omLGKg4cdDkN/ee8WUBZaWytQxsWDLRXt0idQciIan0qJw==','아무나','U','M',to_date('83/01/01','RR/MM/DD'),'shockwave@naver.com','01012345678','여행',1000,to_date('17/02/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('thunder','wjdhEygfScLrOpPgT3l95IIzzDpKw20ersevs66jXcy8iWeUAXjeeCGYXybgKxWfeCkBN1gInjl5JfF8e9Zr3g==','애니바디','U','M',to_date('76/09/20','RR/MM/DD'),'thunder@naver.com','01012341234','등산',1000,to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('steelskin','X0aQLwLpQmc1EE9PIYNSS7nrxuVJF7QGP8hCj+CAQ+L/pUkaD73gJm0QnqHbXkyJauZTeBQk07PEVz0Um7dEmA==','김쇠살','U','M',to_date('90/10/01','RR/MM/DD'),'steelskin@naver.com','01040021863',null,1000,to_date('17/04/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('glutton','H6nueB5sLoCxHQTc9M+OM4qmMlgkabp72JkmPsjb2eTBy2IjQdMMbBp5DHEtxOVcX+X2P8YJ2IQALvIGfWl2yA==','감사용','U','M',to_date('83/02/02','RR/MM/DD'),'glutton@naver.com','01012341234','운동,등산',1000,to_date('17/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('puma','A6BU8O9vw/7rciMqu3L6NJYlO0REYkDrubcXctMTQt66NS5VePj2PWs35uEH6me/iualZBgL+gfW/dtvGXl8ww==','하퓨마','U','M',to_date('76/04/03','RR/MM/DD'),'puma@naver.com','01012341234','운동',1000,to_date('17/04/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shadow','ADtBQ9kw3mFL68HRgD0AApTEw7BZtLIy84mVyCmXChdvF8rNcNehDRe4Z2eMI2tm2hIHmBTKfsh1rSD8g1zCHA==','그리무','U','M',to_date('01/10/20','RR/MM/DD'),'shadow@naver.com','01012341234','독서',1000,to_date('17/04/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('bandit','mA4jd9MbRcndLNQUi07cJmgTkRuxoKAdK6K/+0/xUFkfjoKJeraYJM/SoFwgFoSMYPEc+y+YgIj6V+VHE+VeNw==','반디','U','M',to_date('76/02/02','RR/MM/DD'),'bandit@naver.com','01012341234','등산',1000,to_date('17/04/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('pandemonium','Q5F/5MFW7hXK7UtyVvTLqaHPTC5qh8+rgmElJz9cj5PCoPeQWgN9DXGfgz1BhQFROxg57iAPNeQHGRQHJyZ8Aw==','김판돌','U','M',to_date('83/03/03','RR/MM/DD'),'pandemonium@naver.com','01012341234','등산,여행',1000,to_date('17/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('shqkel','EFA6A1h7FJsLknUqKIpOhGxDAlXXXUcsWX1wqSJBXHOtN6uIb3s8Z9dywP9NvRpCr9w1KClvA75byt4vQbG1ZQ==','노바디','U','M',to_date('90/09/02','RR/MM/DD'),'shqkel@naver.com','01012341234','등산',1000,to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('neoneo','jiU6i4j6h0At4NdzVfE1qS3lutbqYzyEbc4fHLpcEuNiJinN79Ojs7PmhaOt5SIt97qrTd6y1l7tdEaDD4guWQ==','네오','U','M',to_date('76/10/02','RR/MM/DD'),'neoneo@naver.com','01040021863',null,1000,to_date('18/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,HOBBY,POINT,ENROLL_DATE) values ('kamsayoyo','tTnRocWQNEHqwgT6yIL1zoeK0gS57IXk0HZL69Bv1a379rWxUxA2kx++7mD2UX5Uqj+dkEXpy0UMDUKUhlDQ5Q==','감사용','U','M',to_date('83/06/20','RR/MM/DD'),'ksy@naver.com','01012341234','운동,등산',1000,to_date('18/04/19','RR/MM/DD'));

--drop table member;

--update
--    member 
--set 
--    password = 'kvOffyqGmDjNUIXm8X/IIQm8+YzWKkfLw3njjegLvAITojzubkoT3myq4K3Yo5AnLW8Ig8J0Mgsf9g28/G3XUA=='
--where
--    member_id = 'admin';

--delete from member where member_id = 'zzzz';

select * from member;
commit;

-- 게시판
create table board (
    no number,
    title varchar2(500) not null,
    writer varchar2(20),
    content varchar2(4000) not null,
    read_count number default 0,
    reg_date date default sysdate,
    constraints pk_board_no primary key(no),
    constraints fk_board_writer foreign key(writer) references member(member_id) on delete set null -- 부모행이 삭제하면 writer -> null
);

create sequence seq_board_no;

select * from board;
create table attachment (
    no number,
    board_no number not null,
    original_filename varchar2(255) not null, -- 실제파일명
    renamed_filename varchar2(255) not null, -- 저장파일명 (영문자/숫자)
    reg_date date default sysdate,
    constraints pk_attachment_no primary key(no),
    constraints fk_attachment_board_no foreign key(board_no) references board(no) on delete cascade
);

create sequence seq_attachment_no;



insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 1','honggd','반갑습니다',to_date('18/02/10','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 2','qwerty','안녕하세요',to_date('18/02/12','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 3','admin','반갑습니다',to_date('18/02/13','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 4','honggd','안녕하세요',to_date('18/02/14','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 5','qwerty','반갑습니다',to_date('18/02/15','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 6','admin','안녕하세요',to_date('18/02/16','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 7','honggd','반갑습니다',to_date('18/02/17','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 8','qwerty','안녕하세요',to_date('18/02/18','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 9','admin','반갑습니다',to_date('18/02/19','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 10','honggd','안녕하세',to_date('18/02/20','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 11','qwerty','반갑습니다',to_date('18/03/11','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 12','admin','안녕하세',to_date('18/03/12','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 13','honggd','반갑습니다',to_date('18/03/13','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 14','qwerty','안녕하세',to_date('18/03/14','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 15','admin','반갑습니다',to_date('18/03/15','RR/MM/DD'),0);


insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 16','honggd','안녕하세',to_date('18/03/16','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 17','qwerty','반갑습니다',to_date('18/03/17','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 18','admin','안녕하세',to_date('18/03/18','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 19','honggd','반갑습니다',to_date('18/03/19','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 20','qwerty','안녕하세',to_date('18/03/20','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 21','admin','반갑습니다',to_date('18/04/01','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 22','honggd','안녕하세',to_date('18/04/02','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 23','qwerty','반갑습니다',to_date('18/04/03','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 24','admin','안녕하세',to_date('18/04/04','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 25','honggd','반갑습니다',to_date('18/04/05','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 26','qwerty','안녕하세',to_date('18/04/06','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 27','admin','반갑습니다',to_date('18/04/07','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 28','honggd','안녕하세',to_date('18/04/08','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 29','qwerty','반갑습니다',to_date('18/04/09','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 30','admin','안녕하세',to_date('18/04/10','RR/MM/DD'),0);

insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 31','honggd','반갑습니다',to_date('18/04/16','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 32','qwerty','안녕하세',to_date('18/04/17','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 33','admin','반갑습니다',to_date('18/04/18','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 34','honggd','안녕하세',to_date('18/04/19','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 35','qwerty','반갑습니다',to_date('18/04/20','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 36','admin','안녕하세',to_date('18/05/01','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 37','honggd','반갑습니다',to_date('18/05/02','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 38','qwerty','안녕하세',to_date('18/05/03','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 39','admin','반갑습니다',to_date('18/05/04','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 40','honggd','안녕하세',to_date('18/05/05','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 41','qwerty','반갑습니다',to_date('18/05/06','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 42','admin','안녕하세',to_date('18/05/07','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 43','honggd','반갑습니다',to_date('18/05/08','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 44','qwerty','안녕하세',to_date('18/05/09','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 45','admin','반갑습니다',to_date('18/05/10','RR/MM/DD'),0);

insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 46','honggd','안녕하세',to_date('18/05/16','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 47','qwerty','반갑습니다',to_date('18/05/17','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 48','admin','안녕하세',to_date('18/05/18','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 49','honggd','반갑습니다',to_date('18/05/19','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 50','qwerty','안녕하세',to_date('18/05/20','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 51','admin','반갑습니다',to_date('18/05/01','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 52','honggd','안녕하세',to_date('18/06/02','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 53','qwerty','반갑습니다',to_date('18/06/03','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 54','admin','안녕하세',to_date('18/06/04','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 55','honggd','반갑습니다',to_date('18/06/05','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 56','qwerty','안녕하세',to_date('18/06/06','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 57','admin','반갑습니다',to_date('18/06/07','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 58','honggd','안녕하세',to_date('18/06/08','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 59','qwerty','반갑습니다',to_date('18/06/09','RR/MM/DD'),0);
insert into web.board (no,title,writer,content,reg_date,read_count) values (seq_board_no.nextval,'안녕하세요, 게시판입니다 - 60','admin','안녕하세',to_date('18/06/10','RR/MM/DD'),0);

insert into web.attachment(no, board_no, original_filename, renamed_filename)
values(seq_attachment_no.nextval, 60, 'test.txt', '20211007_233014432_12345.txt');

commit;

select * from board;
select * from attachment;
select * from member where member_id = 'honggd';

-- 게시글-첨부파일 조회 (외부조인)
select
    *
from
    board b left join attachment a
        on b.no = a.board_no;



select * from board order by no desc;

select
    b.*,
    (select count(*) from attachment where board_no = b.no) attach_cnt
from
    board b
order by 
    b.no desc;
    
--select b.*, (select count(*) from attachment where board_no = b.no) attach_cnt from board b order by b.no desc;


-- 페이징 처리
-- row_number() over()
-- 1페이지 1 ~ 10
-- 2페이지 11 ~ 20
-- 3페이지 21 ~ 30
-- 4페이지 31 ~ 40
-- 5페이지 41 ~ 50
-- 6페이지 51 ~  60

select
    *
from(
    select
        row_number() over(order by b.no desc) rnum,
        b.*,
        (select count(*) from attachment where board_no = b.no) attach_cnt
    from
        board b
) b
where
    rnum between 11 and 20;

--select * from(select row_number() over(order by b.no desc) rnum, b.*, (select count(*) from attachment where board_no = b.no) attach_cnt from board b) b where rnum between 11 and 20;

-- 전체게시물수 구하기
select count(*) from board;

-- 첨부파일 테이블
select * from attachment;

-- 게시글조회
select * from board where no = 60;
-- 게시글번호로 첨부파일 조회
select * from attachment where board_no = 60;


-- 댓글테이블
create table board_comment (
    no number, -- pk
    comment_level number default 1, -- 1. 댓글 2. 대댓글
    writer varchar2(20),
    content varchar2(4000),
    board_no number,                    -- 게시글 fk
    comment_ref number,                     -- null : 댓글인경우  |  board_comment_no 대댓글인 경우
    reg_date date default sysdate,
    constraints pk_board_comment_no primary key(no),
    constraints fk_board_comment_writer foreign key(writer) references member(member_id)
        on delete set null,
    constraints fk_board_comment_board_no foreign key(board_no) references board(no)
        on delete cascade,
    constraints fk_board_comment_ref foreign key(comment_ref) references board_comment(no)
        on delete cascade
);
create sequence seq_board_comment_no;

-- 최신 게시글
select * from board where no = 70;
select * from board_comment where board_no = 70;

-- 댓글 추가
insert into
    board_comment
values(
    seq_board_comment_no.nextval, 1, 'qwerty', '따뜻한 글 잘 읽었습니다.', 70, null, default
);
insert into
    board_comment
values(
    seq_board_comment_no.nextval, 1, 'sejong', '훈훈한 글 잘 읽었습니다.', 70, null, default
);
insert into
    board_comment
values(
    seq_board_comment_no.nextval, 1, 'admin', '주간 게시글로 선정되셨습니다. 축하드립니다.', 70, null, default
);


insert into
    board_comment
values(
    seq_board_comment_no.nextval, 2, 'admin', '주간 게시글로 선정되셨습니다. 축하드립니다.', 70, 1, default
);
insert into
    board_comment
values(
    seq_board_comment_no.nextval, 2, 'opqr', '저도 동감입니다 2222222.', 70, 1, default
);
insert into
    board_comment
values(
    seq_board_comment_no.nextval, 2, 'opqr', '어! 훈민정음 아저씨다!', 70, 2, default
);
--insert into board_comment values(seq_board_comment_no.nextval, ?, ?, ?, ?, ?, default)

-- 계층형쿼리
-- start with, connect by절을 통해 행간의 부모자식관계를 지정
-- 댓글, 대댓글 사이의 연결된 형태로 쿼리를 질의.
select
    *
from
    board_comment
where
    board_no = 70
start with
    comment_level = 1
connect by
    prior no = comment_ref
order siblings by
    no;

--select * from board_comment start with comment_level = 1 connect by prior no = comment_ref order siblings by no;

select
    *
from(
    select
        row_number() over(order by b.no desc) rnum,
        b.*,
        (select count(*) from attachment where board_no = b.no) attach_cnt,
        (select count(*) from board_comment where board_no = b.no) comment_cnt
    from
        board b
) b
where
    rnum between 11 and 20;



--======================================================
-- 사진게시판 관련
--======================================================
create table photo (
    no number,
    writer varchar2(15),
    content varchar2(4000),
    original_filename varchar2(100),
    renamed_filename varchar2(100),
    read_count number default 0,
    reg_date date default sysdate,
    constraints pk_photo_no primary key(no),
    constraints fk_photo_writer foreign key(writer) references member(member_id)
);

create sequence seq_photo_no;



Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','하와이 가는 하늘길~','adult-adventure-aircraft-443430.jpg','20220418_174158873_108.jpg',107,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','프랑스산 와인 시음회 :)','adult-alcohol-blur-290316.jpg','20220418_174412447_349.jpg',18,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','adventure-albay-clouds-672358.jpg','20220418_174453770_556.jpg',99,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','airplane-apartment-architecture-364245.jpg','20220418_174505657_4.jpg',12,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','america-architecture-billboards-461903.jpg','20220418_174516697_101.jpg',192,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','ancient-architecture-building-415980.jpg','20220418_174527327_327.jpg',82,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','arch-architecture-art-332208.jpg','20220418_174539548_250.jpg',73,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','자나깨나 차조심, 트램조심','architecture-avenue-blur-258447.jpg','20220418_174601509_281.jpg',103,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','architecture-background-buildings-698604.jpg','20220418_174616171_833.jpg',102,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','architecture-barcelona-blue-sky-819764.jpg','20220418_174652399_241.jpg',107, to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','architecture-basilica-buildings-326709.jpg','20220418_174743637_226.jpg',88,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','architecture-building-door-206767.jpg','20220418_174800692_837.jpg',234,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','atmosphere-beautiful-cloudburst-531318.jpg','20220418_174814411_4.jpg',81,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','이과수이과수','back-beach-beautiful-670060.jpg','20220418_174839106_197.jpg',77,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','bicycle-tour-bicycles-bicyclists-17729.jpg','20220418_174856071_779.jpg',222,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','billboard-business-city-733778.jpg','20220418_174910053_722.jpg',204,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','black-clouds-dark-420885.jpg','20220418_174924429_849.jpg',103,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','boulders-clouds-daylight-464440.jpg','20220418_174941759_108.jpg',47,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','여행은 즐거워','capital-cathedral-city-6502.jpg','20220418_174957191_842.jpg',52,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'abcd','퐈이아아아아아','evening-fair-fire-65297.jpg','20220418_175019576_86.jpg',45,to_date('18-04-22','DD-MM-RR'));
Insert into WEB.PHOTO (NO,WRITER,CONTENT,ORIGINAL_FILENAME,RENAMED_FILENAME,READ_COUNT,REG_DATE) values (SEQ_PHOTO_NO.NEXTVAL,'wxyz','소나무야','375px-Pinus_densiflora_Kumgangsan.jpg','20220418_125936088_36.jpg',23,to_date('18-04-22','DD-MM-RR'));

commit;

select * from photo;

select
    *
from (
select
    row_number() over(order by no desc) rnum,
    p.*
from
    photo p
)
where
    rnum between 6 and 10;

-- select * from (select row_number() over(order by no desc) rnum, p.* from photo p) where rnum between 6 and 10;


