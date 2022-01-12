SELECT * FROM employees;
SELECT * FROM roles_employee;
SELECT * FROM roles;
SELECT * FROM salary;
SELECT * FROM employee_salary;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
SELECT employee_name, monthly_salary FROM employee_salary es
JOIN employees e ON employee_id = e.id
JOIN SALARY s ON salary_id = s.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary FROM employee_salary es
JOIN EMPLOYEEs e ON employee_id = e.id
JOIN SALARY s ON salary_id = s.id
WHERE monthly_salary<2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- Т.к. требование не однозначное, то сделаем несколько вариантов.
-- 3.1. Выведем только те ЗП, которые НАЗНАЧЕНЫ НЕИЗВЕСТНЫМ работникам.
SELECT monthly_salary FROM employee_salary es
LEFT JOIN employees e ON e.id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
WHERE employee_name IS NULL;

--3.2. Выведем только те ЗП, которые ВООБЩЕ НИКОМУ НЕ НАЗНАЧЕНЫ.
SELECT monthly_salary FROM salary s
LEFT JOIN employee_salary es ON es.salary_id = s.id
WHERE employee_id IS NULL;

--3.3. Выведем оба варианта вместе.
SELECT monthly_salary FROM salary s
LEFT JOIN employee_salary es ON s.id = es.salary_id
LEFT JOIN employees e ON e.id = es.employee_id
WHERE e.id IS NULL;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT monthly_salary FROM employee_salary es
LEFT JOIN employees e ON e.id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
WHERE employee_name IS NULL AND monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
SELECT employee_name FROM employees e
LEFT JOIN employee_salary es ON e.id = es.employee_id
WHERE es.salary_id IS NULL;

-- 6. Вывести всех работников с названиями их должности.
SELECT employee_name, ROLE_name FROM ROLES_EMPLOYEE
JOIN EMPLOYEES ON employee_id = employees.id
JOIN ROLES ON role_id = roles.id;
	
-- 7. Вывести имена и должность только Java разработчиков.
SELECT employee_name, role_name FROM ROLES_EMPLOYEE
JOIN EMPLOYEES ON employees.id = employee_id
JOIN ROLES ON roles.id = role_id
WHERE role_name LIKE '%Java %';
	
-- 8. Вывести имена и должность только Python разработчиков.
SELECT employee_name, role_name FROM ROLES_EMPLOYEE
JOIN employees ON employees.id = employee_id
JOIN ROLES ON roles.id = role_id
WHERE role_name LIKE '%Python%';
		
-- 9. Вывести имена и должность всех QA инженеров.
SELECT employee_name, role_name FROM roles_employee 
JOIN employees ON employees.id = employee_id
JOIN ROLES ON roles.id = role_id
WHERE role_name LIKE '%QA%';
		
-- 10. Вывести имена и должность ручных QA инженеров.
SELECT employee_name, role_name FROM roles_employee 
JOIN EMPLOYEES ON employees.id = employee_id
JOIN roles ON roles.id = role_id
WHERE role_name LIKE '%Manual QA%';
	
-- 11. Вывести имена и должность автоматизаторов QA
SELECT employee_name, role_name FROM roles_employee
JOIN employees ON employees.id = employee_id
JOIN roles ON roles.id = role_id
WHERE role_name LIKE '%Automation QA%';
	
-- 12. Вывести имена и зарплаты Junior специалистов
-- 12.1 Зарплаты Junior специалистов, не зависимо есть ЗП или нет
SELECT employee_name, monthly_salary, role_name FROM roles r
LEFT JOIN roles_employee re ON r.id = re.role_id
LEFT JOIN employee_salary es ON re.employee_id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%Junior%';

-- 12.2 Имена и зарплаты Junior специалистов, у которых есть ЗП
SELECT employee_name, monthly_salary, role_name FROM roles r
LEFT JOIN roles_employee re ON r.id = re.role_id
LEFT JOIN employee_salary es ON re.employee_id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%Junior%' AND monthly_salary IS NOT null;

-- 13. Вывести имена и зарплаты Middle специалистов
-- 13.1 Всех Middle специалистов, которым назначена ЗП
SELECT employee_name, monthly_salary, role_name FROM roles_employee
JOIN employees ON employee_id = employees.id
JOIN roles ON role_id = roles.id
JOIN employee_salary ON employee_salary.employee_id = employees.id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%Middle%';

-- 13.2 Вообще всех Middle специалистов (с ЗП и без)
SELECT employee_name, monthly_salary, role_name FROM roles r
LEFT JOIN roles_employee re ON r.id = re.role_id
LEFT JOIN employee_salary es ON re.employee_id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
-- 14.1 Всех Senior специалистов, которым назначена ЗП
SELECT employee_name, monthly_salary, role_name FROM employee_salary
JOIN employees ON employee_salary.employee_id = employees.id
JOIN salary ON employee_salary.salary_id = salary.id
JOIN roles_employee ON roles_employee.employee_id = employees.id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Senior%';

