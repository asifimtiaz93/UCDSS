create table login (
    id varchar2(2) PRIMARY KEY not null ,
    username VARCHAR2(10) NOT NULL UNIQUE,
    password VARCHAR2(10) NOT NULL
)