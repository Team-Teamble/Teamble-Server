create sequence user_user_id_seq
    as integer;

alter sequence user_user_id_seq owner to postgres;

create sequence type_type_id_seq
    as integer;

alter sequence type_type_id_seq owner to postgres;

create sequence project_project_id_seq
    as integer;

alter sequence project_project_id_seq owner to postgres;

create sequence field_field_id_seq
    as integer;

alter sequence field_field_id_seq owner to postgres;

create sequence period_period_id_seq
    as integer;

alter sequence period_period_id_seq owner to postgres;

create sequence position_position_id_seq
    as integer;

alter sequence position_position_id_seq owner to postgres;

create sequence goal_goal_id_seq
    as integer;

alter sequence goal_goal_id_seq owner to postgres;

create sequence team_team_id_seq
    as integer;

alter sequence team_team_id_seq owner to postgres;

create sequence poke_poke_id_seq
    as integer;

alter sequence poke_poke_id_seq owner to postgres;

create sequence project_field_project_field_id_seq
    as integer;

alter sequence project_field_project_field_id_seq owner to postgres;

create sequence project_type_project_type_id_seq
    as integer;

alter sequence project_type_project_type_id_seq owner to postgres;

create sequence project_goal_project_goal_id_seq
    as integer;

alter sequence project_goal_project_goal_id_seq owner to postgres;

create sequence project_period_project_period_id_seq
    as integer;

alter sequence project_period_project_period_id_seq owner to postgres;

create sequence user_position_user_position_id_seq
    as integer;

alter sequence user_position_user_position_id_seq owner to postgres;

create sequence project_poke_project_poke_id_seq
    as integer;

alter sequence project_poke_project_poke_id_seq owner to postgres;

create sequence user_field_user_field_id_seq
    as integer;

alter sequence user_field_user_field_id_seq owner to postgres;

create sequence project_position_num_id_seq
    as integer;

alter sequence project_position_num_id_seq owner to postgres;

create table type
(
    id   integer default nextval('type_type_id_seq'::regclass) not null
        constraint type_pk
            primary key,
    name varchar(20)                                           not null
);

comment on table type is '협업 성향';

alter table type
    owner to postgres;

alter sequence type_type_id_seq owned by type.id;

create table "user"
(
    id          integer   default nextval('user_user_id_seq'::regclass)                                                                                                                                                    not null
        constraint user_pk
            primary key,
    id_firebase varchar(50)                                                                                                                                                                                                not null,
    name        varchar(20)                                                                                                                                                                                                not null,
    email       varchar(50)                                                                                                                                                                                                not null,
    phone       varchar(20),
    photo       text      default 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/%ED%91%B8%ED%91%B8%EC%97%B0%EC%9D%B4%ED%91%B8.jpeg?alt=media&token=8f53a68f-d228-4a7d-ac9c-f238d10ea6e0'::text not null,
    type_id     integer
        constraint user_type_type_id_fk
            references type
            on update cascade on delete cascade,
    university  varchar(20),
    major       varchar(50),
    area        varchar(20),
    intro       varchar(50),
    description text,
    is_checked  boolean   default true                                                                                                                                                                                     not null,
    created_at  timestamp default now()                                                                                                                                                                                    not null,
    updated_at  timestamp default now()                                                                                                                                                                                    not null,
    is_deleted  boolean   default false                                                                                                                                                                                    not null
);

comment on table "user" is '팀블 유저';

alter table "user"
    owner to postgres;

alter sequence user_user_id_seq owned by "user".id;

create unique index user_id_firebase_uindex
    on "user" (id_firebase);

create unique index user_user_id_uindex
    on "user" (id);

create unique index type_type_id_uindex
    on type (id);

create table project
(
    id          integer   default nextval('project_project_id_seq'::regclass)                                                                                                                                              not null
        constraint project_pk
            primary key,
    user_id     integer                                                                                                                                                                                                    not null
        constraint project_user_id_fk
            references "user"
            on update cascade on delete cascade,
    title       varchar(50)                                                                                                                                                                                                not null,
    intro       varchar(50)                                                                                                                                                                                                not null,
    photo       text      default 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/%ED%91%B8%ED%91%B8%EC%97%B0%EC%9D%B4%ED%91%B8.jpeg?alt=media&token=8f53a68f-d228-4a7d-ac9c-f238d10ea6e0'::text not null,
    start_date  date                                                                                                                                                                                                       not null,
    end_date    date                                                                                                                                                                                                       not null,
    area        varchar(20)                                                                                                                                                                                                not null,
    description text                                                                                                                                                                                                       not null,
    created_at  timestamp default now()                                                                                                                                                                                    not null,
    updated_at  timestamp default now()                                                                                                                                                                                    not null,
    is_closed   boolean   default false                                                                                                                                                                                    not null,
    is_deleted  boolean   default false                                                                                                                                                                                    not null
);

