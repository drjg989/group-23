//Создать таблицу employees
//- id. serial,  primary key,
//- employee_name. Varchar(50), not null
//Наполнить таблицу employee 70 строками.

create table employees (
id serial primary key,
employee_name varchar(50) not null
);

insert into employee (id,employee_name)
values (default ,'Александр Дросов');

--====================================

//Создать таблицу salary
//- id. Serial  primary key,
//- monthly_salary. Int, not null
//Наполнить таблицу salary 15 строками:

create table salary (
id serial primary key,
monthly_salary int not null
)
insert into salary (id,monthly_salary)
values (default , 1000);

--=======================================
//Создать таблицу employee_salary
//- id. Serial  primary key,
//- employee_id. Int, not null, unique
//- salary_id. Int, not null

create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null
);

insert into employee_salary(id,employee_id,salary_id)
values (default ,1,1);

--====================================================
Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
Поменять тип столба role_name с int на varchar(30)


create table roles (
id serial primary key ,
role_name int not null unique 
);
alter table roles 
alter column role_name type varchar(50)
using role_name::varchar(50) ;

insert into roles (id,role_name)
values (default,'Senior Automation QA engineer');

--====================================================
Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee (
id Serial  primary key,
employee_id Int not null unique ,
role_id Int not null,
foreign key (employee_id)
references employees (id),
foreign key (role_id)
references roles (id)
);
insert into roles_employee (id,employee_id,role_id)
values (default,41,14)