/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/2/28 ÐÇÆÚ¶þ 20:10:24                       */
/*==============================================================*/


drop table if exists t_activity;

drop table if exists t_admin;

drop table if exists t_honor;

drop table if exists t_invitation;

drop table if exists t_major;

drop table if exists t_report;

drop table if exists t_section;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_activity                                            */
/*==============================================================*/
create table t_activity
(
   c_id                 int not null auto_increment,
   c_title              varchar(50) not null,
   c_user_id            int(11),
   c_time               date,
   c_picture            mediumblob,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_admin                                               */
/*==============================================================*/
create table t_admin
(
   c_id                 int not null auto_increment,
   c_account            varchar(11) not null,
   c_password           varchar(20) not null,
   c_username           varchar(20) not null,
   c_location           varchar(50) not null,
   c_email              varchar(30),
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_honor                                               */
/*==============================================================*/
create table t_honor
(
   c_id                 int not null auto_increment,
   c_text               text,
   c_students           varchar(100),
   c_teacher            varchar(20),
   c_time               date,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_invitation                                          */
/*==============================================================*/
create table t_invitation
(
   c_id                 int not null auto_increment,
   c_text               text,
   c_user_id            int,
   c_time               datetime,
   c_repid              int not null default 0,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_major                                               */
/*==============================================================*/
create table t_major
(
   c_id                 int not null auto_increment,
   c_name               varchar(20) not null,
   c_introduce          text,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_report                                              */
/*==============================================================*/
create table t_report
(
   c_id                 int not null auto_increment,
   c_text               text,
   c_user_id            int,
   c_time               date,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_section                                             */
/*==============================================================*/
create table t_section
(
   c_id                 int not null auto_increment,
   c_activity_id        int default 0,
   c_text               text,
   c_picture            mediumblob,
   primary key (c_id)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   c_id                 int not null auto_increment,
   c_account            varchar(11) not null,
   c_password           varchar(20) not null,
   c_username           varchar(20) not null,
   c_introduce          longtext,
   c_icon               mediumblob,
   c_entertime          int not null,
   c_major_id           char(10),
   c_usertype           int(11) not null,
   primary key (c_id)
);

