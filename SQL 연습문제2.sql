# 날짜: 2022/08/30
# 이름: 이원정
# 내용: SQL 연습문제2

# 실습 2-1 실습 데이터 베이스와 사용자 생성
create database `java2_Bank`;
create user `java2_admin2`@`%` identified by '1234';
grant all privileges on `java2_Bank`.*to `java2_admin2`@`%`;
flush privileges; 

# 실습 2-2 테이블 생성
create table `bank_customer`(
	`c_no` char(14) primary key,
    `c_name` varchar(20) not null,
    `c_dist` int not null default 0,
    `c_phone` varchar(20) unique not null,
    `c_addr` varchar(100)
);
create table `bank_account`(
	`a_no` varchar(11) primary key default '000-00-0000',
    `a_item_dist` varchar(2) not null,
    `a_item_name` varchar(20) not null,
    `a_c_no` varchar(14) not null,
    `a_balance` int not null default 0,
    `a_open_date` date not null
);
create table `bank_transaction`(
	`t_no`  int auto_increment primary key,
    `t_a_no` varchar(11) not null,
    `t_dist` int not null,
    `t_amount` int not null default 0,
    `t_datetime` datetime not null
);

# 실습 2-3 데이터 입력
insert into `bank_customer` values ('102-22-51094','부산의원',2,'051-518-1010','부산시 남구');
insert into `bank_customer` values ('220-82-52237','(주)한국전산',2,'02-134-1045','서울시 강남구');
insert into `bank_customer` values ('361-22-42687','(주)정보산업',2,'031-563-1253','경기도 광명시');
insert into `bank_customer` values ('730423-1000001','김유신',1,'010-1234-1001','경기도 수원시');
insert into `bank_customer` values ('750210-1000002','김춘추',1,'010-1234-1002','경기도 광주시');
insert into `bank_customer` values ('830513-2000003','선덕여왕',1,'010-1234-1003','서울시 마포구');
insert into `bank_customer` values ('870830-1000004','강감찬',1,'010-1234-1004','서울시 영등포구');
insert into `bank_customer` values ('910912-2000005','신사임당',1,'010-1234-1005','강원도 강릉시');
insert into `bank_customer` values ('941127-1000006','이순신',1,'010-1234-1006','부산시 영도구');

insert into `bank_account` values ('101-11-1001','S1','자유저축예금','730423-1000001',420000,'2005-07-21');
insert into `bank_account` values ('101-11-1003','S1','자유저축예금','870830-1000004',53000,'2005-07-21');
insert into `bank_account` values ('101-11-2001','S1','자유저축예금','220-82-52237',23000000,'2005-07-21');
insert into `bank_account` values ('101-11-2002','S1','자유저축예금','361-22-42687',4201000,'2005-07-21');
insert into `bank_account` values ('101-11-2003','S1','자유저축예금','101-22-51094',8325010,'2005-07-21');
insert into `bank_account` values ('101-12-1002','S2','정기적립예금','830513-2000003',1020000,'2005-07-21');
insert into `bank_account` values ('101-13-1005','S3','주택청약예금','941127-1000006',720800,'2005-07-21');
insert into `bank_account` values ('101-21-1004','L1','고객신용대출','910912-2000005',1200500,'2005-07-21');
insert into `bank_account` values ('101-22-1006','L2','예금담보대출','730423-1000001',25000,'2005-07-21');
insert into `bank_account` values ('101-23-1007','L3','주택담보대출','750210-1000002',2700000,'2005-07-21');

insert into `bank_transaction` values (1,'101-11-1001',1,'50000',now());
insert into `bank_transaction` values (2,'101-11-1003',2,'120000',now());
insert into `bank_transaction` values (3,'101-11-2001',2,'300000',now());
insert into `bank_transaction` values (4,'101-12-1002',1,'1000000',now());
insert into `bank_transaction` values (5,'101-11-1001',3,'0',now());
insert into `bank_transaction` values (6,'101-13-1005',1,'200000',now());
insert into `bank_transaction` values (7,'101-11-1001',1,'450000',now());
insert into `bank_transaction` values (8,'101-11-2002',2,'32000',now());
insert into `bank_transaction` values (9,'101-11-2003',3,'0',now());
insert into `bank_transaction` values (10,'101-11-1003',1,'75000',now());

# 실습 2-4 모든 계좌 조회
select * from `bank_account`;

# 실습 2-5 모든 고객 조회
select * from `bank_customer`;

# 실습 2-6 모든 거래내역 조회
select * from `bank_transaction`;

# 실습 2-7 고객의 이름과 계좌번호 조회
select `c_name`,`c_no` from `bank_customer`;

# 실습 2-8 모든 계좌의 구분 번호와 계좌 상품 이름 조회
select `a_item_dist`,`a_item_name` from `bank_account`;

# 실습 2-9 중복 제거
select distinct `a_item_dist`,`a_item_name` from `bank_account`;

# 실습 2-10 잔고 100만원 이상 조회
select * from `bank_account`
where `a_balance` >= 1000000 and `a_item_name` = '자유저축예금';

# 실습 2-11 경기도 거주 고객 조회
select * from `bank_customer`
where `c_addr` like '경기도 %';

