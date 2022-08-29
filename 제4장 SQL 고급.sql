#날짜: 2022/08/25
#이름: 이원정
#내용: 제4장 SQL 고급

#실습 4-1
create table `Member`(
		`uid` varchar(10) primary key,
        `name` varchar(10) not null,
        `hp` char(13) not null,
        `pos` varchar(10) default '사원',
        `dep` tinyint,
        `rdate` datetime not null
);
create table `Department`(
	`depNo` tinyint primary key,
    `name` varchar(10) not null,
    `tel` varchar(12) not null
);
create table `Sales`(
	`seq` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` int not null,
    `sale` int not null
);

#실습 4-2

insert into `Member` values ('a101','박혁거세','010-1234-1001','부장','101',now());
insert into `Member` values ('a102','김유신','010-1234-1002','차장','101',now());
insert into `Member` values ('a103','김춘추','010-1234-1003','사원','101',now());
insert into `Member` values ('a104','장보고','010-1234-1004','대리','102',now());
insert into `Member` values ('a105','강감찬','010-1234-1005','과장','102',now());
insert into `Member` values ('a106','이성계','010-1234-1006','차장','103',now());
insert into `Member` values ('a107','정철','010-1234-1007','차장','103',now());
insert into `Member` values ('a108','이순신','010-1234-1008','부장','104',now());
insert into `Member` values ('a109','허균','010-1234-1009','부장','104',now());
insert into `Member` values ('a110','정약용','010-1234-1010','사원','101',now());
insert into `Member` values ('a111','박지원','010-1234-1011','사원','101',now());

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');


#실습 4-3
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos` = '사원' or `pos`='대리';
select * from `Member` where `pos` in ('사원','대리');
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale` between 500000 and 100000;

#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` asc;
select * from `Sales` order by `sale` desc;
select * from `Member` order by `name`;
select * from `Member` order by `name` desc;
select * from `Member` order by `name` asc;
select * from `Sales` 
where `sale` > 50000 
order by `year`, `month`, `sale` desc;


#실습 4-5
select * from `Sales` limit 3;
select * from `Sales` limit 0,3;
select * from `Sales` limit 1,2;
select * from `Sales` limit 5,3;
select * from `Sales` order by `sale` desc limit 3,5;
select * from `Sales` where `sale` < 50000 order by `sale` desc limit 3;
select * from `Sales` 
where `sale` > 50000
order by `year` desc, `month`,`sale` desc
limit 5;

#실습 4-6
select * from `Sales`;
select sum(`sale`) from `Sales`;
select sum(`sale`) as `매출 총합` from `Sales`;
select count(*) as `개수` from `Sales`;
select count(`seq`) as `개수` from `Sales`;
select substring(`hp`, 10,4) as `휴대폰 끝자리`from `Member`;
insert into `Member` values ('b101','을지문덕','010-5555-1234','사장','107',now());

#실습 4-7
select sum(`sale`) as `2018년 1월 매출총합` from `Sales` where `year`=2018 and `month`=1;

#실습 4-8
select sum (`sale`) as `매출 총합` from `Sales` where `year`;
select 
	sum (`sale`) as `총합`,	
    avg (`sale`) as `평균`
from `Sales` where `year`=2 and `month`=2 and `sale` >= 50000;

#실습 4-9
select
min(`sale`) as `최저`,
max(`sale`) as `최고`
from `Sales` where `year` = 2020;

#실습 4-10
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`,`year`;
select `uid`, count(*) as`건수` from `Sales` group by `uid`;
select `uid`, SUM(sale) as `합계` from `Sales` group by `uid`;
select `uid`, AVG(sale) as `평균` from `Sales` group by `uid`;

select
	`uid`,
    `year`,
    SUM(`sale`) as 합계
from `Sales` 
where `sale` >= 50000
group by `uid`,`year`
order by `합계` desc;

#실습 4-11

select `uid`, sum(`sale`) as `합계` from `Sales`
group by `uid`
having `합계` >= 200000;

select `uid`,`year`, sum(sale) as `합계`
from `Sales`
where `sale` >= 100000
group by `uid`,`year`
having `합계` >= 200000
order by `합계` desc;

#실습 4-12

create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
update `Sales2` set `year` = `year` +3;

select * from `Sales` union select * from `Sales2`;
(select * from `Sales`) union (select * from `Sales2`);
select `uid`,`year`,`sale` from `Sales`
union
select `uid`,`year`,`sale` from `Sales2` ;
select `uid`,`year`, sum(sale) as `합계`
from `Sales`
group by `uid`,`year`
union
select `uid`,`year`,sum(sale) as `합계`
from `Sales2`
group by `uid`,`year`
order by `year` asc, `합계` desc;

#실습 4-13 제일 중요한 join

select * from `Sales` inner join `Member` on `Sales`.uid = `Member`.uid;
select * from `Member` inner join `Department` on `Member`.dep = `Department`.depNo;

select * from `Sales` as a join `Member` as b on a.uid = b.uid;
select * from `Member` as a join `Department` as b on a.dep = b.uid;

select * from `Sales` as a, `Member` where a.uid = b.uid;
select * from `Member` as a, `Department` as b where a.dep = b.depNo;

select a.`seq`, a.`uid`, `sale`, `name`,`pos` from `Sales` as a 
join `Member` as b on a.`uid` = b.`uid`;
select a.`seq`, a.`uid`, `sale`, `name`,`pos` from `Sales` as a 
join `Member` as b using(`uid`);

select a.`seq`, a.`uid`, `sale`, `name`,`pos` from `Sales` as a 
join `Member` as b on a.`uid` = b.`uid`
where `sale` >= 100000;

select * from `Sales` as a
join `Member` as b on a.uid = b.uid
join `Department` as c on b.dep = c.depNo;


#실습 4-14

select * from `Sales` as a 
right join `Member` as b
on a.uid = b.uid;

#실습 4-15
select 
	`uid`,
    a.`name`,
    `pos`,
    b.`name`
from `Member` as a
join `Department` as b
on a.dep = b.depNo;
    
#실습 4-16
select sum(`sale`) as `2019 매출합`
from `Sales` as a
join `Member` as b
on a.uid = b.uid
where `name` = '김유신' and `year` = '2019';


#실습 4-17
select 
	b.`name`,
    c.`name`,
    b.`pos`,
    a.`year`,
	sum(`sale`) as `매출합`
from `Sales` as a
join `Member` b on a.uid = b.uid
join `Department` c on b.dep = c.depNo
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
having `매출합` >= 100000
order by `매출합` desc;




#실습 4-18