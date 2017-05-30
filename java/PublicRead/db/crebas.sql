/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/4/24 星期一 14:14:19                       */
/*==============================================================*/


drop table if exists T_ARTICLE;

drop table if exists T_ARTICLE_TAG;

drop table if exists T_FLOCK;

drop table if exists T_FLOCK_USER;

drop table if exists T_PACK;

drop table if exists T_TAG;

drop table if exists T_USER;

drop table if exists T_USER_BLACK;

drop table if exists T_USER_CARE;

drop table if exists T_USER_FIND;

drop table if exists T_USER_LIKE_ARTICLE;

drop table if exists T_USER_READ;

drop table if exists T_USER_TAG;

/*==============================================================*/
/* Table: T_ARTICLE                                             */
/*==============================================================*/
create table T_ARTICLE
(
   C_ID                 int not null auto_increment,
   C_TITLE              varchar(50),
   C_CREATE_TIME        datetime,
   C_CONETNT            varchar(50),
   C_USER_ID            int not null,
   C_TYPE               int not null default 0 comment '0,表示普通，1表示商品',
   C_VISITED            bigint default 0,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_ARTICLE_TAG                                         */
/*==============================================================*/
create table T_ARTICLE_TAG
(
   C_ID                 int not null auto_increment,
   C_ARTICLE_ID         int,
   C_TAG_ID             int,
   C_CREATE_TIME        datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_FLOCK                                               */
/*==============================================================*/
create table T_FLOCK
(
   C_ID                 int not null auto_increment,
   C_TAG_ID             int,
   C_NAME               varchar(50),
   C_CREATE_TIME        datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_FLOCK_USER                                          */
/*==============================================================*/
create table T_FLOCK_USER
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_TYPE               int not null default 1 comment '0表示群主',
   C_NICKNAME           varchar(50),
   C_CREATE_TIME        datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_PACK                                                */
/*==============================================================*/
create table T_PACK
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_CONTENT            text,
   C_TYPE               int comment '0表示服务端接收,1表示服务端发送',
   C_CREATE_TIME        datetime,
   C_FLAG               int default 0 comment '1表示成功',
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_TAG                                                 */
/*==============================================================*/
create table T_TAG
(
   C_ID                 int not null auto_increment,
   C_NAME               varchar(20),
   C_CREATE_TIME        datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
create table T_USER
(
   C_ID                 int not null auto_increment,
   C_ACCOUNT            varchar(20),
   C_PASSWORD           varchar(20),
   C_NAME               varchar(50),
   C_CREATE_TIME        datetime,
   C_ICON               varchar(50),
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_BLACK                                          */
/*==============================================================*/
create table T_USER_BLACK
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int not null,
   C_TO_USER_ID         int not null,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_CARE                                           */
/*==============================================================*/
create table T_USER_CARE
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int not null,
   C_TO_USER_ID         int not null,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_FIND                                           */
/*==============================================================*/
create table T_USER_FIND
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_ARTICLE_ID         int,
   C_KEY                varchar(20),
   C_FIND_TIME          datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_LIKE_ARTICLE                                   */
/*==============================================================*/
create table T_USER_LIKE_ARTICLE
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_ARTICLE_ID         int,
   C_LIKE_TIME          datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_READ                                           */
/*==============================================================*/
create table T_USER_READ
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_ARTICLE_ID         int,
   C_READ_TIME          datetime,
   primary key (C_ID)
);

/*==============================================================*/
/* Table: T_USER_TAG                                            */
/*==============================================================*/
create table T_USER_TAG
(
   C_ID                 int not null auto_increment,
   C_USER_ID            int,
   C_TAG_ID             int,
   C_CREATE_TIME        datetime,
   primary key (C_ID)
);