comment on table project is '프로젝트';

alter table project
    owner to postgres;

alter sequence project_project_id_seq owned by project.id;

create unique index project_project_id_uindex
    on project (id);

create table field
(
    id   integer default nextval('field_field_id_seq'::regclass) not null
        constraint field_pk
            primary key,
    name varchar(20)                                             not null
);

comment on table field is '프로젝트 분야';

alter table field
    owner to postgres;

alter sequence field_field_id_seq owned by field.id;

create unique index field_field_id_uindex
    on field (id);

create table period
(
    id   integer default nextval('period_period_id_seq'::regclass) not null
        constraint period_pk
            primary key,
    name varchar(20)                                               not null
);

comment on table period is '프로젝트 예상 기간';

alter table period
    owner to postgres;

alter sequence period_period_id_seq owned by period.id;

create unique index period_period_id_uindex
    on period (id);

create table position
(
    id   integer default nextval('position_position_id_seq'::regclass) not null
        constraint position_pk
            primary key,
    name varchar(20)                                                   not null
);

comment on table position is '포지션';

alter table position
    owner to postgres;

alter sequence position_position_id_seq owned by position.id;

create unique index position_position_id_uindex
    on position (id);

create table goal
(
    id   integer default nextval('goal_goal_id_seq'::regclass) not null
        constraint goal_pk
            primary key,
    name varchar(20)                                           not null
);

comment on table goal is '프로젝트 목표';

alter table goal
    owner to postgres;

alter sequence goal_goal_id_seq owned by goal.id;

create unique index goal_goal_id_uindex
    on goal (id);

create table member
(
    id         integer default nextval('team_team_id_seq'::regclass) not null
        constraint team_pk
            primary key,
    project_id integer                                               not null
        constraint team_project_project_id_fk
            references project
            on update cascade on delete cascade,
    user_id    integer                                               not null
        constraint team_user_user_id_fk
            references "user"
);

comment on table member is '프로젝트 팀 구성원';

alter table member
    owner to postgres;

alter sequence team_team_id_seq owned by member.id;

create unique index team_team_id_uindex
    on member (id);

create table user_poke
(
    id             integer default nextval('poke_poke_id_seq'::regclass) not null
        constraint poke_pk
            primary key,
    user_poking_id integer                                               not null
        constraint poke_user_user_id_fk
            references "user"
            on update cascade on delete cascade,
    user_poked_id  integer                                               not null
        constraint poke_user_user_id_fk_2
            references "user"
            on update cascade on delete cascade,
    is_deleted     boolean default false                                 not null
);

comment on table user_poke is '유저 콕 찌르기';

alter table user_poke
    owner to postgres;

alter sequence poke_poke_id_seq owned by user_poke.id;

create unique index poke_poke_id_uindex
    on user_poke (id);

create table project_field
(
    id         integer default nextval('project_field_project_field_id_seq'::regclass) not null
        constraint project_field_pk
            primary key,
    project_id integer                                                                 not null
        constraint project_field_project_id_fk
            references project
            on update cascade on delete cascade,
    field_id   integer                                                                 not null
        constraint project_field_field_id_fk
            references field
            on update cascade on delete cascade
);

comment on table project_field is '해당 프로젝트의 분야';

alter table project_field
    owner to postgres;

alter sequence project_field_project_field_id_seq owned by project_field.id;

create unique index project_field_project_field_id_uindex
    on project_field (id);

create table project_goal
(
    id         integer default nextval('project_goal_project_goal_id_seq'::regclass) not null
        constraint project_goal_pk
            primary key,
    project_id integer                                                               not null
        constraint project_goal_project_id_fk
            references project
            on update cascade on delete cascade,
    goal_id    integer                                                               not null
        constraint project_goal_goal_id_fk
            references goal
);

comment on table project_goal is '해당 프로젝트의 목표';

alter table project_goal
    owner to postgres;

alter sequence project_goal_project_goal_id_seq owned by project_goal.id;

create unique index project_goal_project_goal_id_uindex
    on project_goal (id);

create table project_period
(
    id         integer default nextval('project_period_project_period_id_seq'::regclass) not null
        constraint project_period_pk
            primary key,
    project_id integer                                                                   not null
        constraint project_period_project_id_fk
            references project
            on update cascade on delete cascade,
    period_id  integer                                                                   not null
        constraint project_period_period_id_fk
            references period
            on update cascade on delete cascade
);

