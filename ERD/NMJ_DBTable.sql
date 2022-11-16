-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- NMJ_member Table Create SQL
CREATE TABLE NMJ_member
(
    `mb_uid`      INT             NOT NULL    AUTO_INCREMENT COMMENT '회원 고유번호', 
    `mb_id`       VARCHAR(45)     NOT NULL    COMMENT '회원 id', 
    `mb_pw`       TEXT            NOT NULL    COMMENT '회원 비밀번호', 
    `mb_name`     VARCHAR(45)     NOT NULL    COMMENT '회원 이름', 
    `mb_img_org`  VARCHAR(200)    NULL        COMMENT '회원 사진원본명', 
    `mb_img_sav`  VARCHAR(200)    NULL        COMMENT '회원 사진저장명', 
    `mb_tel`      VARCHAR(45)     NOT NULL    COMMENT '회원 전화번호', 
    `mb_email`    TEXT            NOT NULL    COMMENT '회원 이메일', 
    `mb_regDate`  DATETIME        NOT NULL    DEFAULT now() COMMENT '회원 등록일', 
    `mb_type`     INT             NOT NULL    COMMENT 'e-1: 탈퇴 0:대기 1: 일반 2: 매장 3: 운영자', 
    PRIMARY KEY (mb_uid)
);

CREATE TABLE ABC_test
(
	`COL1` varchar(40),
	`COL2` INT
);
INSERT INTO ABC_test
	(COL1, COL2)
values
("A", 100),
("B", 200),
("C", 300),
("C", 400);

select col1, COUNT(*)
from ABC_test
group by col1;

ALTER TABLE NMJ_member COMMENT '회원정보';

ALTER TABLE NMJ_member
    ADD CONSTRAINT UC_mb_id UNIQUE (mb_id);

ALTER TABLE NMJ_member
    ADD CONSTRAINT UC_mb_email UNIQUE (mb_email);


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_storeDType
(
    `store_dtype`  INT            NOT NULL    AUTO_INCREMENT COMMENT '매장 상세 종류', 
    `store_type`   INT            NOT NULL    COMMENT '1: 놀자 2: 먹자 3: 자자', 
    `store_dname`  VARCHAR(45)    NOT NULL    COMMENT '매장 상세 명', 
    PRIMARY KEY (store_dtype)
);

ALTER TABLE NMJ_storeDType COMMENT '매장 상세 종류 리스트';

ALTER TABLE NMJ_storeDType
    ADD CONSTRAINT UC_store_dname UNIQUE (store_dname);


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_store
(
    `store_uid`         INT             NOT NULL    AUTO_INCREMENT COMMENT '매장 고유 번호', 
    `mb_uid`            INT             NOT NULL    COMMENT '회원 고유번호', 
    `store_name`        VARCHAR(45)     NOT NULL    COMMENT '매장 이름', 
    `store_address`     VARCHAR(45)     NOT NULL    COMMENT '매장 주소', 
    `store_tel`         VARCHAR(45)     NOT NULL    COMMENT '매장 연락처', 
    `store_hours`       TEXT            NOT NULL    COMMENT '매장 영업시간', 
    `store_content`     TEXT            NULL        COMMENT '매장 설명', 
    `store_img_org`     VARCHAR(200)    NULL        COMMENT '매장 사진원본명', 
    `store_img_sav`     VARCHAR(200)    NULL        COMMENT '매장 사진저장명', 
    `store_regNum`      VARCHAR(45)     NOT NULL    COMMENT '사업자 등록번호', 
    `store_regImg_org`  VARCHAR(200)    NOT NULL    COMMENT '사업자 등록사진원본명', 
    `store_regImg_sav`  VARCHAR(200)    NOT NULL    COMMENT '사업자 등록사진저장명', 
    `store_lat`         DOUBLE          NOT NULL    COMMENT '매장 위도', 
    `store_long`        DOUBLE          NOT NULL    COMMENT '매장 경도', 
    `store_type`        INT             NOT NULL    COMMENT '1: 놀자 2: 먹자 3: 자자', 
    `store_dtype`       INT             NOT NULL    COMMENT '매장 상세 종류', 
    `store_regDate`     DATETIME        NOT NULL    DEFAULT now() COMMENT '매장 등록일', 
    `store_ratings`     INT             NOT NULL    DEFAULT 0 COMMENT '매장 총평점', 
    `store_rateCount`   INT             NOT NULL    DEFAULT 0 COMMENT '매장 평점지수', 
    PRIMARY KEY (store_uid)
);

ALTER TABLE NMJ_store COMMENT '매장회원(공통)';

ALTER TABLE NMJ_store
    ADD CONSTRAINT FK_NMJ_store_mb_uid_NMJ_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES NMJ_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE NMJ_store
    ADD CONSTRAINT FK_NMJ_store_store_dtype_NMJ_storeDType_store_dtype FOREIGN KEY (store_dtype)
        REFERENCES NMJ_storeDType (store_dtype) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE NMJ_store
    ADD CONSTRAINT UC_store_tel UNIQUE (store_tel);

