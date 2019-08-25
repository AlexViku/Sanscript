USE new_database;

create table if not exists users (
id int primary key auto_increment,
username varchar(32) not null unique,
password varchar(255) not null,
email varchar(255) not null unique,
created_at datetime not null,
updated_at datetime not null
);

create table if not exists profiles (
id int primary key auto_increment,
user_id int not null,
name varchar(255),
last_name varchar(255),
photo_path varchar(255),
about text,
foreign key (user_id) references users(id)
);

drop trigger if exists new_profile;
drop trigger if exists update_user;
drop trigger if exists delete_profile;

delimiter $$ #оператор для сосздания триггеров, разделитель $$
create trigger new_profile after insert on users
for each row
begin
insert into profiles(user_id) values (new.id);
end $$
delimiter ; #нужен пробел между оператором и ;


delimiter $$
create trigger update_user after update on profiles
for each row
begin
update users set updated_at = now() where id = old.user_id;
end $$
delimiter ;


delimiter $$
create trigger delete_profile before delete on users
for each row
begin
delete from profiles where user_id = old.id;
end $$
delimiter ;

