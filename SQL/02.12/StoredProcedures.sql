select * from mercury.couch_table;

DELIMITER //
CREATE PROCEDURE UpdateCutFabric(IN couch_id int, IN p1id int, IN p2id int)
BEGIN
	insert into mercury.couch_cut_fabric_table values (null, p1id, p2id, now());
	update mercury.couch_table set couch_table.cut_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateSewFabric(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_sew_fabric_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.sew_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateQuiltFabric(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_quilt_fabric_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.quilt_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStripCutHB(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_strip_cut_hb_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.strip_cut_hb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateCasing(IN couch_id int, IN p1id int, IN p2id int)
BEGIN
    insert into mercury.couch_casing_table values (null, p1id, p2id, now());
    update mercury.couch_table set couch_table.casing_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateCutHB(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_cut_hb_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.cut_hb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateDressingFabric(IN couch_id int, IN pid int)
BEGIN
    insert into mercury.couch_dressing_fabric_table values (null, pid, now());
    update mercury.couch_table set couch_table.dressing_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateDrillHB(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_drill_hb_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.drill_hb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateFrameCut(IN couch_id int, IN p1id int, IN p2id int)
BEGIN
    insert into mercury.couch_frame_cut_table values (null, p1id, p2id, now());
    update mercury.couch_table set couch_table.frame_cut_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateFurnishFabric(IN couch_id int, IN p1id int, IN p2id int, IN p3id int)
BEGIN
    insert into mercury.couch_furnish_fabric_table values (null, p1id, p2id, p3id, now());
    update mercury.couch_table set couch_table.furnish_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateLCutHB(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_l_cut_hb_table values (null, pid, mid, now());
    update mercury.couch_table set couch_table.l_cut_hb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdatePackage(IN couch_id int, IN pid int)
BEGIN
    insert into mercury.couch_package_table values (null, pid, now());
    update mercury.couch_table set couch_table.package_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateRubberPile(IN couch_id int, IN p1id int, IN p2id int, IN p3id int, IN p4id int)
BEGIN
    insert into mercury.couch_rubber_pile_table values (null, p1id, p2id, p3id, p4id, now());
    update mercury.couch_table set couch_table.rubber_pile_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateSponge(IN couch_id int, IN pid int)
BEGIN
    insert into mercury.couch_whitening_sponge_table values (null, pid, now());
    update mercury.couch_table set couch_table.whitening_sponge_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateWrapping(IN couch_id int, IN pid int)
BEGIN
    insert into mercury.couch_wrapping_cardboard_table values (null, pid, now());
    update mercury.couch_table set couch_table.wrapping_cb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SelectCouch(IN couch_id int)
BEGIN
    select * from mercury.couch_table where id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CreateNewCouch(IN jCode varchar(9))
BEGIN
    insert into mercury.couch_table (id, jcode) values (null, jCode);
    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CheckJcode(IN jCode varchar(9))
BEGIN
	select couch_table.id from mercury.couch_table where jcode = jCode;
END //
DELIMITER ;
