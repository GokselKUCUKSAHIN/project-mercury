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
	foreign key (cut_hb_id) references couch_cut_harboard_table(id),
	foreign key (strip_cut_hb_id) references couch_strip_cut_harboard_table(id),
	foreign key (l_cut_hb_id) references couch_l_cut_harboard_table(id),
	foreign key (drill_hb_id) references couch_drill_harboard_table(id),
	foreign key (casing_id) references couch_casing_table(id),
	foreign key (frame_cut_id) references couch_frame_cut_table(id),
	foreign key (rubber_pile_id) references couch_rubber_pile_table(id),
	foreign key (whitening_sponge_id) references couch_whitening_sponge_table(id),
	foreign key (wrapping_cb_id) references couch_wrapping_cardboard_table(id),
	foreign key (dressing_fabric_id) references couch_dressing_fabric_table(id),
	foreign key (furnish_fabric_id) references couch_furnish_fabric_table(id),
	foreign key (package_id) references couch_package_table(id)
);

select * from couch_table;
select * from couch_cut_fabric_table;
select * from couch_strip_cut_harboard_table;
