# 날짜: 2022/09/01
# 이름: 이원정
# 내용: SQL 연습문제 4

# 실습 4-1
create database `java2_Bookstore`;
create user 'java2_admin4'@'%' identified by '1234';
grant all privileges on `java2_Bookstore`.* to 'java2_admin4'@'%';

# 실습 4-2
create table `Customer`(
	`custid` int primary key,
    `name` char(10) not null,
    `address` char(20),
    `phone` char(13)
);
create table `Book`(
	`bookid` int primary key,
    `bookName` char(20) not null,
    `publisher` char(20) not null,
    `price` int
);
create table `Order`(
	`orderid` int auto_increment primary key,
    `custid` int not null,
    `bookid` int not null,
    `salePrice` int not null,
    `orderDate` date
);

# 실습 4-3
insert into `Customer` values (1,'박지성','영국 맨체스타','000-5000-0001');
insert into `Customer` values (2,'김연아','대한민국 서울','000-6000-0001');
insert into `Customer` values (3,'장미란','대한민국 강원도','000-7000-0001');
insert into `Customer` values (4,'추신수','미국 클리블랜드','000-8000-0001');
insert into `Customer` values (5,'박세리','대한민국 대전',null);

insert into `Book` values (1,'축구의 역사','굿스포츠',7000);
insert into `Book` values (2,'축구 아는 여자','나무수',13000);
insert into `Book` values (3,'축구의 이해','대한미디어',22000);
insert into `Book` values (4,'골프 바이블','대한미디어',35000);
insert into `Book` values (5,'피겨 교본','굿스포츠',8000);
insert into `Book` values (6,'역도 단계별 기술','굿스포츠',6000);
insert into `Book` values (7,'야구의 추억','이상미디어',20000);
insert into `Book` values (8,'야구를 부탁해','이상미디어',13000);
insert into `Book` values (9,'올림픽 이야기','삼성당',7500);
insert into `Book` values (10,'Olympic Champions','Pearson',13000);

insert into `Order` values (1,1,1,6000,'2014-07-01');
insert into `Order` values (2,1,3,21000,'2014-07-03');
insert into `Order` values (3,2,5,8000,'2014-07-03');
insert into `Order` values (4,3,6,6000,'2014-07-04');
insert into `Order` values (5,4,7,20000,'2014-07-05');
insert into `Order` values (6,1,2,12000,'2014-07-07');
insert into `Order` values (7,4,8,13000,'2014-07-07');
insert into `Order` values (8,3,10,12000,'2014-07-08');
insert into `Order` values (9,2,10,7000,'2014-07-09');
insert into `Order` values (10,3,8,13000,'2014-07-10');

# 실습 4-4
select `custid`,`name`,`address`
from `Customer`;

# 실습 4-5
select `bookname`,`price`
from `Book`;

# 실습 4-6
select `price`,`bookname`
from `Book`;

# 실습 4-7
select `bookid`,`bookName`,`publisher`,`price`
from `Book`;

# 실습 4-8
select `publisher` from `Book`;

# 실습 4-9
select distinct `publisher` from `Book`;

# 실습 4-10
select * from `Book`
where `price` >= 20000;

# 실습 4-11
select * from `Book`
where `price` < 20000;

# 실습 4-12
select * from `Book`
where `price` >= 10000 and `price` <= 20000;

# 실습 4-13
select `bookid`,`bookName`,`price`
from `Book`
where `price` >= 15000 and `price` <= 30000;

# 실습 4-14
select * from `Book`
where `bookid` =2 or `bookid`=3 or `bookid` =5;

select * from `Book`
where `bookid` in(2,3,5);

# 실습 4-15
select * from `Book`
where mod(`bookid`,2)=0;

select * from `Book`
where `bookid` % 2 = 0;

# 실습 4-16
select * from `Customer`
where `name` like '박%';

# 실습 4-17
select * from `Customer`
where `address` like '대한민국%';

# 실습 4-18
select * from `Customer`
where `phone` is not null;

# 실습 4-19
select * from `Book`
where `publisher`='굿스포츠' and `publisher`='대한미디어';

# 실습 4-20
select `publisher`
from `Book`
where `bookName`= '축구의 역사';

# 실습 4-21
select * from `Book`
where `bookName` like '축구%';

# 실습 4-22
select * from `Book`
where `bookName` like '_구%';

# 실습 4-23
select * from `Book`
where `price` >= 20000;

# 실습 4-24
select * from `Book`
order by `bookName`;

# 실습 4-25
select * from `Book`
order by `price` asc, `bookName`;

# 실습 4-26
select * from `Book`
order by `price` desc, `publisher`;

# 실습 4-27
select * from `Book`
order by `price` desc
limit 3;

# 실습 4-28
select * from `Book`
order by `price` asc
limit 3;

# 실습 4-29
select 
	sum(`price`) as `총판매액`
from `Book`;

# 실습 4-30 
select 
	sum(`salePrice`) as `총판매액`,
    avg(`salePrice`) as `평균값`,
    min(`salePrice`) as `최저가`,
    max(`salePrice`) as `최고가`
from `Order`;

# 실습 4-31
select count(`orderid`)
from `Order`;

# 실습 4-32 변경
select 
	`bookid`,
    replace (`bookName`, '야구','농구') as `bookName`,
    `publisher`,
    `price`
from `Book`;

# 실습 4-33 
select `custid`, count(*) as `수량`
from `Order`
group by `custid`
having `수량` >=2;

# 실습 4-34
select * 
from `Customer` as a
join `Order` as b
on a.custid = b.custid;

# 실습 4-35
select * from `Customer` as a
join `Order` as b on a.custid = b.custid
order by a.`custid`;

# 실습 4-36
select `name`, `salePrice`
from `Customer` as a
join `Order` as b on a.custid = b.custid;

# 실습 4-37
select `name`, sum(salePrice)
from `Customer` as a
join `Order` as b on a.custid = b.custid
group by `name`;

# 실습 4-38
select `name`, `bookName`
from `Customer` as a
join `Order` as b on a.custid = b.custid
join `Book` as c on b.bookid = c.bookid;

# 실습 4-39
select `name`, `bookname`
from `Customer` as a
join `Order` as b on a.custid = b.custid
join `Book` as c on b.bookid = c.bookid
where `price` >= 20000;

# 실습 4-40
select `name`,`salePrice`
from `Customer` as a
left join `Order` as b
on a.custid = b.custid;

# 실습 4-41
select `bookName` from `Book`
order by `price` desc
limit 1;

select `bookName` from `Book`
where `price`=(select max(`price`) from `Book`);

# 실습 4-42
select `name` from `Customer` where `name` not in(select `name` from `Customer` where `custid` in(select distinct `custid` from `Order`));

# 실습 4-43
select sum(`salePrice`) as `총판매액` from `Order` where `custid` in(select `custid` from `Customer` where `name`='김연아');

# 실습 4-44
insert into `Book` values (11,'스포츠 의학','한솔의학서적',null);

# 실습 4-45
update `Customer` set `address`='대한민국 부산' where `custid`=5;

# 실습 4-46
delete from `Customer` where `custid` = 5;








