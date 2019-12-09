use mercury;

DELIMITER //
CREATE PROCEDURE SelectJCode(IN jcode varchar(9))
BEGIN
	select * from mercury.couch_table where mercury.couch_table.jcode = jcode;
END //
DELIMITER ;
