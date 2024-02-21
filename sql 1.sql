use Bootcamp
select EmployeeID, FirstName + ' '+ LastName As FullName
from EmployeeDemographics

select * from EmployeeDemographics

select Gender,avg(age)
from EmployeeDemographics
group by Gender


select emp.EmployeeID,emp.FirstName,emp.Age,Salary
from EmployeeDemographics emp
left join EmployeeSalary sal
on emp.EmployeeID=sal.EmployeeID
left join warehouseEmployeeDemographics w
on emp.EmployeeID=w.employeeid

--partition by 


select FirstName,LastName,Age,Gender,
COUNT(gender) over ( partition by gender)As [total Gender]
from EmployeeDemographics

select demo.EmployeeID,FirstName,LastName,Age,Gender,Salary,
count(gender) over ( partition by gender) As TotalGender,
Avg(Salary) over (partition by Gender) as AvgSalary
from EmployeeDemographics demo
left join EmployeeSalary sal
on demo.EmployeeID=sal.EmployeeID








--cte


with cte_emp as
(select demo.EmployeeID,FirstName,LastName,Age,Gender,Salary,
count(gender) over ( partition by gender) As TotalGender,
Avg(Salary) over (partition by Gender) as AvgSalary
from EmployeeDemographics demo
join EmployeeSalary sal
on demo.EmployeeID=sal.EmployeeID
)

select FirstName,AvgSalary from cte_emp


--Temp Table

create table #temp_employee(
EmployeeId int,
Jobtitle varchar(50),
Salary int)

insert into #temp_employee values(
1001,'Hr',4500
)

select * from #temp_employee

update #temp_employee
set Jobtitle ='HR'
where EmployeeId=1001


create table #temp_employee2(
jobtitle varchar(50),
emloyeesperjob int,
Avgage int,
AvgSalary int )


insert into #temp_employee2 
select jobtitle,count(jobtitle),avg(age),avg(salary)
from EmployeeDemographics emp
join EmployeeSalary sal
on emp.EmployeeID=sal.EmployeeID
group by JobTitle


select * from #temp_employee2



--String functions - Trim,ltrim,rtrim,replace,substring,upper,lower

select * from employeeerrors

select lastName,REPLACE(lastname,'- Fired','')
from employeeerrors
 
 ;

 select substring(firstname,1,3),firstname
 from employeeDemographics

 --stored procedure


 create procedure test2
 as
 select * from 
employeeErrors

exec test2