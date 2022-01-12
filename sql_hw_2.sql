--1.Создать таблицу employees
create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

--2. Наполнить таблицу employees 70 строками.
insert into employees (employee_name)
	values	('Антипин Станислав'),
			('Докучаев Артём'),
			('Машнёв Максим'),
			('Горулев Виталий'),
			('Тюрин Владислав'),
			('Лудяков Илья'),
			('Карпов Данил'),
			('Третьяков Артем'),
			('Бочаров Антон'),
			('Leticia_Long'),
			('Christopher_Kumro'),
			('Olive_Warne'),
			('Kenneth_Coleman'),
			('William_Owen'),
			('Richard_Laflam'),
			('Bettye_Bevington'),
			('Frida_Krieger'),
			('Rocky_Siddon'),
			('Veronica_Jones'),
			('Michael_Carrano'),
			('Joanne_Hubler'),
			('Thomas_Patel'),
			('Angelina_Venezia'),
			('Albert_Madrigal'),
			('Alice_Garner'),
			('Shirley_Hartung'),
			('Derrick_Gary'),
			('Pauline_Moody'),
			('John_Perez'),
			('Philip_Wilde'),
			('Debra_Holland'),
			('Amy_Mcmanus'),
			('Karl_Storie'),
			('Christine_Ackland'),
			('Joseph_Spradlin'),
			('James_Bradford'),
			('Sadie_Mcdougall'),
			('Gerald_Gross'),
			('Frederick_Bumbrey'),
			('Abbey_Tracy'),
			('Bryan_Miller'),
			('Anita_Frederick'),
			('Ernest_Wood'),
			('Mary_Tornow'),
			('Marion_Daniel'),
			('Carey_Biro'),
			('Brenda_Walstrum'),
			('Jack_Stensrud'),
			('Dennis_Carr'),
			('Jimmy_Robinson'),
			('Randall_Strop'),
			('Steven_Melancon'),
			('Donna_Mellish'),
			('Scott_Beaty'),
			('Enrique_Gibson'),
			('Stanley_Hickman'),
			('Gloria_Mercado'),
			('Michael_White'),
			('Milton_Russell'),
			('Tanya_Aki'),
			('Dawn_Dwelle'),
			('Rex_Wilson'),
			('Donald_Hayner'),
			('Elmer_Dixon'),
			('Steven_Horton'),
			('Fay_Akins'),
			('Jay_Biggs'),
			('Marie_Casto'),
			('Kenneth_Jackson'),
			('Sam_Williams');
		
--3.Создать таблицу salary
create table salary (
	id serial primary key,
	monthly_salary int not null
);

--4.Наполнить таблицу salary 16 строками
insert into salary (monthly_salary)
	VALUES		(1000),
				(1100),
				(1200),
				(1300),
				(1400),
				(1500),
				(1600),
				(1700),
				(1800),
				(1900),
				(2000),
				(2100),
				(2200),
				(2300),
				(2400),
				(2500);
--5.Создать таблицу employee_salary
CREATE TABLE employee_salary (
id Serial  primary key,
employee_id Int not null UNIQUE,
salary_id Int not NULL
);

--6.Наполнить таблицу employee_salary 40 строками
--в 10 строк из 40 вставить несуществующие employee_id
INSERT INTO EMPLOYEE_SALARY (employee_id, salary_id)
VALUES 	(1, 5),
		(2, 2),
		(3, 3),
		(4, 6),
		(5, 8),
		(6, 7),
		(7, 9),
		(8, 10),
		(9, 6),
		(10, 8),
		(11, 7),
		(12, 5),
		(13, 12),
		(14, 15),
		(15, 4),
		(16, 7),
		(17, 8),
		(18, 6),
		(19, 6),
		(20, 5),
		(21, 6),
		(22, 4),
		(23, 8),
		(24, 9),
		(25, 1),
		(26, 3),
		(27, 4),
		(28, 6),
		(29, 7),
		(30, 13),
		(71, 15),
		(72, 2),
		(73, 5),
		(74, 6),
		(75, 9),
		(76, 7),
		(77, 7),
		(78, 1),
		(79, 13),
		(80, 7);
	
--7.Создать таблицу roles
--id. Serial  primary key,
--role_name int, not null, unique
CREATE TABLE roles (
	id serial PRIMARY KEY,
	role_name int NOT NULL UNIQUE
);

--8.Поменять тип столба role_name с int на varchar(30)
ALTER TABLE roles
ALTER COLUMN role_name TYPE varchar(30) USING role_name::varchar(30)
; 

--9.Наполнить таблицу roles 20 строками
INSERT INTO roles (role_name)
VALUES	('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

--10.Создать таблицу roles_employee
--id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
CREATE TABLE roles_employee (
id serial PRIMARY KEY,
employee_id int NOT NULL UNIQUE,
role_id INt NOT NULL,
FOREIGN KEY (employee_id)
	REFERENCES employees (id),
FOREIGN KEY (role_id)
	REFERENCES roles (id)
);

--11.Наполнить таблицу roles_employee 40 строками
INSERT INTO roles_employee (employee_id, role_id)
VALUES	(1, 2),
		(2, 3),
		(3, 1),
		(4, 6),
		(5, 6),
		(6, 8),
		(7, 7),
		(8, 9),
		(9, 10),
		(10, 13),
		(11, 11),
		(12, 12),
		(13, 19),
		(14, 18),
		(15, 20),
		(16, 17),
		(17, 6),
		(18, 3),
		(19, 6),
		(20, 16),
		(21, 14),
		(22, 10),
		(23, 8),
		(24, 2),
		(25, 6),
		(26, 1),
		(27, 8),
		(28, 20),
		(29, 5),
		(30, 15),
		(31, 4),
		(32, 4),
		(33, 3),
		(34, 18),
		(35, 18),
		(36, 9),
		(37, 13),
		(38, 17),
		(39, 5),
		(40, 19);