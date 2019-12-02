create schema mercury;
use mercury;

create table personnel_table(
	id int primary key not null auto_increment,
    name varchar(40) not null,
    surname varchar(40) not null,
    tc varchar(11) not null,
	workStartDate date not null,
    birthDate date not null
);

create table machine_table(
	id int primary key not null auto_increment,
    name varchar(20) null default 'default_machine',
	brand varchar(20) null default 'null_brand',
    modelDate int null default 0000
);

create table couch_cut_fabric_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    personnel2_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id)
);

create table couch_sew_fabric_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_quilt_fabric_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_cut_harboard_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_strip_cut_harboard_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_l_cut_harboard_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_drill_harboard_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_casing_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    personnel2_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id)
);

create table couch_rubber_pile_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    personnel2_id int null default 1,
	personnel3_id int null default 1,
	personnel4_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id),
	foreign key (personnel3_id) references personnel_table(id),
    foreign key (personnel4_id) references personnel_table(id)
);

create table couch_frame_cut_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    personnel2_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id)
);

create table couch_whitening_sponge_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id)
);

create table couch_wrapping_cardboard_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id)
);

create table couch_dressing_fabric_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id)
);

create table couch_furnish_fabric_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    personnel2_id int null default 1,
	personnel3_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (personnel2_id) references personnel_table(id),
	foreign key (personnel3_id) references personnel_table(id)
);

create table couch_package_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id)
);
