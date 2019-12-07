USE mercury;

create table web_user_table(
id int primary key not null auto_increment,
username varchar(20) not null,
password varchar(20) not null
);

DELIMITER //
CREATE PROCEDURE AddNewWebUser(IN userName varchar(20), IN passWord varchar(20))
BEGIN
	insert into mercury.web_user_table values (null, userName, passWord);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CheckWebUser(IN userName varchar(20))
BEGIN
	select (id) from mercury.web_user_table where mercury.web_user_table.username = userName;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE DeleteWebUser(IN userName varchar(20))
BEGIN
	set @var := (select id from mercury.web_user_table where mercury.web_user_table.username = userName);
    	delete from  mercury.web_user_table where mercury.web_user_table.id = @var;
END //
DELIMITER ;


DELIMITER // 
CREATE PROCEDURE CheckWebPassword(IN userName varchar(20), IN passWord varchar(20))
BEGIN
	select id, username from mercury.web_user_table where web_user_table.username = userName and web_user_table.password = passWord;
DELIMITER ;
