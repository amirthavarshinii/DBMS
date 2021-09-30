-- Kaushik Holla
-- NUID: 001315097
-- CS5200 Data Base
-- Spring 2021

-- 1st Ans
select count(DISTINCT(worker_id)) 
from worker 
where DEPARTMENT='HR' and salary>250000; 

-- 2nd Ans
SELECT worker.last_name, Title.worker_title, Worker.department
from Worker INNER join Title on Worker.worker_id = Title.worker_ref_id
where worker.salary < ( select AVG(salary)
                       from Worker
                       group by worker_id);
					   
-- 3rd ans
select department, avg(salary) as AvgSal, count(*) as Num 
from worker 
group by DEPARTMENT;

-- 4th Ans
create view bonus_monthly_ AS
select worker_id, first_name, last_name, salary, joining_date, department, salary/12 as monthly
from Worker;

select bonus_monthly_.first_name ||' '||bonus_monthly_.last_name,  Title.WORKER_TITLE, (bonus_monthly_.monthly_salary+COALESCE(Bonus.bonus_amount, 0)) as 'MonthlyComp'
from bonus_monthly_ LEFT JOIN Bonus on bonus_monthly_.worker_id = Bonus.WORKER_REF_ID
left JOIN Title on bonus_monthly_.worker_id = Title.worker_ref_id
group by bonus_monthly_.worker_id;

-- 5th Ans
select UPPER(first_name) || ' ' || UPPER(last_name) 
from worker 
where worker_id NOT in (select DISTINCT(worker_ref_id)
                        from bonus);

-- 6th Ans
select first_name || ' ' || last_name 
from worker join title on title.WORKER_REF_ID = worker.WORKER_ID 
where WORKER_TITLE like '%Manager%';
					   
					