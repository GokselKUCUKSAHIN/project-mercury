CALL addNewPersonnel("Goksel","KUCUKSAHIN","37225763342","2010-05-01","1998-08-08");
CALL printPersonnel(2);
CALL printMachine(2);


use mercury;

select * from mercury.couch_table;

CALL mercury.sum(2,3,@test);
select @test;
set @test := 1;

CALL mercury.testCouch(@variable);
select @variable;