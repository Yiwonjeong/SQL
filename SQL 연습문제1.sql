# 날짜: 2022/08/29
# 이름: 이원정
# 내용: SQL 연습문제1

# 실습 1-1 실습 데이터 베이스와 사용자 생성
create database `java_shop`;
create user 'java_admin1'@'%' identified by '1234';
grant all privileges on shop.*to 'java_admin1'@'%';
flush privileges;

# 실습 1-2 테이블 생성
create table `Customer` (
	`custid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` varchar(13) default null,
    `addr` varchar(100) default null,
    `rdate` date
);
create table `Product`(
	`prodNo` int auto_increment primary key,
    `prodName` varchar(10) not null,
    `stock` int default 0,
    `price` int default null,
    `company` varchar(20) not null
);
create table `Order`(
	`orderNo` int auto_increment primary key,
    `orderid` varchar(10) not null,
    `orderProduct` int not null,
    `orderCount` int default 1,
    `orderDate` date not null
);

# 실습 1-3 테이블에 데이터 입력
insert into `Customer` values ('c101','김유신','010-1234-1001','김해시 붕황동','2022-01-01');
insert into `Customer` values ('c102','김춘추','010-1234-1002','경주시 보문동','2022-01-02');
insert into `Customer` values ('c103','장보고','010-1234-1003','완도군 청산면','2022-01-03');
insert into `Customer` values ('c104','강감찬','010-1234-1004','서울시 마포구','2022-01-04');
insert into `Customer` values ('c105','이성계',null,null,'2022-01-05');
insert into `Customer` values ('c106','정철','010-1234-1006','경기도 용인시','2022-01-06');
insert into `Customer` values ('c107','허준',null,null,'2022-01-01');
insert into `Customer` values ('c108','이순신','010-1234-1008','서울시 영등포구','2022-01-07');
insert into `Customer` values ('c109','송상현','010-1234-1009','부산시 동래구','2022-01-08');
insert into `Customer` values ('c110','정약용','010-1234-1010','경기도 광주시','2022-01-10');

insert into `Product` values(1,'새우깡','5000','1500','농심');
insert into `Product` values(2,'초코파이','2500','2500','오리온');
insert into `Product` values(3,'포카칩','3600','1700','오리온');
insert into `Product` values(4,'양파링','1250','1800','농심');
insert into `Product` values(5,'죠리퐁','2200',null,'크라운');
insert into `Product` values(6,'마카렛트','3500','3500','롯데');
insert into `Product` values(7,'뿌셔뿌셔','1200','1200','오뚜기');

insert into `Order` value ('1','c102','3','2',now());
insert into `Order` value ('2','c101','4','1',now());
insert into `Order` value ('3','c108','1','1',now());
insert into `Order` value ('4','c109','6','5',now());
insert into `Order` value ('5','c102','2','1',now());
insert into `Order` value ('6','c101','7','3',now());
insert into `Order` value ('7','c110','1','2',now());
insert into `Order` value ('8','c104','2','4',now());
insert into `Order` value ('9','c102','1','3',now());
insert into `Order` value ('10','c107','6','1',now());

# 실습 1-4 모든 속성 조회
select * from `Customer`;

# 실습 1-5 선택 조회
select `custid`,`name`,`hp` from `Customer`;

# 실습 1-6 
select * from `Product`;

# 실습 1-7
select `company` from `Product`;

# 실습 1-8 중복없이 조회
select distinct `company` from `Product`;

# 실습 1-9 제품 테이블에서 제품명과 단가 조회
select `prodName`,`price` from `Product`;

# 실습 1-10 단가에 500원 더한 조정단가로 출력
select `prodName`, `price`+500 from `Product`;

# 실습 1-11 
select `prodName`,`stock`,`price` from `Product`;

# 실습 1-12
select `orderProduct`,`orderCount`,`orderDate` from `Order`
where `orderid`='c102';

# 실습 1-13
select `orderProduct`,`orderCount`,`orderDate` from `Order`
where `orderid`='c102' and `orderCount` >= '2';

# 실습 1-14
select * from `Product`
where `price`>='1000' and `price`<='2000';

# 실습 1-15 성이 김씨인 고객 조회
select `custid`,`name`,`hp`,`addr` from `Customer`
where `name` like '김%';

# 실습 1-16 고객 이름 두 자 조회
select `custid`,`name`,`hp`,`addr` from `Customer`
where `name` like '__';

# 실습 1-17 공백 조회
select * from `Customer` 
where `hp` is null;

# 실습 1-18 주소가 입력된 고객 조회
select * from `Customer`
where `addr` is not null;

# 실습 1-19 내림차순
select * from `Customer` order by `rdate` desc;

# 실습 1-20 
select * from `Order`
where `orderCount` >= 3
order by `orderCount`desc, `orderProduct` asc; 

# 실습 1-21 평균
select avg(price) from `Product`;

# 실습 1-22 합계
select sum(stock) as `재고량 합계`
from `Product`
where `company`='농심';

# 실습 1-23 
select count(`name`) as `고객 수`
from `Customer`;

# 실습 1-24 중복없이 종류 수 카운트
select count(distinct `company`) as `제조업체 수`
from `Product`;


# 실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량`
from `Order` 
group by `orderProduct`
order by `주문 상품번호` asc;

# 실습 1-26
select `company` as `제조업체`,
count(*) as `제품수`, max(`price`) as `최고가`
from `Product`
group by `company`;

# 실습 1-27
select `company` as `제조업체`,
count(*) as `제품수`, max(`price`) as `최고가`
from `Product`
group by `company`
having  `제품수` >=2;

# 실습 1-28
select `orderProduct`, `orderid`, sum(`orderCount`) as `총 주문수량` 
from `Order`
group by `orderNo`;

# 실습 1-29
select a.orderid, b.prodName
from `Order` as a 
join `Product` as b
on a.orderProduct = b.prodNo
where `orderid` = 'c102';

# 실습 1-30
select `orderid`, `name`, `prodName`, `orderDate` 
from `Order` as a
join `Customer` as b
on a.orderid = b.custid
join `Product` as c
on a. orderProduct = c.prodNo
where `orderDate` = '2022-08-29';