ALTER TABLE NMJ_store
    ADD CONSTRAINT UC_store_regNum UNIQUE (store_regNum);


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_review
(
    `review_uid`        INT         NOT NULL    AUTO_INCREMENT COMMENT '리뷰_고유번호', 
    `mb_uid`            INT         NOT NULL    COMMENT '회원 고유번호', 
    `store_uid`         INT         NULL        COMMENT '0: 예약이 아닌 경우', 
    `review_rate`       INT         NULL        COMMENT '리뷰_평점', 
    `review_content`    TEXT        NOT NULL    COMMENT '리뷰_내용', 
    `review_ban`        INT         NOT NULL    DEFAULT 0 COMMENT '0: 정상 1: 신고', 
    `review_viewCount`  INT         NOT NULL    DEFAULT 0 COMMENT '리뷰 조회수', 
    `review_date`       DATETIME    NOT NULL    DEFAULT now() COMMENT '리뷰 등록일', 
    PRIMARY KEY (review_uid)
);

ALTER TABLE NMJ_review COMMENT '리뷰';

ALTER TABLE NMJ_review
    ADD CONSTRAINT FK_NMJ_review_mb_uid_NMJ_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES NMJ_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_food
(
    `food_uid`      INT             NOT NULL    AUTO_INCREMENT COMMENT '매장 음식 고유 번호', 
    `store_uid`     INT             NOT NULL    COMMENT '매장 고유 번호', 
    `food_img_org`  VARCHAR(200)    NULL        COMMENT '음식 사진원본명', 
    `food_img_sav`  VARCHAR(200)    NULL        COMMENT '음식 사진저장명', 
    `food_price`    INT             NOT NULL    COMMENT '음식 가격', 
    `food_name`     TEXT            NOT NULL    COMMENT '음식 명', 
    PRIMARY KEY (food_uid)
);

ALTER TABLE NMJ_food COMMENT '음식';

