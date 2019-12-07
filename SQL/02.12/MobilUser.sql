USE mercury;

create table mobil_user_table(
id int primary key not null auto_increment,
username varchar(20) not null,
password varchar(20) not null
);

DELIMITER //
CREATE PROCEDURE AddNewMobilUser (IN userName varchar(20), IN password varchar(20))
BEGIN
	insert into mercury.mobil_user_table values (null, userName, password);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CheckMobilUser (IN userName varchar(20))
BEGIN
	select (id) from mercury.mobil_user_table where mercury.mobil_user_table.username = userName;
END //
DELIMITER ;


DELIMITER // 
CREATE PROCEDURE CheckMobilPassword(IN userName varchar(20), IN passWord varchar(20))
BEGIN
	select (id) from mercury.mobil_user_table where mobil_user_table.username = userName 
    and mobil_user_table.password = passWord;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteMobilUser (IN userName varchar(20))
BEGIN
	set @var := (select id from mercury.mobil_user_table where mercury.mobil_user_table.username = userName);
    delete from mercury.mobil_user_table where mercury.mobil_user_table.id = @var;
END //
DELIMITER ;

