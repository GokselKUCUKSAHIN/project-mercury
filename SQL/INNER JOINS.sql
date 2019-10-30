SELECT p.id, 
cutPer1.name as 'Cut Personnel 1 name', cutPer2.name as 'Cut Personnel 2 name', cut.processDate as 'Cut time',
sewPer1.name as 'Sew Personnel 1 name', sewMac.name as 'Sew Machine Name', sewMac.brand as 'Sew Machine Brand',
sew.processDate as 'Sew time', knitPer1.name as 'Knit Personnel 1 name',knitPer2.name as 'Knit Personnel 2 name',
knitMac.name as 'Knit Machine Name', knitMac.brand as 'Knit Machine Brand',knit.processDate as 'Knit time'
FROM mercury.product p
	INNER JOIN mercury.cut_table cut on cut.id = p.cut_id
	INNER JOIN mercury.personnel_table cutPer1 on cut.personnel1_id = cutPer1.id
    INNER JOIN mercury.personnel_table cutPer2 on cut.personnel2_id = cutPer2.id
    INNER JOIN mercury.sew_table sew on sew.id = p.sew_id
    INNER JOIN mercury.personnel_table sewPer1 on sew.personnel1_id = sewPer1.id
    INNER JOIN mercury.machine_table sewMac on sew.machine_id = sewMac.id
    INNER JOIN mercury.knit_table knit on knit.id = p.knit_id
    INNER JOIN mercury.personnel_table knitPer1 on knit.personnel1_id = knitPer1.id
	INNER JOIN mercury.personnel_table knitPer2 on knit.personnel2_id = knitPer2.id
	INNER JOIN mercury.machine_table knitMac on knit.machine_id = knitMac.id
;

SELECT p.id, 
cut.*, cutPer1.*, cutPer2.*, sew.*, sewPer1.*, sewMac.*,knit.*, knitPer1.*,knitPer2.*, knitMac.*
FROM mercury.product p
	INNER JOIN mercury.cut_table cut on cut.id = p.cut_id
	INNER JOIN mercury.personnel_table cutPer1 on cut.personnel1_id = cutPer1.id
    INNER JOIN mercury.personnel_table cutPer2 on cut.personnel2_id = cutPer2.id
    INNER JOIN mercury.sew_table sew on sew.id = p.sew_id
    INNER JOIN mercury.personnel_table sewPer1 on sew.personnel1_id = sewPer1.id
    INNER JOIN mercury.machine_table sewMac on sew.machine_id = sewMac.id
    INNER JOIN mercury.knit_table knit on knit.id = p.knit_id
    INNER JOIN mercury.personnel_table knitPer1 on knit.personnel1_id = knitPer1.id
	INNER JOIN mercury.personnel_table knitPer2 on knit.personnel2_id = knitPer2.id
	INNER JOIN mercury.machine_table knitMac on knit.machine_id = knitMac.id
;
select * from product;


SELECT p.id, 
cutPer1.name as 'Cut Personnel 1 name', cutPer2.name as 'Cut Personnel 2 name', cut.processDate as 'Cut time'
FROM mercury.product p
	INNER JOIN mercury.cut_table cut on cut.id = p.cut_id
	INNER JOIN mercury.personnel_table cutPer1 on cut.personnel1_id = cutPer1.id
    INNER JOIN mercury.personnel_table cutPer2 on cut.personnel2_id = cutPer2.id
;