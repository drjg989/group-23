-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select  e.employee_name , s.monthly_salary
from employees e
join employee_salary es on e.id =es.employee_id
join selary s on s.id = es.salary_id ;

--============================================================================
--2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name , s.monthly_salary
from employees e 
join employee_salary es on e.id =es.employee_id 
join selary s on s.id = es.salary_id 
where s.monthly_salary < 2000;

--==============================================================================
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select e.employee_name , s.monthly_salary
from employees e 
full outer join employee_salary es on e.id =es.employee_id 
full outer join selary s on s.id = es.salary_id 
where employee_name is null;
--===============================================================================
--4 Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select e.employee_name , s.monthly_salary
from employees e 
full outer join employee_salary es on e.id =es.employee_id 
full outer join selary s on es.salary_id =s.id 
where  e.employee_name is null 
and s.monthly_salary < 2000
--================================================================================
--5. Найти всех работников кому не начислена ЗП.
select  e.employee_name , s.monthly_salary
from employees e 
full outer join employee_salary es on e.id =es.employee_id 
full outer join selary s on es.salary_id =s.id 
where s.monthly_salary is null 
--=================================================================================
-- 6. Вывести всех работников с названиями их должности.
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
--================================================================================
--7. Вывести имена и должность только Java разработчиков.
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name in ('Junior Java developer','Middle Java developer','Senior Java developer')

--или 

select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Java %'
--========================================================================================
--8. Вывести имена и должность только Python разработчиков
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Python %'
--=========================================================================================
-- 9. Вывести имена и должность всех QA инженеров.
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%QA %'
--======================================================================================
-- 10. Вывести имена и должность ручных QA инженеров.
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Manual QA %'
--=====================================================================================
-- 11. Вывести имена и должность автоматизаторов QA
select e.employee_name , r.role_name
from employees e
 join roles_employee re on e.id =re.employee_id 
join roles r on re.role_id = r.id 
where r.role_name ilike '%Automation QA %'
--====================================================================================
--12. Вывести имена и зарплаты Junior специалистов
select  e.employee_name , s.monthly_salary,r.role_name 
from employees e 
join employee_salary es on e.id =es.employee_id 
join selary s on es.salary_id =s.id 
join roles_employee re on e.id =re.employee_id 
join roles r on r.id =re.id 
where r.role_name ilike 'junior%'
--=======================================================================================
--13. Вывести имена и зарплаты Middle специалистов
select  e.employee_name , s.monthly_salary,r.role_name 
from employees e 
join employee_salary es on e.id =es.employee_id 
join selary s on es.salary_id =s.id 
join roles_employee re on e.id =re.employee_id 
join roles r on r.id =re.id 
where r.role_name ilike 'middle%'
--=========================================================================================
-- 14. Вывести имена и зарплаты Senior специалистов
select  e.employee_name , s.monthly_salary,r.role_name 
from employees e 
join employee_salary es on e.id =es.employee_id 
join selary s on es.salary_id =s.id 
join roles_employee re on e.id =re.employee_id 
join roles r on r.id =re.id 
where r.role_name ilike 'senior%'
--=========================================================================================
--15 .Вывести зарплаты Java разработчиков
select s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%java %'
--========================================================================================
--16. Вывести зарплаты Python разработчиков
select s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%python%'
--=======================================================================================
--17. Вывести имена и зарплаты Junior Python разработчиков
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%junior Python %'
--=======================================================================================
--18. Вывести имена и зарплаты Middle JS разработчиков
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%middle JavaScript %'
--========================================================================================
--19. Вывести имена и зарплаты Senior Java разработчиков
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%senior Java %'
--========================================================================================
--20. Вывести зарплаты Junior QA инженеров
select  s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '%junior % QA %'
--========================================================================================
--21. Вывести среднюю зарплату всех Junior специалистов
select  avg (s.monthly_salary) as average_salary_junior 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike 'junior %'
--========================================================================================
-- 22. Вывести сумму зарплат JS разработчиков
select  sum (s.monthly_salary) as average_salary_js 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% javascript %'
--========================================================================================
-- 23. Вывести минимальную ЗП QA инженеров
select  min(s.monthly_salary) as average_salary_qa 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% qa %'
--==========================================================================================
--24. Вывести максимальную ЗП QA инженеров
select  max (s.monthly_salary) as average_salary_qa 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% qa %'
--===========================================================================================
--25. Вывести количество QA инженеров
select  count (r.role_name) as role_count
from roles r
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% QA %'
--===========================================================================================
--26. Вывести количество Middle специалистов.
select  count (r.role_name) as role_count
from roles r
join roles_employee re on r.id =re.role_id 
where r.role_name ilike 'MIDDLE %'
--==========================================================================================
--27. Вывести количество разработчиков
select  count (r.role_name) as role_count
from roles r
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% developer'
--=========================================================================================
--28. Вывести фонд (сумму) зарплаты разработчиков
select  sum (s.monthly_salary) as average_salary_js 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join roles_employee re on r.id =re.role_id 
where r.role_name ilike '% developer'
--==========================================================================================
--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
order by  s.monthly_salary
--==========================================================================================
--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where s.monthly_salary  between 1700 and 2300
order by s.monthly_salary 
--==============================================================================================
 --31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where s.monthly_salary < 2300
order by s.monthly_salary 
--===============================================================================================
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select e.employee_name , s.monthly_salary,r.role_name 
from selary s
join roles r on s.id = r.id 
join employee_salary es on s.id =es.salary_id 
join employees e on e.id = es.employee_id 
join roles_employee re on r.id =re.role_id 
where s.monthly_salary in (1100,1500,2000)
order by s.monthly_salary