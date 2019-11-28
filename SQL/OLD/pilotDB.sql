create schema mercury;
use mercury;

create table personnel_table(
	id int primary key not null auto_increment,
    name varchar(40) not null,
    surnamee varchar(40) not null
);

create table machine_table(
	id int primary key not null auto_increment,
    name varchar(20) null default 'default_machine',
	brand varchar(20) null default 'null_brand',
    modelDate int null default 0000
);

create table cut_table(
	id int primary key not null auto_increment,
    personnel1_id int null default -1,
    personnel2_id int null default -1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id)
);

create table sew_table(
	id int primary key not null auto_increment,
    personnel1_id int null default -1,
    machine_id int null default -1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table knit_table(
	id int primary key not null auto_increment,
    personnel1_id int null default -1,
	personnel2_id int null default -1,
    machine_id int null default -1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
	foreign key (personnel2_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table product(
	id int primary key not null auto_increment,
    cut_id int null,
    sew_id int null,
    knit_id int null,
    foreign key (cut_id) references cut_table(id),
    foreign key (sew_id) references sew_table(id),
    foreign key (knit_id) references knit_table(id)
);








create table test(
	id int primary key not null auto_increment,
    tarih datetime not null
);

select* from test;
insert into test values (null,'1998-7-9 9:1:3');

