## 兼职信息

rails g scaffold jz/user code:string name:string phone:string alipay:string rate:integer remark:string this_month_num:integer
rails db:migrate 

rails g scaffold jz/record user_id:integer enter_at:datetime is_first:boolean computer_num:integer remark:string
rails db:migrate 
rails d scaffold jz/record

rails g scaffold jz/sx user_id:integer name:string start_at:datetime end_at:datetime
rails db:migrate 






## 淘宝MM 

rails d scaffold mm/user 
rails g scaffold mm/user name:string 

rails g scaffold  mm/photos album_id:integer name:string url:string kind:integer 

rails g scaffold  mm/albums user_id:integer name:string total:float kind:integer 



## mysql 处理数据记录

```
create table mm_album as select * from mm_albums where id = 9388666 limit 1;

insert into mm_album select * from mm_albums where id = ;


select id from mm_albums group by id;





SELECT
  id, count(*)
FROM mm_albums
WHERE id IN (SELECT
    id
  FROM mm_albums
  GROUP BY id
  HAVING COUNT(id) > 1) group by id;
  
  
  

SELECT
  *
FROM mm_users
WHERE id IN (SELECT
    id
  FROM mm_users
  GROUP BY id
  HAVING COUNT(id) > 1);
  
  
  
  
  

INSERT INTO `mm_users` (`id`, `name`)
VALUES
	(320542634, '梅梅'),
	(355865760, 'mina模特'),
	(458126334, '周紫钰');




ALTER TABLE mm_albums ADD PRIMARY KEY(id);




create table mm_album as select * from mm_albums where id = 9388666 limit 1;




id	count(*)


 重复数据解决办法， 1. 创建临时表存数据，将数据全部插入临时表 2. 删除重复数据， 3.再将临时表数据写入

create table mm_album as select * from mm_albums where id = 9388666 limit 1; into mm_album select * from mm_albums where id = 9388667 limit 1;
insert into mm_album select * from mm_albums where id = 11747336 limit 1;
insert into mm_album select * from mm_albums where id = 10000652059 limit 1;



delete from `mm_albums` where id in (9388666, 9388667, 11747336, 26628976, 26952809, 56075542, 58887513, 60326846, 88621548, 98141089, 100034746, 100034747, 101918455, 103487062, 107185484, 111570521, 116668387, 128916474, 129238445, 130174656, 131040094, 142602797, 144543275, 180131049, 180140628, 183236545, 184660834, 192753440, 195973209, 208563754, 211818020, 215212801, 217745807, 220706564, 222970214, 225087781, 225188106, 225274893, 300435191, 300745219, 301350175, 10000652059);


INSERT INTO `mm_album` (`id`, `user_id`, `name`, `created_at`, `kind`, `total`)
VALUES
	(9388666, 320542634, '头像相册', '2012-02-07', 1, 26),
	(9388667, 320542634, '贴图相册', '2012-02-07', 1, 282),
	(300745219, 281220131, '大头照!!', '2012-08-19', 1, 10),
	(301350175, 79136101, '蔷薇绽放复古妆+颈', '2013-07-16', 1, 15),
	(10000652059, 69110554, '敏恩-韩国官网', '2015-10-25', 1, 12);







select DISTINCT * from mm_photos where album_id = 9388666;

9388666


create table mm_photo 
insert into mm_photo  as  select DISTINCT * from mm_photos where album_id in (9388666, 9388667, 11747336, 26628976, 26952809, 56075542, 58887513, 60326846, 88621548, 98141089, 100034746, 100034747, 101918455, 103487062, 107185484, 111570521, 116668387, 128916474, 129238445, 130174656, 131040094, 142602797, 144543275, 180131049, 180140628, 183236545, 184660834, 192753440, 195973209, 208563754, 211818020, 215212801, 217745807, 220706564, 222970214, 225087781, 225188106, 225274893, 300435191, 300745219, 301350175, 10000652059);

update mm_photos set id=(SELECT @rownum:=@rownum+1 rownum From (SELECT @rownum:=0,mm_photos.* FROM `mm_photos` limit 1) t);

```
