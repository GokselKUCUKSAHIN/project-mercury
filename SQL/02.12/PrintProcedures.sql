DELIMITER //
CREATE PROCEDURE PrintCutFabric(IN couch_id int)
BEGIN
	select 
		cutPer1.name as 'Personnel 1 name',
        cutPer1.surname as 'Personnel 1 surname',
		cutPer2.name as 'Personnel 2 name',
        cutPer2.surname as 'Personnel 2 surname',
        cut.processDate as 'Cut dateTime'
	from
		mercury.couch_table ct
	inner join 
		mercury.couch_cut_fabric_table cut on cut.id = ct.cut_fabric_id
	inner join
		mercury.personnel_table cutPer1 on cut.personnel1_id = cutPer1.id
	inner join
		mercury.personnel_table cutPer2 on cut.personnel2_id = cutPer2.id
	where 
		ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintCasing(IN couch_id int)
BEGIN
	select 
		casingPer1.name as 'Personnel 1 name',
        casingPer1.surname as 'Personnel 1 surname',
		casingPer2.name as 'Personnel 2 name',
        casingPer2.surname as 'Personnel 2 surname',
        casing.processDate as 'Casing dateTime'
	from
		mercury.couch_table ct
	inner join 
		mercury.couch_casing_table casing on casing.id = ct.casing_id
	inner join
		mercury.personnel_table casingPer1 on casing.personnel1_id = casingPer1.id
	inner join
		mercury.personnel_table casingPer2 on casing.personnel2_id = casingPer2.id
	where 
		ct.id = couch_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE PrintDressingFabric(IN couch_id int)
BEGIN
	select 
		dressPer.name as 'Personnel name',
        dressPer.surname as 'Personnel surname',
        dress.processDate as 'Dressing Fabric dateTime'
	from
		mercury.couch_table ct
	inner join 
		mercury.couch_dressing_fabric_table dress on dress.id = ct.dressing_fabric_id
	inner join
		mercury.personnel_table dressPer on dress.personnel1_id = dressPer.id
	where 
		ct.id = couch_id;
END //
DELIMITER ;
