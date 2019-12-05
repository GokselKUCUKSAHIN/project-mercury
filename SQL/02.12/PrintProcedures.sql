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
CREATE PROCEDURE PrintCutHB(IN couch_id int)
BEGIN
	select 
		cutHBPer.name as 'Personnel name',
        cutHBPer.surname as 'Personnel surname',
		cutHBMac.name as 'Machine name',
        cutHBMac.brand as 'Machine brand',
        cutHBMac.modelDate as 'Machine Model Date', 
        cuthb.processDate as 'Hardboard Cut dateTime'
	from
		mercury.couch_table ct
	inner join 
		mercury.couch_cut_hb_table cuthb on cuthb.id = ct.cut_hb_id
	inner join
		mercury.personnel_table cutHBPer on cuthb.personnel1_id = cutHBPer.id
	inner join
		mercury.machine_table cutHBMac on cutHBMac.id = cuthb.machine_id
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

DELIMITER //
CREATE PROCEDURE PrintDrillHB(IN couch_id int)
BEGIN
	select 
		drillPer.name as 'Personnel name',
        drillPer.surname as 'Personnel surname',
        drillMac.name as 'Machine name',
        drillMac.brand as 'Machine brand',
        drillMac.modelDate as 'Machine Model Date',
        drillHB.processDate as 'Drill HardBoard dateTime'
	from
		mercury.couch_table ct
	inner join 
		mercury.couch_drill_hb_table drillHB on drillHB.id = ct.drill_hb_id
	inner join
		mercury.personnel_table drillPer on drillHB.personnel1_id = drillPer.id
	inner join mercury.machine_table drillMac on drillHB.machine_id = drillMac.id
	where 
		ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintFrameCut(IN couch_id int)
BEGIN
select
	cutFramePer1.name as 'Personnel 1 name',
    cutFramePer1.surname as 'Personnel 1 surname',
    cutFramePer2.name as 'Personnel 2 name',
    cutFramePer2.surname as 'Personnel 2 surname',
    frameCut.processDate as 'Cut Frame dateTime'
from 
	mercury.couch_table ct
inner join 
	mercury.couch_frame_cut_table frameCut on frameCut.id = ct.frame_cut_id
inner join
	mercury.personnel_table cutFramePer1 on cutFramePer1.id = frameCut.personnel1_id
inner join
	mercury.personnel_table cutFramePer2 on cutFramePer2.id = frameCut.personnel2_id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintFurnishFabric(IN couch_id int)
BEGIN
select
	furnishPer1.name as 'Personnel 1 name',
    furnishPer1.surname as 'Personnel 1 surname',
    furnishPer2.name as 'Personnel 2 name',
    furnishPer2.surname as 'Personnel 2 surname',
    furnishPer3.name as 'Personnel 3 name',
    furnishPer3.surname as 'Personnel 4 surname',
    furnish.processDate as 'Furnish Fabric dateTime'
from 
	mercury.couch_table ct
inner join 
	mercury.couch_furnish_fabric_table furnish on furnish.id = ct.furnish_fabric_id
inner join
	mercury.personnel_table furnishPer1 on furnishPer1.id = furnish.personnel1_id
inner join
	mercury.personnel_table furnishPer2 on furnishPer2.id = furnish.personnel2_id
inner join
	mercury.personnel_table furnishPer3 on furnishPer3.id = furnish.personnel3_id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintFurnishFabric(IN couch_id int)
BEGIN
select
	furnishPer1.name as 'Personnel 1 name',
    furnishPer1.surname as 'Personnel 1 surname',
    furnishPer2.name as 'Personnel 2 name',
    furnishPer2.surname as 'Personnel 2 surname',
    furnishPer3.name as 'Personnel 3 name',
    furnishPer3.surname as 'Personnel 4 surname',
    furnish.processDate as 'Furnish Fabric dateTime'
from 
	mercury.couch_table ct
inner join 
	mercury.couch_furnish_fabric_table furnish on furnish.id = ct.furnish_fabric_id
inner join
	mercury.personnel_table furnishPer1 on furnishPer1.id = furnish.personnel1_id
inner join
	mercury.personnel_table furnishPer2 on furnishPer2.id = furnish.personnel2_id
inner join
	mercury.personnel_table furnishPer3 on furnishPer3.id = furnish.personnel3_id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintLCutHB(IN couch_id int)
BEGIN
select
	lCutHBPer.name as 'Personnel 1 name',
    lCutHBPer.surname as 'Personnel 1 surname',
	lCutHBMac.name as 'Machine name',
	lCutHBMac.brand as 'Machine brand',
    lCutHBMac.modelDate as 'Machine Model Date',
    lCutHB.processDate as 'L Cut HardBoard dateTime'
from 
	mercury.couch_table ct
inner join 
	mercury.couch_l_cut_hb_table lCutHB on lCutHB.id = ct.l_cut_hb_id
inner join
	mercury.personnel_table lCutHBPer on lCutHBPer.id = lCutHB.personnel1_id
inner join
	mercury.machine_table lCutHBMac on lCutHBMac.id = lCutHB.machine_id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintSponge(IN couch_id int)