comment on table project_period is '해당 프로젝트의 예상 기간';

alter table project_period
    owner to postgres;

alter sequence project_period_project_period_id_seq owned by project_period.id;

create unique index project_period_project_period_id_uindex
    on project_period (id);

create table user_position
(
    id          integer default nextval('user_position_user_position_id_seq'::regclass) not null
        constraint user_position_pk
            primary key,
    user_id     integer                                                                 not null
        constraint user_position_user_id_fk
            references "user"
            on update cascade on delete cascade,
    position_id integer                                                                 not null
        constraint user_position_position_id_fk
            references position
            on update cascade on delete cascade
);

comment on table user_position is '해당 유저의 포지션';

alter table user_position
    owner to postgres;

alter sequence user_position_user_position_id_seq owned by user_position.id;

create unique index user_position_user_position_id_uindex
    on user_position (id);

create table project_poke
(
    id         integer default nextval('project_poke_project_poke_id_seq'::regclass) not null
        constraint project_poke_pk
            primary key,
    user_id    integer                                                               not null
        constraint project_poke_user_id_fk
            references "user"
            on update cascade on delete cascade,
    project_id integer                                                               not null
        constraint project_poke_project_id_fk
            references project
            on update cascade on delete cascade,
    is_deleted boolean default false                                                 not null
);

comment on table project_poke is '프로젝트 팀 지원하기';

alter table project_poke
    owner to postgres;

alter sequence project_poke_project_poke_id_seq owned by project_poke.id;

create unique index project_poke_project_poke_id_uindex
    on project_poke (id);

create table user_field
(
    id       integer default nextval('user_field_user_field_id_seq'::regclass) not null
        constraint user_field_pk
            primary key,
    user_id  integer                                                           not null
        constraint user_field_user_id_fk
            references "user"
            on update cascade on delete cascade,
    field_id integer                                                           not null
        constraint user_field_field_id_fk
            references field
            on update cascade on delete cascade
);

comment on table user_field is '해당 유저의 관심 프로젝트 분야';

alter table user_field
    owner to postgres;

alter sequence user_field_user_field_id_seq owned by user_field.id;

create unique index user_field_user_field_id_uindex
    on user_field (id);

create table tag
(
    id   serial
        constraint tag_pk
            primary key,
    name varchar(20) not null
);

comment on table tag is '협업 성향 태그';

alter table tag
    owner to postgres;

create table project_tag
(
    id         integer default nextval('project_type_project_type_id_seq'::regclass) not null
        constraint project_type_pk
            primary key,
    project_id integer                                                               not null
        constraint project_type_project_id_fk
            references project
            on update cascade on delete cascade,
    tag_id     integer                                                               not null
        constraint project_type_tag_id_fk
            references tag
            on update cascade on delete cascade
);

comment on table project_tag is '해당 프로젝트의 선호 협업 성향 태그';

alter table project_tag
    owner to postgres;

alter sequence project_type_project_type_id_seq owned by project_tag.id;

create unique index project_type_project_type_id_uindex
    on project_tag (id);

create unique index tag_id_uindex
    on tag (id);

create table type_tag
(
    id      serial
        constraint type_tag_pk
            primary key,
    type_id integer not null
        constraint type_tag_type_id_fk
            references type
            on update cascade on delete cascade,
    tag_id  integer not null
        constraint type_tag_tag_id_fk
            references tag
            on update cascade on delete cascade
);

comment on table type_tag is '해당 협업 성향의 태그';

alter table type_tag
    owner to postgres;

create unique index type_tag_id_uindex
    on type_tag (id);

create table position_num
(
    id   serial
        constraint position_num_pk
            primary key,
    name varchar(20) not null
);

comment on table position_num is '포지션 모집 인원';

alter table position_num
    owner to postgres;

create unique index position_num_id_uindex
    on position_num (id);

create table project_position
(
    id              integer default nextval('project_position_num_id_seq'::regclass) not null
        constraint project_position_num_pk
            primary key,
    project_id      integer                                                          not null
        constraint project_position_num_project_id_fk
            references project
            on update cascade on delete cascade,
    position_id     integer                                                          not null
        constraint project_position_num_position_id_fk
            references position
            on update cascade on delete cascade,
    position_num_id integer                                                          not null
        constraint project_position_num_position_num_id_fk
            references position_num
            on update cascade on delete cascade
);

comment on table project_position is '해당 프로젝트의 모집 포지션 및 인원';

alter table project_position
    owner to postgres;

alter sequence project_position_num_id_seq owned by project_position.id;

create unique index project_position_num_id_uindex
    on project_position (id);