# 실습 2-12 기업고객 조회
select * from `bank_customer`
where `c_dist` = 2;

# 실습 2-13 거래내역 중 입금만 조회
select * from `bank_transaction`
where `t_dist` = 1; 

# 실습 2-14 출금액 큰 순서로 조회
select * from `bank_transaction`
where `t_dist` = 2
order by `t_amount` desc;

# 실습 2-15 입금액의 총합과 평균 구하기
select 
	sum(t_amount) as `입금총합`,
    avg(t_amount) as `입금평균`
from `bank_transaction`
where `t_dist` = 1;

# 실습 2-16 출금액의 가장 큰 금액과 가장 작은 금액 구하기
select max(t_amount) as `큰 금액`, min(t_amount) as `작은 금액`
from `bank_transaction`
where `t_dist` = 2;

# 실습 2-17 자유저축 예금계좌에서 큰 잔고액 순 조회
select * from `bank_account`
where `a_item_name` = '자유저축예금'
order by `a_balance` desc;

# 실습 2-18 가장 많은 잔고를 보유한 자유저축 예금계좌 조회
select * from `bank_account`
where `a_item_name` = '자유저축예금'
order by `a_balance` desc
limit 1;

# 실습 2-19 거래 내역에서 입금액과 출금액이 각각 큰 순서로 조회
select * from `bank_transaction`
where (`t_dist` = 1) or (`t_dist` = 2)
order by `t_dist`asc, `t_amount` desc;

# 실습 2-19 거래 내역에서 입금액과 출금액이 각각 큰 순서로 조회 (추가 선생님)
select * from `bank_transaction`
where `t_dist` <> 3
order by `t_dist` asc, `t_amount` desc;

# 실습 2-20 건수 조회
# case when 함수: case when 조건1 then 반환값 1 ... else 반환값 end
select count(case when `t_dist`=1 then 1 end) as `입금 건수`,
	   count(case when `t_dist`=2 then 2 end) as `출금 건수`,
	   count(case when `t_dist`=3 then 3 end) as `조회 건수`
from `bank_transaction`;

# 실습 2-20 건수 조회 (추가 선생님)
select
	count(if(`t_dist`=1,1,null)) as `입금 건수`,
	count(if(`t_dist`=2,1,null)) as `출금 건수`,
	count(if(`t_dist`=3,1,null)) as `조회 건수`
from `bank_transaction`;

# 실습 2-21 대출 관련 계좌 구분번호 모두 조회하기
select `t_dist`, 
	case 
		when (`t_dist`=1) then '입금'
		when (`t_dist`=2) then '출금'
        when (`t_dist`=3) then '조회'
	end as 'type',
    `t_a_no`,
    `t_amount`
from `bank_transaction`;

# 실습 2-22 거래별 카운트 조회
select `t_dist`, count(`t_no`)
from `bank_transaction`
group by `t_dist`;

# 실습 2-23 입금 거래만 계좌별로 합계를 조회
select `t_a_no`, `t_dist`, sum(`t_amount`) 
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no`;

# 실습 2-24 23+10만원 이상만 큰 순서 조회
select `t_a_no`, `t_dist`, sum(`t_amount`) as `합계`
from `bank_transaction`
where `t_dist` = 1
group by `t_a_no`
having `합계` >= 100000
order by `합계` desc;

# 실습 2-25 계좌 테이블과 고객 테이블 결합
select * from 
`bank_account` as a
join `bank_customer` as b 
on a.a_c_no = b.c_no;

# 실습 2-26 결합 조회
select 
	`a_no` as `계좌번호`,
    `a_item_name` as `계좌이름`,
    `a_c_no` as `주민번호(사업자번호)`,
    `c_name` as `고객명`,
    `a_balance` as `현재잔액`
    from `bank_account` as a
    join `bank_customer` as b
    on a.a_c_no = b.c_no;

# 실습 2-27 거래테이블 계좌 테이블 결합
select * from 
`bank_transaction` as a
join `bank_account` as b
on a.t_a_no = b.a_no;

# 실습 2-28 조회
select 
	`t_no` as `거래번호`,
    `t_a_no` as `계좌번호`,
    `a_c_no` as `고객번호`,
    `t_dist` as `거래구분`,
    `t_amount` as `거래금액`,
    `t_datetime` as `거래일자`
from `bank_account` as a
join `bank_transaction` as b
on a.a_no = b.t_a_no;

# 실습 2-29 
select 
	`t_no`,`a_no`,`c_no`,`t_dist`,`a_item_name`,`c_name`,`t_amount`,`t_datetime`
from `bank_account` as a
join `bank_customer` as b
on a.a_c_no = b.c_no
join `bank_transaction` as c
on a.a_no = c.t_a_no
where `t_dist` = 1
order by `t_amount` desc;

# 실습 2-30, group by는 웬만하면 pk
select
	`t_no`,`a_no`,`c_no`,`t_dist`,`a_item_name`,`c_name`,
    count(`c_no`) as `거래건수`
from `bank_transaction` as a
join `bank_account` as b
on a.t_a_no = b.a_no
join `bank_customer` as c
on b.a_c_no = c.c_no
where `t_dist` in(1,2) and `c_dist` = 1
group by `t_no`
order by `t_dist`, `거래건수` desc;

