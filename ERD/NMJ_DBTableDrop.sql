SET SESSION FOREIGN_KEY_CHECKS=0;
SET SESSION FOREIGN_KEY_CHECKS=1;

/* Drop Tables */

DROP TABLE IF EXISTS nmj_food;
DROP TABLE IF EXISTS nmj_like ;																																																																																																																																																																																																																									
DROP TABLE IF EXISTS nmj_member ;
DROP TABLE IF EXISTS nmj_notice ;
DROP TABLE IF EXISTS nmj_reply ;
DROP TABLE IF EXISTS nmj_request ;
DROP TABLE IF EXISTS nmj_reservation ;
DROP TABLE IF EXISTS nmj_review ;
DROP TABLE IF EXISTS nmj_space ;
DROP TABLE IF EXISTS nmj_spaceimage ;
DROP TABLE IF EXISTS nmj_spacelist ;
DROP TABLE IF EXISTS nmj_store ;
DROP TABLE IF EXISTS nmj_storedtype ;





/* 데이터 삭제 */
truncate table nmj_food;