BEGIN
select
	spongePer.name as 'Personnel name',
    spongePer.surname as 'Personnel surname',
	sponge.processDate as 'Whitening Sponge dateTime'
from
	mercury.couch_table ct
inner join 
	mercury.couch_whitening_sponge_table sponge on sponge.id = ct.whitening_sponge_id
inner join
	mercury.personnel_table spongePer on sponge.personnel1_id = spongePer.id
where
	ct.id = couch_id;    
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintSewFabric(IN couch_id int)
BEGIN
select
	sewPer.name as 'Personnel name',
    sewPer.surname as 'Personnel surname',
    sewMac.name as 'Machine name',
    sewMac.brand as 'Machine brand',
    sewMac.modelDate as 'Machine Model Date',
	sew.processDate as 'Sew Fabric dateTime'
from
	mercury.couch_table ct
inner join 
	mercury.couch_sew_fabric_table sew on sew.id = ct.sew_fabric_id
inner join
	mercury.personnel_table sewPer on sew.personnel1_id = sewPer.id
inner join
	mercury.machine_table sewMac on sew.machine_id = sewMac.id
where
	ct.id = couch_id;  
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintPackage(IN couch_id int)

BEGIN
select 
	packagePer1.name as 'Personnel name',
    packagePer1.surname as 'Personnel surname',
    package.processDate as 'Package dateTime'
from
	mercury.couch_table ct 
inner join
	mercury.couch_package_table package on package.id = ct.package_id
inner join
	mercury.personnel_table packagePer1 on packagePer1.id = package.personnel1_id 
where
	ct.id=couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintRubberPile(IN couch_id int)
BEGIN
select 
    rubberPilePer1.name as 'Personnel 1 name',
    rubberPilePer1.surname as 'Personnel 1 surname',
    rubberPilePer2.name as 'Personnel 2 name',
    rubberPilePer2.surname as 'Personnel 2 surname',
    rubberPilePer3.name as 'Personnel 3 name',
    rubberPilePer3.surname as 'Personnel 3 surname',
    rubberPilePer4.name as 'Personnel 4 name',
    rubberPilePer4.surname as 'Personnel 4 surname',
    rubberPile.processDate as 'RubberPile dateTime'
from
	mercury.couch_table ct 
inner join
	mercury.couch_rubber_pile_table rubberPile on ct.rubber_pile_id = rubberPile.id
inner join
	mercury.personnel_table rubberPilePer1 on rubberPile.personnel1_id = rubberPilePer1.id
inner join
	mercury.personnel_table rubberPilePer2 on rubberPile.personnel2_id = rubberPilePer2.id
inner join
	mercury.personnel_table rubberPilePer3 on rubberPile.personnel3_id = rubberPilePer3.id
inner join
	mercury.personnel_table rubberPilePer4 on rubberPile.personnel4_id = rubberPilePer4.id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintQuiltFabric(IN couch_id int)
BEGIN
select 
    quiltFabricPer1.name as 'Personnel  name',
    quiltFabricPer1.surname as 'Personnel  surname',
    quiltFabricMac.name as 'Machine name',
    quiltFabricMac.brand as 'Machine brand',
    quiltFabricMac.modelDate as 'Machine Model Date',
    quiltFabric.processDate as 'Quilt Fabric dateTime'
from
	mercury.couch_table ct 
inner join
	mercury.couch_quilt_fabric_table quiltFabric on ct.quilt_fabric_id = quiltFabric.id
inner join
	mercury.personnel_table quiltFabricPer1 on quiltFabric.personnel1_id = quiltFabricPer1.id
inner join
	mercury.machine_table quiltFabricMac on quiltFabric.machine_id = quiltFabricMac.id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintStripCutHB(IN couch_id int)
BEGIN
select 
    stripCutHBPer1.name as 'Personnel  name',
    stripCutHBPer1.surname as 'Personnel  surname',
    stripCutHBMac.name as 'Machine name',
    stripCutHBMac.brand as 'Machine brand',
    stripCutHBMac.modelDate as 'Machine Model Date',
    stripCutHB.processDate as 'Strip Cut HardBoard dateTime'
from
	mercury.couch_table ct 
inner join
	mercury.couch_strip_cut_hb_table stripCutHB on ct.strip_cut_hb_id = stripCutHB.id
inner join
	mercury.personnel_table stripCutHBPer1 on stripCutHB.personnel1_id = stripCutHBPer1.id
inner join
	mercury.machine_table stripCutHBMac on stripCutHB.machine_id = stripCutHBMac.id
where
	ct.id = couch_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PrintWrappingCB(IN couch_id int)
BEGIN
select 
    wrappingPer1.name as 'Personnel  name',
    wrappingPer1.surname as 'Personnel  surname',
    wrapping.processDate as 'Wrapping CardBoard dateTime'
from
	mercury.couch_table ct 
inner join
	mercury.couch_wrapping_cardboard_table wrapping on ct.wrapping_cb_id = wrapping.id
inner join
	mercury.personnel_table wrappingPer1 on wrapping.personnel1_id = wrappingPer1.id
where
ct.id = couch_id;
END //
DELIMITER ;
