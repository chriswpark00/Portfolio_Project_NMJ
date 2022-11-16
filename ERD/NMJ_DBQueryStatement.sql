 select store_name, store_lat, store_long, ( 6371000 * acos( cos( radians(37.500023) ) * cos( radians( store_lat ) ) * cos( radians( store_long ) - radians(127.036613) ) + sin( radians(37.500023) ) * sin( radians(store_lat ) ) ) ) as dist
 from nmj_store ns ;
select * from nmj_reservation nr ;
describe  nmj_reservation ;
describe nmj_review ;
select * from nmj_like nl ;
describe nmj_reply ;

SELECT
			store_uid,
			store_img_sav,
			store_name,
			store_dname
		FROM NMJ_store NATURAL JOIN NMJ_storeDType
		WHERE store_type =1 order by store_uid asc limit 0, 6;
		
select * from nmj_space ns ;

SELECT * FROM NMJ_space WHERE store_uid = 1 group by space_name ORDER BY space_uid asc;
truncate table nmj_space ;  
select * from nmj_spaceimage ns ;
truncate table nmj_spaceimage ;
SELECT * FROM nmj_review;
select * from nmj_space ns ;
describe nmj_space ;
select * from nmj_member nm ;
select * from nmj_store ns ;

select * from nmj_like nl ;
delete from nmj_like where like_uid = 8;
SELECT * FROM NMJ_spaceimage si, NMJ_space sp WHERE sp.space_uid = si.space_uid and sp.store_uid = 1;
SELECT * FROM NMJ_spaceimage si, NMJ_space sp WHERE sp.space_uid = si.space_uid and sp.store_uid = 1;
 		