--14.2 Вообще всех Senior специалистов (с ЗП и без)
SELECT employee_name, monthly_salary, role_name FROM roles r
LEFT JOIN roles_employee re ON r.id = re.role_id
LEFT JOIN employee_salary es ON re.employee_id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
JOIN employees e ON re.employee_id = e.id
WHERE role_name LIKE '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
-- 15.1 Только те Java разрабы, у кого есть ЗП
SELECT role_name, monthly_salary FROM roles_employee
JOIN roles ON role_id = roles.id
JOIN employee_salary ON employee_salary.employee_id = roles_employee.employee_id
JOIN salary ON salary_id = salary.id
WHERE role_name LIKE '%Java %';

-- 15.2 Все Java разрабы, с ЗП и без
SELECT role_name, monthly_salary FROM roles r
LEFT JOIN roles_employee re ON r.id = re.role_id
LEFT JOIN employee_salary es ON re.employee_id = es.employee_id
LEFT JOIN salary s ON es.salary_id = s.id
WHERE role_name LIKE '%Java %' 

-- 16. Вывести зарплаты Python разработчиков
SELECT monthly_salary, role_name FROM employee_salary
JOIN salary ON salary_id = salary.id
JOIN roles_employee ON roles_employee.employee_id = employee_salary.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
SELECT employee_name, monthly_salary, role_name FROM roles_employee
JOIN employees ON roles_employee.employee_id = employees.id
JOIN roles ON  roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
SELECT employee_name, monthly_salary, role_name FROM employees
JOIN roles_employee ON roles_employee.employee_id = employees.id
JOIN roles ON roles_employee.role_id = roles.id
JOIN employee_salary ON roles_employee.employee_id = employee_salary.employee_id
JOIN salary ON employee_salary.salary_id = salary.id
WHERE role_name LIKE '%Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
SELECT employee_name, monthly_salary, role_name FROM salary
JOIN employee_salary ON salary_id = salary.id
JOIN employees ON employee_salary.employee_id = employees.id
JOIN roles_employee ON roles_employee.employee_id = employee_salary.employee_id
JOIN roles ON roles_employee.role_id = roles.id
WHERE role_name LIKE '%Senior Java %';

-- 20. Вывести зарплаты Junior QA инженеров
SELECT role_name, monthly_salary FROM roles_employee
JOIN roles ON roles.id = role_id
JOIN employees ON roles_employee.employee_id = employees.id
JOIN employee_salary ON employee_salary.employee_id = employees.id
JOIN salary ON salary.id = salary_id
WHERE role_name LIKE 'Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
SELECT avg (monthly_salary) AS Average_salary_Junior FROM employees e
JOIN roles_employee re ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
WHERE role_name like 'Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
SELECT sum (monthly_salary) SUM_monthly_salary FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON s.id = es.salary_id
WHERE role_name LIKE '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
SELECT min (monthly_salary) Min_monthly_salary_QA FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
WHERE role_name LIKE '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
SELECT max (monthly_salary) MAX_monthly_salary_QA FROM employees e
JOIN roles_employee re ON re.employee_id = e.id
JOIN roles r ON r.id = re.role_id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON s.id = es.salary_id
WHERE role_name LIKE '%QA%';

-- 25. Вывести количество QA инженеров
SELECT count (role_name) count_QA FROM roles_employee re
JOIN roles r ON re.role_id = r.id
WHERE role_name LIKE '%QA%';

-- 26. Вывести количество Middle специалистов.
SELECT count (role_name) Count_Middle FROM roles_employee re
JOIN roles r ON re.role_id = r.id
WHERE role_name LIKE '%Middle%';

-- 27. Вывести количество разработчиков
SELECT count (role_name) Count_Developers FROM roles_employee re
JOIN roles r ON re.role_id = r.id
WHERE role_name LIKE '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
SELECT sum (monthly_salary) salary_fund_developer FROM roles_employee re
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = re.employee_id
JOIN salary s ON s.id = es.salary_id
WHERE role_name LIKE '%developer%'

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
SELECT employee_name, role_name, monthly_salary FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
ORDER BY monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
SELECT employee_name, ROLE_name, monthly_salary FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
WHERE monthly_salary BETWEEN 1700 AND 2300
ORDER BY monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
SELECT employee_name, role_name, monthly_salary FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
WHERE monthly_salary <2300
ORDER BY monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
SELECT employee_name, role_name, monthly_salary FROM roles_employee re
JOIN employees e ON re.employee_id = e.id
JOIN roles r ON re.role_id = r.id
JOIN employee_salary es ON es.employee_id = e.id
JOIN salary s ON es.salary_id = s.id
WHERE monthly_salary in (1100, 1500, 2000)
ORDER BY monthly_salary;
