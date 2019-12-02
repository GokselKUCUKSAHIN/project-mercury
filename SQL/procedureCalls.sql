CALL addNewPersonnel("Goksel","KUCUKSAHIN","37225763342","2010-05-01","1998-08-08");
CALL printPersonnel(2);
CALL printMachine(2);


use mercury;

select * from mercury.couch_table;


select * from mercury.couch_strip_cut_harboard_table;

insert into mercury.couch_table (id) values (null);


CALL UpdateCutHB (1, 7, 1);
CALL UpdateCutFabric (1, 4, 6);
CALL UpdateSewFabric (1, 5, 1);
CALL UpdateQuiltFabric(1, 9, 1);
CALL UpdateStripCutHB(1, 10, 1);


select * from mercury.personnel_table where id between 3 and 8;
select * from mercury.personnel_table where id >= 3 and id <= 8;

select * from couch_cut_harboard_table;
select * from mercury.couch_quilt_fabric_table;

CALL mercury.sum(2,3,@test);
select @test;
set @test := 1;

CALL mercury.testCouch(@variable);
select @variable;
select * from mercury.machine_table;
select * from mercury.personnel_table;
delete from mercury.personnel_table where id = 38;

delete from mercury.couch_table where id = 1;
ALTER TABLE mercury.couch_table AUTO_INCREMENT = 1;