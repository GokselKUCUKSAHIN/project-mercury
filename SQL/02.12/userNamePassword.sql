create table personnel_password_table(
id int primary key not null auto_increment,
username varchar(20) not null,
password varchar(20) not null
);

DELIMITER //
CREATE PROCEDURE AddNewUserPassword(IN userName varchar(20), IN passWord varchar(20))
BEGIN
	insert into mercury.personnel_password_table values (null, userName, passWord);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteUserPassword(IN userName varchar(20))
BEGIN
	set @var := (select id from mercury.personnel_password_table where username = userName);
    delete from  mercury.personnel_password_table where id = @var;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CheckUsername(IN userName varchar(20))
BEGIN
	select * from mercury.personnel_password_table where username = userName;
END //
DELIMITER ;