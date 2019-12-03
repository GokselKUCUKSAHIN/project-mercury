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

create table couch_cut_hb_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_strip_cut_hb_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_l_cut_hb_table(
	id int primary key not null auto_increment,
    personnel1_id int null default 1,
    machine_id int null default 1,
    processDate datetime not null,
    foreign key (personnel1_id) references personnel_table(id),
    foreign key (machine_id) references machine_table(id)
);

create table couch_drill_hb_table(
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

create table couch_table(
	id int primary key not null auto_increment,
    jcode varchar(9) not null default 'J00000000',
    cut_fabric_id int not null default 1,
    sew_fabric_id int not null default 1,
    quilt_fabric_id int not null default 1,
    cut_hb_id int not null default 1,
    strip_cut_hb_id int not null default 1,
    l_cut_hb_id int not null default 1,
    drill_hb_id int not null default 1,
    casing_id int not null default 1,
    frame_cut_id int not null default 1,
    rubber_pile_id int not null default 1,
    whitening_sponge_id int not null default 1,
    wrapping_cb_id int not null default 1,
	dressing_fabric_id int not null default 1,
    furnish_fabric_id int not null default 1,
	package_id int not null default 1,
    foreign key (cut_fabric_id) references couch_cut_fabric_table(id),
    foreign key (sew_fabric_id) references couch_sew_fabric_table(id),
    foreign key (quilt_fabric_id) references couch_quilt_fabric_table(id),
	foreign key (cut_hb_id) references couch_cut_hb_table(id),
	foreign key (strip_cut_hb_id) references couch_strip_cut_hb_table(id),
	foreign key (l_cut_hb_id) references couch_l_cut_hb_table(id),
	foreign key (drill_hb_id) references couch_drill_hb_table(id),
	foreign key (casing_id) references couch_casing_table(id),
	foreign key (frame_cut_id) references couch_frame_cut_table(id),
	foreign key (rubber_pile_id) references couch_rubber_pile_table(id),
	foreign key (whitening_sponge_id) references couch_whitening_sponge_table(id),
	foreign key (wrapping_cb_id) references couch_wrapping_cardboard_table(id),
	foreign key (dressing_fabric_id) references couch_dressing_fabric_table(id),
	foreign key (furnish_fabric_id) references couch_furnish_fabric_table(id),
	foreign key (package_id) references couch_package_table(id)
);

select * from mercury.couch_table;