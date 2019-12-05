create table personnel_password_table(
id int primary key not null auto_increment,
username varchar(20) not null,
password varchar(20) not null,
foreign key (id) references personnel_table(id)
);
