select * from mercury.couch_table;


CREATE PROCEDURE UpdateCutFabric(IN couch_id int, IN p1id int, IN p2id int)
BEGIN
	insert into mercury.couch_cut_fabric_table values (null, p1id, p2id, now());
	update mercury.couch_table set cut_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UpdateSewFabric(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_sew_fabric_table values (null, pid, mid, now());
    update mercury.couch_table set sew_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UpdateQuiltFabric(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_quilt_fabric_table values (null, pid, mid, now());
    update mercury.couch_table set quilt_fabric_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE UpdateStripCutHB(IN couch_id int, IN pid int, IN mid int)
BEGIN
    insert into mercury.couch_strip_cut_harboard_table values (null, pid, mid, now());
    update mercury.couch_table set strip_cut_hb_id = last_insert_id() where id = couch_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SelectCouch(IN couch_id int)
BEGIN
    select * from mercury.couch_table where id = couch_id;
END //
DELIMITER ;

