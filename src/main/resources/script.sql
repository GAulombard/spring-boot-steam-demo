create table chat
(
    id         bigint auto_increment,
    new        tinyint(1) null,
    created_at datetime   null,
    updated_at datetime   null,
    constraint chat_id_uindex
        unique (id)
);

alter table chat
    add primary key (id);

create table chat_user_set
(
    chat_list_id bigint not null,
    user_set_id  bigint not null,
    primary key (chat_list_id, user_set_id)
);

create table games
(
    id   bigint auto_increment,
    game varchar(50) not null,
    constraint games_id_uindex
        unique (id)
);

alter table games
    add primary key (id);

create table `groups`
(
    id          bigint auto_increment,
    group_name  varchar(50) null,
    description varchar(50) null,
    created_at  datetime    null,
    constraint groups_id_uindex
        unique (id)
);

alter table `groups`
    add primary key (id);

create table message
(
    id           bigint auto_increment,
    message_text varchar(200) null,
    sent_at      datetime     null,
    is_new       tinyint(1)   null,
    constraint message_id_uindex
        unique (id)
);

alter table message
    add primary key (id);

create table posts
(
    id         bigint auto_increment,
    body       varchar(200) null,
    updated_at datetime     null,
    constraint posts_id_uindex
        unique (id)
);

alter table posts
    add primary key (id);

create table user_game
(
    user_id bigint null,
    game_id bigint null
);

create table user_group
(
    user_id  bigint null,
    group_id bigint null
);

create table user_openid
(
    openid_url varchar(100) not null,
    constraint user_openid_openid_url_uindex
        unique (openid_url)
);

alter table user_openid
    add primary key (openid_url);

create table users
(
    id             bigint auto_increment,
    full_name      varchar(50)  not null,
    joined_at      datetime     null,
    telephone      varchar(20)  null,
    about_me       varchar(200) null,
    steam_nickname varchar(200) null,
    avatar_url     varchar(100) null,
    constraint users_id_uindex
        unique (id)
);

alter table users
    add primary key (id);