ALTER TABLE NMJ_food
    ADD CONSTRAINT FK_NMJ_food_store_uid_NMJ_store_store_uid FOREIGN KEY (store_uid)
        REFERENCES NMJ_store (store_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_spaceImage
(
    `space_img_uid`  INT     NOT NULL    AUTO_INCREMENT COMMENT '방 사진 고유번호', 
    `space_uid`      INT     NOT NULL    COMMENT '매장 공간 고유번호', 
    `space_img_org`  TEXT    NOT NULL    COMMENT '방 사진원본명', 
    `space_img_sav`  TEXT    NOT NULL    COMMENT '방 사진저장명', 
    PRIMARY KEY (space_img_uid)
);

ALTER TABLE NMJ_spaceImage COMMENT '공간 사진';


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_space
(
    `space_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '매장 공간 고유번호', 
    `store_uid`      INT            NOT NULL    COMMENT '매장 고유 번호', 
    `spaceList_uid`  INT            NOT NULL    COMMENT '공간 고유 번호', 
    `space_price`    INT            NOT NULL    DEFAULT 0 COMMENT '공간 가격', 
    `space_empty`    INT            NOT NULL    DEFAULT 1 COMMENT '0:사용불가 1:사용가능', 
    `space_count`    INT            NOT NULL    DEFAULT 1 COMMENT '공간 사용 인원', 
    `space_name`     VARCHAR(45)    NOT NULL    COMMENT '공간 이름', 
    `space_xloc`     DOUBLE         NULL        COMMENT '공간 x좌표', 
    `space_yloc`     DOUBLE         NULL        COMMENT '공간 y좌표', 
    PRIMARY KEY (space_uid)
);

ALTER TABLE NMJ_space COMMENT '매장별 공간 목록';

ALTER TABLE NMJ_space
    ADD CONSTRAINT FK_NMJ_space_store_uid_NMJ_store_store_uid FOREIGN KEY (store_uid)
        REFERENCES NMJ_store (store_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_like
(
    `like_uid`   INT    NOT NULL    AUTO_INCREMENT COMMENT '찜 고유번호', 
    `mb_uid`     INT    NOT NULL    COMMENT '회원 고유번호', 
    `store_uid`  INT    NOT NULL    COMMENT '매장 고유 번호', 
    PRIMARY KEY (like_uid)
);

ALTER TABLE NMJ_like COMMENT '찜';

ALTER TABLE NMJ_like
    ADD CONSTRAINT FK_NMJ_like_store_uid_NMJ_store_store_uid FOREIGN KEY (store_uid)
        REFERENCES NMJ_store (store_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE NMJ_like
    ADD CONSTRAINT FK_NMJ_like_mb_uid_NMJ_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES NMJ_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_reservation
(
    `reservation_uid`    INT         NOT NULL    AUTO_INCREMENT COMMENT '예약 고유번호', 
    `reservation_start`  DATETIME    NOT NULL    COMMENT '예약 시작시간', 
    `reservation_end`    DATETIME    NULL        COMMENT '예약 종료시간', 
    `mb_uid`             INT         NOT NULL    COMMENT '회원 고유번호', 
    `space_uid`          TEXT        NOT NULL    COMMENT '매장 공간 고유번호', 
    `reservation_check`  INT         NOT NULL    DEFAULT 0 COMMENT '0: 대기 1: 승인', 
    `reservation_date`   DATETIME    NOT NULL    DEFAULT now() COMMENT '접수 날짜', 
    `reservation_count`  INT         NOT NULL    DEFAULT 1 COMMENT '예약 인원', 
    `reservation_seat`   TEXT        NOT NULL    COMMENT '예약 좌석', 
    `reservation_price`  INT         NOT NULL    DEFAULT 0 COMMENT '예약 금액', 
    `store_uid`          INT         NOT NULL    COMMENT '매장 고유 번호', 
    PRIMARY KEY (reservation_uid)
);

ALTER TABLE NMJ_reservation COMMENT '예약';

ALTER TABLE NMJ_reservation
    ADD CONSTRAINT FK_NMJ_reservation_mb_uid_NMJ_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES NMJ_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE NMJ_reservation
    ADD CONSTRAINT FK_NMJ_reservation_store_uid_NMJ_store_store_uid FOREIGN KEY (store_uid)
        REFERENCES NMJ_store (store_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_spaceList
(
    `spaceList_uid`  INT            NOT NULL    AUTO_INCREMENT COMMENT '공간 고유번호', 
    `space_type`     VARCHAR(45)    NOT NULL    COMMENT '공간 종류', 
    PRIMARY KEY (spaceList_uid)
);

ALTER TABLE NMJ_spaceList COMMENT '공간 종류';

ALTER TABLE NMJ_spaceList
    ADD CONSTRAINT UC_space_type UNIQUE (space_type);


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_notice
(
    `notice_uid`        INT            NOT NULL    AUTO_INCREMENT COMMENT '공지사항_고유번호', 
    `notice_subject`    VARCHAR(45)    NOT NULL    COMMENT '공지사항_제목', 
    `notice_content`    TEXT           NOT NULL    COMMENT '공지사항_내용', 
    `notice_regDate`    DATETIME       NOT NULL    DEFAULT now() COMMENT '공지사항_작성일', 
    `notice_endDate`    DATETIME       NULL        COMMENT '공지사항_종료일', 
    `notice_startDate`  DATETIME       NULL        COMMENT '공지사항_시작일', 
    `notice_type`       INT            NOT NULL    DEFAULT 0 COMMENT '0: 공지 1: 이벤트', 
    `notice_viewCount`  INT            NOT NULL    DEFAULT 0 COMMENT '공지사항 조회수', 
    PRIMARY KEY (notice_uid)
);

ALTER TABLE NMJ_notice COMMENT '공지사항';


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_reply
(
    `reply_uid`         INT         NOT NULL    AUTO_INCREMENT COMMENT '댓글_고유번호', 
    `review_uid`        INT         NOT NULL    COMMENT '리뷰_고유번호', 
    `reply_level`       INT         NOT NULL    COMMENT '0: 댓글 1: 대댓글', 
    `reply_parent_uid`  INT         NULL        COMMENT '부모의 reply_uid', 
    `reply_content`     TEXT        NOT NULL    COMMENT '댓글_내용', 
    `reply_ban`         INT         NOT NULL    DEFAULT 0 COMMENT '0: 정상 1: 신고', 
    `mb_uid`            INT         NOT NULL    COMMENT '회원 고유번호', 
    `reply_date`        DATETIME    NOT NULL    DEFAULT now() COMMENT '댓글 등록일', 
    PRIMARY KEY (reply_uid)
);

ALTER TABLE NMJ_reply COMMENT '댓글';

ALTER TABLE NMJ_reply
    ADD CONSTRAINT FK_NMJ_reply_review_uid_NMJ_review_review_uid FOREIGN KEY (review_uid)
        REFERENCES NMJ_review (review_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE NMJ_reply
    ADD CONSTRAINT FK_NMJ_reply_mb_uid_NMJ_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES NMJ_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- NMJ_member Table Create SQL
CREATE TABLE NMJ_request
(
    `request_uid`      INT     NOT NULL    AUTO_INCREMENT COMMENT '요청 고유 번호', 
    `request_type`     INT     NOT NULL    COMMENT '1: 가입 요청 2: 수정 요청 3: 게시글 신고 4: 댓글 신고', 
    `request_content`  TEXT    NOT NULL    COMMENT '요청 내용', 
    `request_check`    INT     NOT NULL    DEFAULT 0 COMMENT '0: 대기 1: 해결 2: 거절/넘기기', 
    PRIMARY KEY (request_uid)
);

ALTER TABLE NMJ_request COMMENT '요청';


